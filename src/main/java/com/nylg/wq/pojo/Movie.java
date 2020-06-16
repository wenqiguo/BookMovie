package com.nylg.wq.pojo;

import java.sql.Date;
import java.util.List;
import java.util.Objects;

public class Movie {
    private Long movieId;

    private String movieCname;  //中国名字

    private String movieFname;  //外国名字

    private String movieActor;  //演员

    private String movieDirector;  //导演

    private String movieDetail;  //电影简介

    private String movieDuration;  //电影时长

    private String movieType;  //电影类型

    private Double movieScore;  //电影评分

    private int movieTotalticket;  //电影票房

    private Long movieCommentcount;  //评论总数

    private Date moviePutdate;  //电影上映时间

    private String movieCountry;  //制片地区

    private String moviePicture;  //电影海报

    private Integer movieState;  //电影状态  1:在线  0：下架

    private List<Comment> UserComments;

    private List<Schedule> movieSchedule;

    public List<Schedule> getMovieSchedule() {
        return movieSchedule;
    }

    public void setMovieSchedule(List<Schedule> movieSchedule) {
        this.movieSchedule = movieSchedule;
    }

    public List<Comment> getUserComments() {
        return UserComments;
    }

    public void setUserComments(List<Comment> userComments) {
        UserComments = userComments;
    }

    public Long getMovieId() {
        return movieId;
    }

    public void setMovieId(Long movieId) {
        this.movieId = movieId;
    }

    public String getMovieCname() {
        return movieCname;
    }

    public void setMovieCname(String movieCname) {
        this.movieCname = movieCname == null ? null : movieCname.trim();
    }

    public String getMovieFname() {
        return movieFname;
    }

    public void setMovieFname(String movieFname) {
        this.movieFname = movieFname == null ? null : movieFname.trim();
    }

    public String getMovieActor() {
        return movieActor;
    }

    public void setMovieActor(String movieActor) {
        this.movieActor = movieActor == null ? null : movieActor.trim();
    }

    public String getMovieDirector() {
        return movieDirector;
    }

    public void setMovieDirector(String movieDirector) {
        this.movieDirector = movieDirector == null ? null : movieDirector.trim();
    }

    public String getMovieDetail() {
        return movieDetail;
    }

    public void setMovieDetail(String movieDetail) {
        this.movieDetail = movieDetail == null ? null : movieDetail.trim();
    }

    public String getMovieDuration() {
        return movieDuration;
    }

    public void setMovieDuration(String movieDuration) {
        this.movieDuration = movieDuration == null ? null : movieDuration.trim();
    }

    public String getMovieType() {
        return movieType;
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType == null ? null : movieType.trim();
    }

    public Double getMovieScore() {
        return movieScore;
    }

    public void setMovieScore(Double movieScore) {
        this.movieScore = movieScore;
    }

    public int getMovieTotalticket() {
        return movieTotalticket;
    }

    public void setMovieTotalticket(int movieTotalticket) {
        this.movieTotalticket = movieTotalticket;
    }

    public Long getMovieCommentcount() {
        return movieCommentcount;
    }

    public void setMovieCommentcount(Long movieCommentcount) {
        this.movieCommentcount = movieCommentcount;
    }

    public Date getMoviePutdate() {
        return moviePutdate;
    }

    public void setMoviePutdate(Date moviePutdate) {
        this.moviePutdate = moviePutdate;
    }

    public String getMovieCountry() {
        return movieCountry;
    }

    public void setMovieCountry(String movieCountry) {
        this.movieCountry = movieCountry == null ? null : movieCountry.trim();
    }

    public String getMoviePicture() {
        return moviePicture;
    }

    public void setMoviePicture(String moviePicture) {
        this.moviePicture = moviePicture == null ? null : moviePicture.trim();
    }

    public Integer getMovieState() {
        return movieState;
    }

    public void setMovieState(Integer movieState) {
        this.movieState = movieState;
    }


    public Movie() {
    }

    public Movie(Long movieId, String movieCname, String movieFname, String movieActor, String movieDirector, String movieDetail, String movieDuration, String movieType, Double movieScore, int movieTotalticket, Long movieCommentcount, Date moviePutdate, String movieCountry, String moviePicture, Integer movieState) {
        this.movieId = movieId;
        this.movieCname = movieCname;
        this.movieFname = movieFname;
        this.movieActor = movieActor;
        this.movieDirector = movieDirector;
        this.movieDetail = movieDetail;
        this.movieDuration = movieDuration;
        this.movieType = movieType;
        this.movieScore = movieScore;
        this.movieTotalticket = movieTotalticket;
        this.movieCommentcount = movieCommentcount;
        this.moviePutdate = moviePutdate;
        this.movieCountry = movieCountry;
        this.moviePicture = moviePicture;
        this.movieState = movieState;
    }


}