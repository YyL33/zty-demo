package com.demo.ztydemo.dao;

import com.demo.ztydemo.dao.entity.User;
import com.demo.ztydemo.dao.vo.QueryUserVo;
import com.demo.ztydemo.dao.vo.UserVo;

import java.util.List;


public interface UserMapper  {

    List<User> loginCheck(User user);
    List<User> selectUserList(QueryUserVo queryUserVo);

    UserVo selectUser(int id);
    int addUser(User user);

    int updateStatus(User user);
    int deleteById(Integer id);
    int updateById(User user);
}