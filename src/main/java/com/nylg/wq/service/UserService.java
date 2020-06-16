package com.nylg.wq.service;

import com.github.pagehelper.PageInfo;
import com.nylg.wq.pojo.User;

import java.util.List;
import java.util.Map;


public interface UserService {
    User selectByName(String userName);
    int addUser(User user);
    PageInfo<User> findByPage(Integer page, Integer limit, String keyword);
    int modifyUser(User user);
    List<User> findListByName(String userName);
    User selectByUserId(Long userId);
    Map<String,String> delectByUserId(Long id);
}
