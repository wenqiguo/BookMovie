package com.nylg.wq.service.impl;

import com.nylg.wq.mapper.CommentMapper;
import com.nylg.wq.mapper.MovieMapper;
import com.nylg.wq.mapper.UserMapper;
import com.nylg.wq.pojo.Comment;
import com.nylg.wq.pojo.Movie;
import com.nylg.wq.pojo.User;
import com.nylg.wq.service.MovieServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MovieServiceImpl implements MovieServices {
    @Autowired
    private MovieMapper movieMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public int insertMovie(Movie movie) {
        return movieMapper.insert(movie);
    }

    @Override
    public List<Movie> LookMovieList() {
        return movieMapper.selectMovieList();
    }

    @Override
    public int updateByPrimaryKeySelective(Movie movie) {
        return movieMapper.updateByPrimaryKeySelective(movie);
    }


    @Override
    public Movie selectById(Long movieId) {
        //通过id得到电影对象
        Movie movie = movieMapper.selectByPrimaryKey(movieId);
        List<Comment> comments = commentMapper.findCommentsByMovieId(movieId);
        for (Comment com : comments){
            User user = userMapper.selectByPrimaryKey(com.getUserId());
            com.setCommentUser(user);
        }
        movie.setUserComments(comments);
        return movie;
    }

    @Override
    public List<Movie> selectMovieByState(Integer movieState) {

        return movieMapper.selectMovieByState(movieState);
    }

    @Override
    public Movie selectMovieByName(String movieCname) {
        return movieMapper.selectMovieByName(movieCname);
    }


    //根据分类查询所有的电影
    @Override
    public Map<String, List<Movie>> selectMovieByKind() {
        Map<String,List<Movie>> map = new HashMap<>();
        List<Movie> movieList = movieMapper.selectMovieByState(1);
        map.put("movieList",movieList);
        return null;
    }

    @Override
    public List<Movie> selectMovieByScore() {
        return movieMapper.selectMovieByScore();
    }

    @Override
    public List<Movie> selectMovieByDate() {
        return movieMapper.selectMovieByDate();
    }

    @Override
    public List<Movie> findMovieBySelect(String type, String country, String date) {
        if (type.equals("全部")|| type.equals("0")){
            type = "";
        }
        if (date.equals("全部")|| date.equals("0")){
            date = "";
        }
        if (country.equals("全部")||country.equals("0")){
            country="";
        }
        return movieMapper.findMovieBySelect(type,country,date);
    }

    @Override
    public int updateTotallTickets( int price,Long movieId) {
        return movieMapper.updateTotallTickets(price,movieId);
    }

    @Override
    public int delTotallTickets(int price, Long movieId) {
        return movieMapper.delTotallTickets(price,movieId);
    }

    @Override
    public List<Movie> findAllMovie() {
        List<Movie> movieList = movieMapper.selectMovieByState(1);
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
        if (movieList.size()<=10){
            return movieList;
        }else {
            return movieList.subList(0,10);
        }

    }

    @Override
    public List<Movie> findMovieByType(String type) {
        return movieMapper.findMovieByType(type);
    }


}
