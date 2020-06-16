package com.nylg.wq.mapper;

import com.nylg.wq.pojo.Hall;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HallMapper {
    int deleteByPrimaryKey(Long hallId);

    int insert(Hall record);

    int insertSelective(Hall record);

    Hall selectByPrimaryKey(Long hallId);

    List<Hall> findHallByCinemaId(Long cinemaId);

    Hall selectHallByTwo(@Param(value = "cinemaId") Long cinemaId,@Param(value ="hallName") String hallName);

    int updateByPrimaryKeySelective(Hall record);

    int updateByPrimaryKey(Hall record);
}