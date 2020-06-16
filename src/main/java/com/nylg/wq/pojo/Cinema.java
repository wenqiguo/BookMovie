package com.nylg.wq.pojo;

import java.util.Objects;

public class Cinema {
    private Long cinemaId;

    private String cinemaName;

    private String cinemaAdress;

    public Long getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Long cinemaId) {
        this.cinemaId = cinemaId;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName == null ? null : cinemaName.trim();
    }

    public String getCinemaAdress() {
        return cinemaAdress;
    }

    public void setCinemaAdress(String cinemaAdress) {
        this.cinemaAdress = cinemaAdress == null ? null : cinemaAdress.trim();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cinema cinema = (Cinema) o;
        return Objects.equals(cinemaId, cinema.cinemaId) &&
                Objects.equals(cinemaName, cinema.cinemaName) &&
                Objects.equals(cinemaAdress, cinema.cinemaAdress);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cinemaId, cinemaName, cinemaAdress);
    }

    @Override
    public String toString() {
        return "Cinema{" +
                "cinemaId=" + cinemaId +
                ", cinemaName='" + cinemaName + '\'' +
                ", cinemaAdress='" + cinemaAdress + '\'' +
                '}';
    }

    public Cinema() {
    }

    public Cinema(Long cinemaId, String cinemaName, String cinemaAdress) {
        this.cinemaId = cinemaId;
        this.cinemaName = cinemaName;
        this.cinemaAdress = cinemaAdress;
    }
}