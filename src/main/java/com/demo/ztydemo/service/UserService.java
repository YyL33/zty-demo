package com.demo.ztydemo.service;

import com.demo.ztydemo.MybatisUtils;
import com.demo.ztydemo.dao.UserMapper;
import com.demo.ztydemo.dao.entity.PageInfo;
import com.demo.ztydemo.dao.entity.User;
import com.demo.ztydemo.dao.vo.QueryUserVo;
import com.demo.ztydemo.dao.vo.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

public interface UserService {

    public  int loginCheck(User user);

    public List<User> queryUserList(QueryUserVo queryUserVo);

    public UserVo queryUser(int id);

    public int addUser(User user);

    public PageInfo pageMaker(List<User> userList, int currentPage, int pageSize);

    public int updateStatus(Integer id,Integer status) ;

    public int deleteById(Integer id) ;

    public int updateById(User user) ;

}
