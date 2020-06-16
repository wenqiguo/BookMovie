package com.nylg.wq.service;

import com.nylg.wq.pojo.Movie;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface MovieServices {
    public int insertMovie(Movie movie);
    public List<Movie> LookMovieList();
    public int updateByPrimaryKeySelective(Movie movie);
    Movie selectById(Long movieId);
    List<Movie> selectMovieByState(Integer movieState);
    Movie selectMovieByName(String movieCname);
    Map<String,List<Movie>> selectMovieByKind();
    List<Movie> selectMovieByScore();
    List<Movie> selectMovieByDate();
    List<Movie> findMovieBySelect(String type,String country,String date);
    int updateTotallTickets(int price,Long movieId);
    int delTotallTickets(int price,Long movieId);
     List<Movie> findAllMovie();
    List<Movie> findMovieByType(String type);

}
