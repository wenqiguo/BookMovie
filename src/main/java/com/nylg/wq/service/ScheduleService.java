package com.nylg.wq.service;

import com.github.pagehelper.PageInfo;
import com.nylg.wq.pojo.Schedule;

import java.util.List;
import java.util.Map;


public interface ScheduleService {
    int insertSchedule(Schedule schedule);
    PageInfo<Schedule> findScheduleByPage(Integer page,Integer limit,Integer scheduleState);
    List<Schedule> findSchudelByMovieId(Long MovieId);
    List<Schedule> findSchudelByMovieAndDate(Long movieId,int date);
    Map selectByPrimaryKey(Long scheduleId);
    int saleTicket(Long scheduleId,int num);
    int addTicket(Long sceduleId);
    Schedule selectScheduleById(Long scheduleId);
    int deleteSchedule(Long scheduleId);
    PageInfo<Schedule> findScedulePageByMovieName(Integer page,Integer limit,String movieName);
}
