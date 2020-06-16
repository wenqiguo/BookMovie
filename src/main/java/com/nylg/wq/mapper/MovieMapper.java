package com.nylg.wq.mapper;

import com.nylg.wq.pojo.Movie;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MovieMapper {
    int deleteByPrimaryKey(Long movieId);

    int insert(Movie record);

    int insertSelective(Movie record);

    Movie selectByPrimaryKey(Long movieId);

    //查看所有的电影
    List<Movie> selectMovieList();
    //根据电影状态查看电影
    List<Movie> selectMovieByState(Integer movieState);
    //按照电影评分降序排列所有在线电影
    List<Movie> selectMovieByScore();
    List<Movie> selectMovieByDate();
    //根据类型查找
    List<Movie> findMovieBySelect(@Param(value = "movieType") String movieType, @Param(value = "movieCountry") String movieCountry,@Param(value = "moviePutdate") String moviePutdate);

    Movie selectMovieByName(String movieCname);

    int updateByPrimaryKeySelective(Movie record);

    int updateByPrimaryKey(Movie record);
    //修改票房
    int updateTotallTickets(@Param(value = "price") int price,@Param(value = "movieId") Long movieId);
    //减少票房
    int delTotallTickets(@Param(value = "price") int price,@Param(value = "movieId") Long movieId);
    List<Movie> findMovieByType(@Param(value = "type") String type);
}