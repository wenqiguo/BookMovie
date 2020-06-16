package com.nylg.wq.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nylg.wq.mapper.*;
import com.nylg.wq.pojo.*;
import com.nylg.wq.service.HallService;
import com.nylg.wq.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private ScheduleMapper scheduleMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private CinemaMapper cinemaMapper;

    @Autowired
    private HallService hallService;

    @Autowired
    private MovieMapper movieMapper;


    @Override
    public Map selectByPrimaryKey(Long scheduleId) {
        Map m = new HashMap();
        Schedule schedule = scheduleMapper.selectByPrimaryKey(scheduleId);
        Movie movie = movieMapper.selectByPrimaryKey(schedule.getMovieId());
        Hall hall =hallService.selectByPrimaryKey(schedule.getHallId());
        Cinema cinema = cinemaMapper.selectByPrimaryKey(hall.getCinemaId());
        schedule.setScheduleMovie(movie);
        schedule.setScheduleCinema(cinema);
        schedule.setScheduleHall(hall);
        //通过场次id查询该场次的所有订单
        List<Order> orders = orderMapper.findSeatByOrder(scheduleId);
        m.put("schedule",schedule);
        m.put("orders",orders);
        return m;
    }

    @Override
    public int saleTicket(Long scheduleId, int num) {
        return scheduleMapper.saleTicket(num,scheduleId);
    }

    @Override
    public int addTicket(Long sceduleId) {
        return scheduleMapper.addTicket(sceduleId);
    }

    @Override
    public Schedule selectScheduleById(Long scheduleId) {
        return scheduleMapper.selectByPrimaryKey(scheduleId);
    }

    @Override
    public int deleteSchedule(Long scheduleId) {

        return scheduleMapper.deleteByPrimaryKey(scheduleId);
    }

    @Override
    public PageInfo<Schedule> findScedulePageByMovieName(Integer page, Integer limit, String movieName) {
        PageHelper.startPage(page,limit);
        List<Schedule> schedules = scheduleMapper.findScedulePageByMovieName(movieName);
        for (Schedule s : schedules){
            Cinema cinema = hallService.findCinemaByHallId(s.getHallId());
            Hall hall = hallService.selectByPrimaryKey(s.getHallId());
            Movie movie = movieMapper.selectByPrimaryKey(s.getMovieId());
            s.setScheduleCinema(cinema);
            s.setScheduleHall(hall);
            s.setScheduleMovie(movie);
            List<Order> orders = orderMapper.findSeatByOrder(s.getScheduleId());
            s.setOrderCount(orders.size());
            int totalPrice = 0;
            for (Order o : orders){
                totalPrice+=o.getOrderPrice();
            }
            s.setSchedulePrice(s.getSchedulePrice());
            s.setTotalPrice(totalPrice);
        }
        PageInfo<Schedule> schedulePageInfo = new PageInfo<>(schedules);
        return schedulePageInfo;
    }


    @Override
    public int insertSchedule(Schedule schedule) {
        return scheduleMapper.insert(schedule);
    }

    @Override
    public PageInfo<Schedule> findScheduleByPage(Integer page, Integer limit, Integer scheduleState) {
        PageHelper.startPage(page,limit);
        List<Schedule> schedules = scheduleMapper.selectScheduleByPage(scheduleState);
        for (Schedule s : schedules){
            Cinema cinema = hallService.findCinemaByHallId(s.getHallId());
            Hall hall = hallService.selectByPrimaryKey(s.getHallId());
            Movie movie = movieMapper.selectByPrimaryKey(s.getMovieId());
            s.setScheduleCinema(cinema);
            s.setScheduleHall(hall);
            s.setScheduleMovie(movie);
            List<Order> orders = orderMapper.findSeatByOrder(s.getScheduleId());
            s.setOrderCount(orders.size());
            int totalPrice = 0;
            for (Order o : orders){
                totalPrice+=o.getOrderPrice();
            }
            s.setSchedulePrice(s.getSchedulePrice());
            s.setTotalPrice(totalPrice);
        }
        PageInfo<Schedule> schedulePageInfo = new PageInfo<>(schedules);
        return schedulePageInfo;
    }

    @Override
    public List<Schedule> findSchudelByMovieId(Long MovieId) {
        return scheduleMapper.findSchudelByMovieId(MovieId);
    }


    public List<Schedule> findSchudelByMovieAndDate(Long movieId, int date) {
        String dates[] = new String[3];
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String da = sdf.format(d);

        dates[0] = da;
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(d);
        calendar.add(calendar.DATE,1);
        d=calendar.getTime();
        String dateString = sdf.format(d);
        dates[1] = dateString;
        calendar.add(calendar.DATE,1);
        d=calendar.getTime();
        String dateString2 = sdf.format(d);
        dates[2] = dateString2;
        return scheduleMapper.findSchudelByMovieAndDate(movieId,dates[date]);
    }

}
