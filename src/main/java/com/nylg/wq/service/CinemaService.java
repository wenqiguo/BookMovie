package com.nylg.wq.service;

import com.nylg.wq.pojo.Cinema;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface CinemaService {
    List<Cinema> findAllCinema();
    Cinema findCinemaByName(String cinemaName);
    Cinema findCinemaById(Long CinemaId);
}
