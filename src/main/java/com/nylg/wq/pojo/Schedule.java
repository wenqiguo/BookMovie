package com.nylg.wq.pojo;

import java.util.List;
import java.util.Objects;

public class Schedule {
    private Long scheduleId; //场次id

    private Long hallId; //影厅id

    private Long movieId; //电影id

    private String scheduleStartTime; //场次开始时间

    private Integer schedulePrice;  //场次收入

    private Integer scheduleSeatremain;  //场次剩余票数

    private Integer scheduleState;  //场次状态 0代表下架  1代表上映

    private Cinema scheduleCinema; //获取场次的影院名字/影院地址

    private Hall  scheduleHall; //获取放映厅的名字

    private Movie scheduleMovie; //放映的电影名字

    private int orderCount; //该场次订单数量

    private int totalPrice; //场次总收入

    private List<Order> orderList; //该场次的所有订单

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(int orderCount) {
        this.orderCount = orderCount;
    }

    public Cinema getScheduleCinema() {
        return scheduleCinema;
    }

    public void setScheduleCinema(Cinema scheduleCinema) {
        this.scheduleCinema = scheduleCinema;
    }

    public Hall getScheduleHall() {
        return scheduleHall;
    }

    public void setScheduleHall(Hall scheduleHall) {
        this.scheduleHall = scheduleHall;
    }

    public Movie getScheduleMovie() {
        return scheduleMovie;
    }

    public void setScheduleMovie(Movie scheduleMovie) {
        this.scheduleMovie = scheduleMovie;
    }

    public List<Order> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }

    public Long getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Long scheduleId) {
        this.scheduleId = scheduleId;
    }

    public Long getHallId() {
        return hallId;
    }

    public void setHallId(Long hallId) {
        this.hallId = hallId;
    }

    public Long getMovieId() {
        return movieId;
    }

    public void setMovieId(Long movieId) {
        this.movieId = movieId;
    }

    public String getScheduleStartTime() {
        return scheduleStartTime;
    }

    public void setScheduleStartTime(String scheduleStartTime) {
        this.scheduleStartTime = scheduleStartTime;
    }

    public Integer getSchedulePrice() {
        return schedulePrice;
    }

    public void setSchedulePrice(Integer schedulePrice) {
        this.schedulePrice = schedulePrice;
    }

    public Integer getScheduleSeatremain() {
        return scheduleSeatremain;
    }

    public void setScheduleSeatremain(Integer scheduleSeatremain) {
        this.scheduleSeatremain = scheduleSeatremain;
    }

    public Integer getScheduleState() {
        return scheduleState;
    }

    public void setScheduleState(Integer scheduleState) {
        this.scheduleState = scheduleState;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Schedule schedule = (Schedule) o;
        return Objects.equals(scheduleId, schedule.scheduleId) &&
                Objects.equals(hallId, schedule.hallId) &&
                Objects.equals(movieId, schedule.movieId) &&
                Objects.equals(scheduleStartTime, schedule.scheduleStartTime) &&
                Objects.equals(schedulePrice, schedule.schedulePrice) &&
                Objects.equals(scheduleSeatremain, schedule.scheduleSeatremain) &&
                Objects.equals(scheduleState, schedule.scheduleState);
    }

    @Override
    public int hashCode() {
        return Objects.hash(scheduleId, hallId, movieId, scheduleStartTime, schedulePrice, scheduleSeatremain, scheduleState);
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "scheduleId=" + scheduleId +
                ", hallId=" + hallId +
                ", movieId=" + movieId +
                ", scheduleStartTime='" + scheduleStartTime + '\'' +
                ", schedulePrice=" + schedulePrice +
                ", scheduleSeatremain=" + scheduleSeatremain +
                ", scheduleState=" + scheduleState +
                '}';
    }

    public Schedule() {
    }

    public Schedule(Long scheduleId, Long hallId, Long movieId, String scheduleStartTime, Integer schedulePrice, Integer scheduleSeatremain, Integer scheduleState) {
        this.scheduleId = scheduleId;
        this.hallId = hallId;
        this.movieId = movieId;
        this.scheduleStartTime = scheduleStartTime;
        this.schedulePrice = schedulePrice;
        this.scheduleSeatremain = scheduleSeatremain;
        this.scheduleState = scheduleState;
    }
}