package com.nylg.wq.pojo;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class Order {
    private String orderId;  //订单编号

    private Long userId;  //用户id

    private String orderPosition; //订单座位

    private Integer orderState;   //订单状态

    private Integer orderPrice;  //价格

    private Date orderTime; //场次时间

    private Long scheduleId; //场次id

    private Schedule schedule;  //场次

    private String userName; //用户名字

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getOrderPosition() {
        return orderPosition;
    }

    public void setOrderPosition(String orderPosition) {
        this.orderPosition = orderPosition == null ? null : orderPosition.trim();
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public Integer getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Integer orderPrice) {
        this.orderPrice = orderPrice;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Long getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Long scheduleId) {
        this.scheduleId = scheduleId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return Objects.equals(orderId, order.orderId) &&
                Objects.equals(userId, order.userId) &&
                Objects.equals(orderPosition, order.orderPosition) &&
                Objects.equals(orderState, order.orderState) &&
                Objects.equals(orderPrice, order.orderPrice) &&
                Objects.equals(orderTime, order.orderTime) &&
                Objects.equals(scheduleId, order.scheduleId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(orderId, userId, orderPosition, orderState, orderPrice, orderTime, scheduleId);
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", userId=" + userId +
                ", orderPosition='" + orderPosition + '\'' +
                ", orderState=" + orderState +
                ", orderPrice=" + orderPrice +
                ", orderTime=" + orderTime +
                ", scheduleId=" + scheduleId +
                '}';
    }

    public Order() {
    }

    public Order(String orderId, Long userId, String orderPosition, Integer orderState, Integer orderPrice, Date orderTime, Long scheduleId) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderPosition = orderPosition;
        this.orderState = orderState;
        this.orderPrice = orderPrice;
        this.orderTime = orderTime;
        this.scheduleId = scheduleId;
    }
}