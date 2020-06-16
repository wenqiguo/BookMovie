package com.nylg.wq.service.impl;

import com.nylg.wq.mapper.CinemaMapper;
import com.nylg.wq.pojo.Cinema;
import com.nylg.wq.service.CinemaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class CinemaServiceImpl implements CinemaService {
    @Autowired
    private CinemaMapper cinemaMapper;
    @Override
    public List<Cinema> findAllCinema() {
        return cinemaMapper.findAllCinema();
    }

    @Override
    public Cinema findCinemaByName(String cinemaName) {
        return cinemaMapper.findCinemaByName(cinemaName);
    }

    @Override
    public Cinema findCinemaById(Long CinemaId) {
        return cinemaMapper.selectByPrimaryKey(CinemaId);
    }


}
