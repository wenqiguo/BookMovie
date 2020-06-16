package com.nylg.wq.controller;

import com.nylg.wq.pojo.Cinema;
import com.nylg.wq.pojo.Comment;
import com.nylg.wq.pojo.Movie;
import com.nylg.wq.pojo.Schedule;
import com.nylg.wq.service.CinemaService;
import com.nylg.wq.service.HallService;
import com.nylg.wq.service.MovieServices;
import com.nylg.wq.service.ScheduleService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/movie")
public class MovieController {
    @Autowired
    private MovieServices movieServices;
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private HallService hallService;
    @Autowired
    private CinemaService cinemaService;


    @RequestMapping("/findAllMovies")
    @ResponseBody
    public Map findAllMovies(){
        Map m = new HashMap();
        List<Movie> TenMovie = movieServices.findAllMovie();
        String[] type = {"爱情","喜剧","动画","剧情","惊悚","科幻","动作","悬疑","犯罪","冒险"};
        List<Integer> TypeTickets = new ArrayList<>();
        //得到所有类型，以及各类型票房数量
        for (String s : type){
            //得到某个类型所有电影
            List<Movie> oneTypeMovie = movieServices.findMovieByType(s);
            int tickets =0;
            for (Movie t : oneTypeMovie){
                tickets+=t.getMovieTotalticket();
            }
            //得到某个类型所有电影的票房
            TypeTickets.add(tickets);
        }
        m.put("movieOrder",TenMovie);
        m.put("type",type);
        m.put("TypeTickets",TypeTickets);

        //获取排行前十的电影名字和票房  从电影表查
        //获取电影某一类型的电影名字
        return m;
    }


    /**
     * 有筛选条件的查询
     */
    @RequestMapping("/findMoviesByType")
    @ResponseBody
    public Map findMoviesBySelect(@RequestParam (value = "type",required = false,defaultValue = "全部")String type,
                                  @RequestParam(value = "area",required = false,defaultValue = "全部") String area,
                                  @RequestParam(value = "year",required = false,defaultValue = "全部") String year){
        List<Movie> movieList = movieServices.findMovieBySelect(type,area,year);
        Map ret = new HashMap();
        ret.put("data",movieList);
        return ret;

    }
    /**
     * 分类查看所有电影
     * @param order 分类:热门，时间，评分
     * @return
     */

    @ResponseBody
    @RequestMapping("/findMoviesByKinds")
    public Map findMoviesByKinds(@RequestParam(value = "order",defaultValue = "热门") String order){
        //首先查询所有在上映的电影
        //热门返回全部，时间就按照降序排列，评分就按照评分降序
        Map map = new HashMap();
        List<Movie> movieList = movieServices.selectMovieByState(1);
        List<Movie> movieScoreList = movieServices.selectMovieByScore();
        List<Movie> movieDateList = movieServices.selectMovieByDate();
        Collections.sort(movieList, new Comparator<Movie>() {
            @Override
            public int compare(Movie o1, Movie o2) {
                if (o1.getMovieTotalticket()>o2.getMovieTotalticket()){
                    return -1;
                }
                if (o1.getMovieTotalticket()==o2.getMovieTotalticket()){
                    return 0;
                }
                return 1;
            }
        });
        if (order.equals("热门")){
            map.put("data",movieList);
        }else if (order.equals("评价")){
            map.put("data",movieScoreList);
        }else {
            map.put("data",movieDateList);
        }
        return map;
    }

    /**
     * 去movieList.jsp
     *
     */
    @RequestMapping("/movieList")
    public String toMovieList(){
        return "movieList";
    }
    @RequestMapping("/center")
    public String centerPage(){
        return "center";
    }

    /**
     * 根据id查询电影
     */
    @RequestMapping("/findMovieById")
    @ResponseBody
    public Map findMovieById(@RequestParam(value = "movieId") Long movieId){

        //通过id查询得到电影
        Map ret = new HashMap();
        Movie movie = movieServices.selectById(movieId);
        List<Comment> commentList = movie.getUserComments();
        movie.setUserComments(null);
        ret.put("data",movie);
        ret.put("commentList",commentList);


        return ret;


    }
    @RequestMapping("/findCinemaByMovieAndDate")
    @ResponseBody
    public Map findMovieById(@RequestParam(value = "movieId",required = false) Long movieId,
                             @RequestParam(value ="date" ,defaultValue ="0" ,required =false )int date){
        Map ret = new HashMap();
        List<Schedule> scheduleList = scheduleService.findSchudelByMovieAndDate(movieId,date);
        List<Cinema> cinemas = new ArrayList<>();
        for (Schedule s :scheduleList) {
            Cinema cinema = hallService.findCinemaByHallId(s.getHallId());
            s.setScheduleCinema(cinema);
            if (!cinemas.contains(cinema)) {
                cinemas.add(cinema);
            }
        }
        ret.put("cinemas",cinemas);
        ret.put("scheduleList",scheduleList);
        return ret;
    }
    /**
     * 修改电影状态为即将上映
     */
    @RequestMapping("/deleteMovie")
    @ResponseBody
    public Map<String,String> deleteMovie(Long movieId){
        Movie m = movieServices.selectById(movieId);
        m.setMovieState(0);
        Map<String,String> ret = new HashMap<>();
        int i = movieServices.updateByPrimaryKeySelective(m);
        if (i>0){
            ret.put("type","success");
            ret.put("msg","下架成功！");
        }else{
            ret.put("type","error");
            ret.put("msg","下架失败！");

        }
            return ret;

    }


