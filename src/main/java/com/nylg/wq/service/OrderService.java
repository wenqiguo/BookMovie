package com.nylg.wq.service;

import com.github.pagehelper.PageInfo;
import com.nylg.wq.pojo.Order;

import java.util.List;

public interface OrderService {
    List<Order> findSeatByOrder(Long scheduleId);
     int insertSelective(Order order);
    List<Order> findOrderByUserId(Long userId);
    PageInfo<Order> findPageByUserName(int page,int limit,String userName,int orderState);
    Order selectByPrimaryKey(String orderId);
    int updateByPrimaryKeySelective(Order record);
    PageInfo<Order> findOrderPageByOrderId(int page,int limit,String orderId,int orderState);

}
