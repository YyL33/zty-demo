package com.demo.ztydemo.service.impl;

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
@Service
public class UserServiceImpl implements com.demo.ztydemo.service.UserService {
@Override
    public int loginCheck(User user){
    SqlSession session = MybatisUtils.openSession();
    UserMapper mapper = session.getMapper(UserMapper.class);
    List<User> userList=mapper.loginCheck(user);
    if(userList.size()!=0){
        return 1;
    }
    return  0;
    }
@Override
    public List<User> queryUserList(QueryUserVo queryUserVo) {
        SqlSession session = MybatisUtils.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
 //       userList.stream().forEach(System.out::println);
        return  mapper.selectUserList(queryUserVo);
    }
    @Override
    public UserVo queryUser(int id) {                               //根据id查询user
        SqlSession session = MybatisUtils.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        //       userList.stream().forEach(System.out::println);
        return  mapper.selectUser(id);
    }
    @Override
    public int addUser(User user) {
        SqlSession session = MybatisUtils.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        return mapper.addUser(user);
    }
    @Override
    public PageInfo pageMaker(List<User> userList,int currentPage,int pageSize){  //分页封装
        int sumCounts =userList.size();//总条数
        int sumPages;
        if (sumCounts%pageSize==0){       //总页数
            sumPages=sumCounts/pageSize;
        }else {
            sumPages=sumCounts/pageSize+1;
        }
        int statrIndex=(currentPage-1)*pageSize; //起始下标
        int endIndex=currentPage*pageSize-1;
        if (endIndex>=sumCounts){
            endIndex=sumCounts-1;
        }//结束下标
        List<User> returnUserList=new ArrayList<>();
        if (userList.size()>0){
            for (int i =statrIndex;i<=endIndex;i++){
                returnUserList.add(userList.get(i));
            }
        }
        //封装分页信息，并放入分页结果
        PageInfo pageInfo=new PageInfo();
        pageInfo.setSumCounts(sumCounts);
        pageInfo.setSumPage(sumPages);
        pageInfo.setPageSize(pageSize);
        pageInfo.setCurrentPage(currentPage);
        pageInfo.setDataList(returnUserList);
        return pageInfo;
    }

    @Override
    public int updateStatus(Integer id,Integer status) {    //返回int类型表示影响行数
        User user =new User();
        user.setId(id);
        if(status.equals(0)){          //转换状态属性
            user.setStatus(1);
        }else{
            user.setStatus(0);
        }
        SqlSession session = MybatisUtils.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        return mapper.updateStatus(user);
    }
    @Override
    public int deleteById(Integer id) {
        SqlSession session = MybatisUtils.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        return mapper.deleteById(id);
    }
    @Override
    public int updateById(User user) {
        SqlSession session = MybatisUtils.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        return mapper.updateById(user);
    }

}
