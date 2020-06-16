package com.nylg.wq.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nylg.wq.mapper.*;
import com.nylg.wq.pojo.*;
import com.nylg.wq.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ScheduleMapper scheduleMapper;
    @Autowired
    private HallMapper hallMapper;
    @Autowired
    private CinemaMapper cinemaMapper;
    @Autowired
    private MovieMapper movieMapper;


    @Override
    public List<Order> findSeatByOrder(Long scheduleId) {
        return orderMapper.findSeatByOrder(scheduleId);
    }

    @Override
    public int insertSelective(Order order) {
        return orderMapper.insertSelective(order);
    }

    @Override
    public List<Order> findOrderByUserId(Long userId) {
        return orderMapper.findOrderByUserId(userId);
    }


    public PageInfo<Order> findPageByUserName(int page, int limit, String userName,int orderState) {
        PageHelper.startPage(page,limit);
        List<Order> orderList = orderMapper.findOrderByUserName(userName, orderState);
        for (Order order:orderList){
            User u = userMapper.selectByPrimaryKey(order.getUserId());
            order.setUserName(u.getUserName());
            Schedule schedule = scheduleMapper.selectByPrimaryKey(order.getScheduleId());
            Movie m = movieMapper.selectByPrimaryKey(schedule.getMovieId());
            Hall hall = hallMapper.selectByPrimaryKey(schedule.getHallId());
            Cinema cinema = cinemaMapper.selectByPrimaryKey(hall.getCinemaId());
            schedule.setScheduleCinema(cinema);
            schedule.setScheduleHall(hall);
            schedule.setScheduleMovie(m);
            order.setSchedule(schedule);

        }
        PageInfo<Order> orderPageInfo = new PageInfo<>(orderList);
        return orderPageInfo;
    }

    @Override
    public Order selectByPrimaryKey(String orderId) {
        return orderMapper.selectByPrimaryKey(orderId);
    }

    @Override
    public int updateByPrimaryKeySelective(Order record) {
        return orderMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public PageInfo<Order> findOrderPageByOrderId(int page, int limit, String orderId,int orderState) {
        PageHelper.startPage(page,limit);
        List<Order> orders = orderMapper.findOrderPageByOrderId(orderId,orderState);

        for (Order order:orders){
            User u = userMapper.selectByPrimaryKey(order.getUserId());
            order.setUserName(u.getUserName());
            Schedule schedule = scheduleMapper.selectByPrimaryKey(order.getScheduleId());
            Movie m = movieMapper.selectByPrimaryKey(schedule.getMovieId());
            Hall hall = hallMapper.selectByPrimaryKey(schedule.getHallId());
            Cinema cinema = cinemaMapper.selectByPrimaryKey(hall.getCinemaId());
            schedule.setScheduleCinema(cinema);
            schedule.setScheduleHall(hall);
            schedule.setScheduleMovie(m);
            order.setSchedule(schedule);

        }
        PageInfo<Order> orderPageInfo = new PageInfo<>(orders);
        return orderPageInfo;
    }


}
