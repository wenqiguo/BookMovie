package com.nylg.wq.service;


import com.nylg.wq.pojo.Cinema;
import com.nylg.wq.pojo.Hall;

import java.util.List;

public interface HallService {
    //通过电影院id查找对应所有的放映厅
    List<String> findHallByCinemaId(Long CinemaId);

    Hall findHallByTwo(Long cinemaId,String hallName);

    //通过影厅查找对应的影院
    Cinema findCinemaByHallId(Long hallId);

    Hall selectByPrimaryKey(Long hallId);

}
