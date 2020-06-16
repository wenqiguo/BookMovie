package com.nylg.wq.controller;

import com.github.pagehelper.PageInfo;
import com.nylg.wq.pojo.Cinema;
import com.nylg.wq.pojo.Hall;
import com.nylg.wq.pojo.Movie;
import com.nylg.wq.pojo.Schedule;
import com.nylg.wq.service.CinemaService;
import com.nylg.wq.service.HallService;
import com.nylg.wq.service.MovieServices;
import com.nylg.wq.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    @Autowired
    private MovieServices movieServices;

    @Autowired
    private CinemaService cinemaService;

    @Autowired
    private HallService hallService;

    @Autowired
    private ScheduleService scheduleService;




    @RequestMapping("/selectScheduleByMovieName")
    @ResponseBody
    public Map selectScheduleByMovieName(@RequestParam(value = "page",defaultValue = "1") Integer page,
                                         @RequestParam(value = "limit",defaultValue = "10") Integer limit,
                                         @RequestParam(value = "movieName") String movieName){
        Map m = new HashMap();

        PageInfo<Schedule> pageInfo = scheduleService.findScedulePageByMovieName(page,limit,movieName);
        m.put("code",0);
        m.put("count",pageInfo.getTotal());
        m.put("data",pageInfo.getList());
        return m;

    }
    /**
     * 对场次下架
     * @param scheduleId
     * @return
     */
    @RequestMapping("/deleteSchedule")
    @ResponseBody
    public Map deleteSchedule(@RequestParam("scheduleId") Long scheduleId){
        Map map = new HashMap();
        Date t = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String today = df.format(t);
        Schedule schedule = scheduleService.selectScheduleById(scheduleId);
        int remain = scheduleService.selectScheduleById(scheduleId).getScheduleSeatremain();
        String time = schedule.getScheduleStartTime();
        try {
            Long t1 = df.parse(time).getTime();
            Long t2 = df.parse(today).getTime();
            //如果场次没有过时且有售出
            if (t2<t1&&remain<144){
                map.put("type","error");
                map.put("msg","该场次正在售出，不可下架");
                return map;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int i = scheduleService.deleteSchedule(scheduleId);
        if (i<0){
            map.put("type","error");
            map.put("msg","下架失败");
            return map;
        }
        map.put("type","success");
        map.put("msg","下架成功");
        return map;
    }


    @RequestMapping("/findScheduleById")
    @ResponseBody
    public Map findScheduleById(@RequestParam(value = "scheduleId") Long scheduleId ){
        Map m = scheduleService.selectByPrimaryKey(scheduleId);
        return m;
    }




    @RequestMapping("/SelectByCinemaAndMovieId")
    @ResponseBody
    public Map  SelectByCinemaAndMovieId(@RequestParam(value = "movieId") Long movieId,
                                         @RequestParam(value = "cinemaId") Long cinemaId,
                                         @RequestParam(value = "date") int date ){


        Map map = new HashMap();
        Cinema cinema = cinemaService.findCinemaById(cinemaId);
        Movie movie = movieServices.selectById(movieId);
        List<Schedule> scheduleList = scheduleService.findSchudelByMovieAndDate(movieId,date);
        List<Schedule> schedules = new ArrayList<>();
        //判断该场次是否属于此影院
        for (Schedule schedule:scheduleList){
            if (hallService.findCinemaByHallId(schedule.getHallId()).getCinemaName().equals(cinema.getCinemaName())){
                schedules.add(schedule);
            }
        }
        List<Hall> halls = new ArrayList<>();
        for (Schedule s : schedules){
            Hall hall = hallService.selectByPrimaryKey(s.getHallId());
            s.setScheduleHall(hall);
            halls.add(hall);
        }
        map.put("cinema",cinema);
        map.put("movie",movie);
        map.put("schedules",schedules);
        //通过电影id，放映状态以及日期查找出所有的schedule集合
        //通过影院id可以查找出所有影厅
        return map;
    }
    /**
     * 通过上映或下架分页查询
     * @param page
     * @param limit
     * @param scheduleState
     * @return
     */

    @RequestMapping("/findAllScheduleByState")
    @ResponseBody
    public Map findAllScheduleByState(@RequestParam(value = "page",defaultValue = "1") Integer page,
                                                     @RequestParam(value = "limit",defaultValue = "10") Integer limit,
                                                     @RequestParam(value = "schedule_state") Integer scheduleState){
        Map ret = new HashMap<>();
        PageInfo<Schedule> pageInfo = scheduleService.findScheduleByPage(page,limit,scheduleState);

        ret.put("code",0);
        ret.put("count",pageInfo.getTotal());
        ret.put("data",pageInfo.getList());

        return ret;

    }

    /**
     * 添加放映
     * @return
     */
    @RequestMapping("/insertSchedule")
    @ResponseBody
    public Map<String,String>  insertSchedule(@RequestParam(value = "movieName",required = false) String movieName,
                                              @RequestParam(value="cinemaName",required = false) String cinemaName,
                                              @RequestParam(value = "hallName",required = false) String hallName,
                                              @RequestParam(value = "scheduleStartTime",required = false) String scheduleStartTime,
                                              @RequestParam(value = "schedulePrice",required = false) int schedulePrice
                                             ){
        Schedule schedule = new Schedule();
        //影院地址
        Cinema cinema = cinemaService.findCinemaByName(cinemaName);
        Long cinemaId = cinema.getCinemaId();
        //通过影院id和影厅名字查找影厅的id
        Hall hall = hallService.findHallByTwo(cinemaId,hallName);
        Movie movie = movieServices.selectMovieByName(movieName);
        schedule.setHallId(hall.getHallId());
        schedule.setMovieId(movie.getMovieId());
        schedule.setScheduleSeatremain(hall.getHallCapacity());
        schedule.setSchedulePrice(schedulePrice);
        schedule.setScheduleState(1);
        schedule.setScheduleStartTime(scheduleStartTime);
        Map<String,String> ret = new HashMap<>();
        int i = scheduleService.insertSchedule(schedule);
        if (i<0){
            ret.put("type","error");
            ret.put("msg","添加失败！");
            return ret;
        }
        ret.put("type","success");
        ret.put("msg","添加成功！");
        return ret;

    }

    /**
     * 查询所有场次
     * @return
     */
    @RequestMapping("/findAllSchedule")
    @ResponseBody
    public Map<Object,Object> findAllSchedule(){
        Map<Object,Object> map = new HashMap<>();
        //得到所有热映电影名字
        List<Movie>  movieList = movieServices.selectMovieByState(1);
        List<String> movieNames = new ArrayList<>();
        for (Movie movie:movieList){
            movieNames.add(movie.getMovieCname());
        }
        //得到所有影院名字
        List<Cinema> cinemaList = cinemaService.findAllCinema();
        List<String> cinemaNames = new ArrayList<>();
        for (Cinema cinema : cinemaList){
            cinemaNames.add(cinema.getCinemaName());
        }
        //key代表影院名字，value代表对应的影厅名字
        Map<String,List<String>> cinemaAndHalls = new HashMap<>();
        for (int i=0;i<cinemaList.size();i++){
            //遍历得到每个电影院id
            Long id = cinemaList.get(i).getCinemaId();
            //通过名字-》id-》对应的放映厅集合
            List<String> hallName = hallService.findHallByCinemaId(id);
            cinemaAndHalls.put(cinemaList.get(i).getCinemaName(),hallName);
        }
        System.out.println(cinemaAndHalls);
        map.put("movieNames",movieNames);
        map.put("cinemaNames",cinemaNames);
        map.put("cinemaAndHalls",cinemaAndHalls);
        return map;

    }
}
