package com.nylg.wq.mapper;

import com.github.pagehelper.Page;
import com.nylg.wq.pojo.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(User record);
    //动态添加
    int insertSelective(User record);

    User selectByPrimaryKey(Long userId);
    //根据名字查找

    User selectByName(String userName);
    //根据名字模糊查询，无传参，全查询
    List<User> findUserByPage(String userName);

    List<User> findListByName(String value);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}