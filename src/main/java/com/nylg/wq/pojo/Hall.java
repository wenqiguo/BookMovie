package com.nylg.wq.pojo;

import java.util.List;
import java.util.Objects;

public class Hall {
    private Long hallId;

    private String hallName; //放映厅名字

    private Long cinemaId;  //所属影院id

    private Integer hallCapacity; //放映厅的容量

    private Cinema hallOfCinema; //所属影院
    private List<Schedule> ScheduleList; //所有的电影场次集合

    public Cinema getHallOfCinema() {
        return hallOfCinema;
    }

    public void setHallOfCinema(Cinema hallOfCinema) {
        this.hallOfCinema = hallOfCinema;
    }

    public List<Schedule> getScheduleList() {
        return ScheduleList;
    }

    public void setScheduleList(List<Schedule> scheduleList) {
        ScheduleList = scheduleList;
    }

    public Long getHallId() {
        return hallId;
    }

    public void setHallId(Long hallId) {
        this.hallId = hallId;
    }

    public String getHallName() {
        return hallName;
    }

    public void setHallName(String hallName) {
        this.hallName = hallName == null ? null : hallName.trim();
    }

    public Long getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Long cinemaId) {
        this.cinemaId = cinemaId;
    }

    public Integer getHallCapacity() {
        return hallCapacity;
    }

    public void setHallCapacity(Integer hallCapacity) {
        this.hallCapacity = hallCapacity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Hall hall = (Hall) o;
        return Objects.equals(hallId, hall.hallId) &&
                Objects.equals(hallName, hall.hallName) &&
                Objects.equals(cinemaId, hall.cinemaId) &&
                Objects.equals(hallCapacity, hall.hallCapacity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(hallId, hallName, cinemaId, hallCapacity);
    }

    @Override
    public String toString() {
        return "Hall{" +
                "hallId=" + hallId +
                ", hallName='" + hallName + '\'' +
                ", cinemaId=" + cinemaId +
                ", hallCapacity=" + hallCapacity +
                '}';
    }

    public Hall() {
    }

    public Hall(Long hallId, String hallName, Long cinemaId, Integer hallCapacity) {
        this.hallId = hallId;
        this.hallName = hallName;
        this.cinemaId = cinemaId;
        this.hallCapacity = hallCapacity;
    }
}