package com.nylg.wq.mapper;

import com.nylg.wq.pojo.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String orderId);


    List<Order> findOrderByUserId(Long userId);

    //通过名字分页查询后台订单
    List<Order> findOrderByUserName(@Param(value = "userName") String userName, @Param(value = "orderState") int orderState);

    List<Order> findOrderPageByOrderId(@Param(value = "orderId")String orderId,@Param(value = "orderState") int orderState);

    List<Order> findSeatByOrder(Long scheduleId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}