    /**
     * 电影修改
     */
    @RequestMapping("/updateMovie")
    @ResponseBody
    public Map<String,String> updateMovie(@RequestParam(value = "file",required = false) MultipartFile file,
                                          Movie movie,
                                          HttpServletRequest request){

        if (file!=null){
            String path = request.getSession().getServletContext().getRealPath("static/static/movies/"+movie.getMovieCname()+"/picture/");
            File target = new File(path);
            if (!target.exists()){
                target.mkdirs();
            }
            String oldName = file.getOriginalFilename();
            String type = oldName.substring(oldName.lastIndexOf(".")+1,oldName.length());
            String newName = System.currentTimeMillis()+"."+type;
            movie.setMoviePicture("static/static/movies/"+movie.getMovieCname()+"/picture/"+newName);
            try {
                file.transferTo(new File(target,newName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        int i = movieServices.updateByPrimaryKeySelective(movie);
        Map<String,String> map = new HashMap<>();
        if (i>0){
            map.put("type","success");
            map.put("message","修改成功!");

        }else {
            map.put("type","error");
            map.put("message","修改失败!");
        }

        return map;
    }
    /**
     * findMovieByName
     */
    @RequestMapping("/findMovieByName")
    public String findMovieByName(@RequestParam(value ="searchMovie",required = false) String searchMovie, Model model){
        if (searchMovie.equals("")){
            return "redirect:/movie/movieList.do";
        }else {
            Movie movie = movieServices.selectMovieByName(searchMovie);
            if (movie==null){
                return "redirect:/movie/movieList.do";
            }else {
                Long id = movie.getMovieId();
                model.addAttribute("movieId",id);
                return "redirect:/movie/movieDetail.do";
            }

        }


    }
    /**
     * 跳转电影电影详情页
     */
    @RequestMapping("/movieDetail")
    public String movieDetail(String movieId,Model model){
        model.addAttribute("movieId",movieId);
        return "movieDetail";
    }

    /**
     * 查看后台正在上映的电影
     * 展示前台正在热映与即将上映的电影
     */
    @RequestMapping("/findTotalMovies")
    @ResponseBody
    public Map<String,List<Movie>> findTotalMovies(){
        Map<String,List<Movie>> map = new HashMap<>();
        List<Movie> onMovies = movieServices.selectMovieByState(1);
        List<Movie> onMovie2 = movieServices.selectMovieByState(1);
        List<Movie> comingMovies = movieServices.selectMovieByState(0);
        map.put("data",onMovies);
        map.put("data1",comingMovies);
        Collections.sort(onMovie2, new Comparator<Movie>() {
            @Override
            public int compare(Movie o1, Movie o2) {
                if (o1.getMovieTotalticket()>o2.getMovieTotalticket()){
                    return -1;
                }
                if (o1.getMovieTotalticket()==o2.getMovieTotalticket()){
                    return 0;
                }
                return 1;
            }
        });
       map.put("data2",onMovie2);
        return map;
    }

    /**
     * 多个文件上传，接收文件要在第一个
     * @param file
     * @param movie
     * @param request
     * @param
     * @return
     */
    @RequestMapping("/insertMovie")
    @ResponseBody
    public Map<String,String> insertMovie(@RequestParam(value="file",required = false) MultipartFile file,
                                          Movie movie,
                                          HttpServletRequest request
                                          ){
        Map<String,String> ret = new HashMap<String,String>();
        Movie movie1 = movieServices.selectMovieByName(movie.getMovieCname());
        if (movie1!=null){
         ret.put("type","error");
         ret.put("msg","电影已经存在，请勿二次添加");
         return ret;
        }
        if (movie.getMovieDetail().length()>255){
            ret.put("type","error");
            ret.put("msg","电影详情文字过长，请简要说明");
            return ret;
        }

      if(file.getSize()>10485760){
          ret.put("type","error");
          ret.put("msg","文件大小不得大于10M");
           return ret;
      }
      String oldName = file.getOriginalFilename();
      String type = oldName.substring(oldName.lastIndexOf(".")+1,oldName.length());
      if (!"jpg,jpeg,gif,png".toUpperCase().contains(type.toUpperCase())){
          ret.put("type","error");
          ret.put("msg","请添加包含jpg,jpeg,gif,pang为后缀的图片");
          return ret;
      }
      //上传图片要存储的路径,电影海报路径为movies/电影名字/picture/图片
        String path = request.getSession().getServletContext().getRealPath("/static/static/movies/"+movie.getMovieCname()+"/picture/");
        File target = new File(path);
        if (!target.exists()){
            target.mkdirs();
        }

      String newName = System.currentTimeMillis()+"."+type;

        try {
            file.transferTo(new File(target,newName));
        } catch (IOException e) {
            e.printStackTrace();
            ret.put("type","error");
            ret.put("msg","文件保存异常");
            return ret;

        }
        //电影海报的项目绝对路径
        movie.setMoviePicture("static/static/movies/"+movie.getMovieCname()+"/picture/"+newName);
        //默认添加时，将电影状态设置为1，代表热映
        movie.setMovieState(1);
        movie.setMovieTotalticket(0);

        int i = movieServices.insertMovie(movie);
        if (i<0){
            ret.put("type","error");
            ret.put("msg","添加失败");
            return ret;
        }

        ret.put("type","success");
        ret.put("msg","添加成功");

        return ret;

    }
}
