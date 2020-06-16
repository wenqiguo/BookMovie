package com.nylg.wq.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nylg.wq.mapper.UserMapper;
import com.nylg.wq.pojo.User;
import com.nylg.wq.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Override
    public User selectByName(String userName) {
        return userMapper.selectByName(userName);
    }

    @Override
    public int addUser(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public PageInfo<User> findByPage(Integer page, Integer limit, String keyword) {
        PageHelper.startPage(page,limit);
        List<User> users = userMapper.findUserByPage(keyword);
        PageInfo<User>  userPageInfo =  new PageInfo<User>(users);

        return userPageInfo;
    }

    @Override
    public int modifyUser(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public List<User> findListByName(String userName) {
        return userMapper.findListByName(userName);
    }

    @Override
    public User selectByUserId(Long userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public Map<String,String> delectByUserId(Long id) {
        Map<String,String> map = new HashMap<>();
        int i = userMapper.deleteByPrimaryKey(id);
        if (i>0){

            map.put("type","success");
            map.put("msg","删除成功");
            return map;
        }
        map.put("type","error");
        map.put("msg","删除失败");

        return map;
    }


}
