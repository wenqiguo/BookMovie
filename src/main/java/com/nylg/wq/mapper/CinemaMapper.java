package com.nylg.wq.mapper;

import com.nylg.wq.pojo.Cinema;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface CinemaMapper {
    int deleteByPrimaryKey(Long cinemaId);

    int insert(Cinema record);

    int insertSelective(Cinema record);

    Cinema selectByPrimaryKey(Long cinemaId);

    List<Cinema> findAllCinema();

    Cinema findCinemaByName(String cinemaName);


    int updateByPrimaryKeySelective(Cinema record);

    int updateByPrimaryKey(Cinema record);

}