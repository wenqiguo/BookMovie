package com.nylg.wq.service.impl;

import com.nylg.wq.mapper.CinemaMapper;
import com.nylg.wq.mapper.HallMapper;
import com.nylg.wq.pojo.Cinema;
import com.nylg.wq.pojo.Hall;
import com.nylg.wq.service.CinemaService;
import com.nylg.wq.service.HallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class HallServiceImpl implements HallService {
    @Autowired
    private HallMapper hallMapper;
    @Autowired
    private CinemaMapper cinemaMapper;

    @Override
    public List<String> findHallByCinemaId(Long CinemaId) {
       List<Hall> halls = hallMapper.findHallByCinemaId(CinemaId);
       List<String> hallNames = new ArrayList<>();
       for (Hall name : halls){
           hallNames.add(name.getHallName());
       }
       return hallNames;
    }

    @Override
    public Cinema findCinemaByHallId(Long hallId) {
        Hall hall = hallMapper.selectByPrimaryKey(hallId);
        Cinema cinema = cinemaMapper.selectByPrimaryKey(hall.getCinemaId());
        return cinema;
    }

    @Override
    public Hall selectByPrimaryKey(Long hallId) {
        return hallMapper.selectByPrimaryKey(hallId);
    }

    @Override
    public Hall findHallByTwo(Long cinemaId, String hallName) {
        return hallMapper.selectHallByTwo(cinemaId,hallName);
    }
}
