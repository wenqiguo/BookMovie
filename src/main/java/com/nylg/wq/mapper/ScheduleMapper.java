package com.nylg.wq.mapper;

import com.nylg.wq.pojo.Schedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScheduleMapper {
    int deleteByPrimaryKey(Long scheduleId);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    Schedule selectByPrimaryKey(Long scheduleId);

    List<Schedule> selectScheduleByPage(Integer scheduleState);

    int updateByPrimaryKeySelective(Schedule record);

    int updateByPrimaryKey(Schedule record);

    List<Schedule> findScedulePageByMovieName(String movieName);

    List<Schedule> findSchudelByMovieId(Long MovieId);
    //电影票
    int saleTicket(@Param(value = "num") int num,@Param(value = "sceduleId") Long sceduleId);
    //增加
    int addTicket(@Param(value = "sceduleId") Long sceduleId);

    List<Schedule> findSchudelByMovieAndDate(@Param(value = "movieId") Long movieId,@Param(value = "date") String date);
}