package com.demo.ztydemo.controller;

import com.demo.ztydemo.dao.entity.PageInfo;
import com.demo.ztydemo.dao.entity.User;
import com.demo.ztydemo.dao.vo.QueryUserVo;
import com.demo.ztydemo.service.UserService;
import com.demo.ztydemo.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Resource
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/userLogin")
    public int userLogin(User user) {
        int n=userService.loginCheck(user);
        return n;
    }



    @ResponseBody
    @RequestMapping(value = "/getUserPageList")
    public PageInfo getUserPageList(QueryUserVo queryUserVo) {
//        UserServiceImpl userServiceImpl =new UserServiceImpl();
        List<User> userList = userService.queryUserList(queryUserVo);

        int currentPage=1;//当前页 默认值
        int pageSize=10;//页行数  默认值
        String currentPageStr = queryUserVo.getCurrentPage();
        if (currentPageStr != null && !currentPageStr.equals("")) {
            currentPage= Integer.parseInt(currentPageStr);
        }//获取当前页信息
        String pageSizeSTR = queryUserVo.getPageSize();
        if (pageSizeSTR != null && !pageSizeSTR.equals("")) {
            pageSize= Integer.parseInt(pageSizeSTR);
        }//获取分页信息
        PageInfo pageInfo=userService.pageMaker(userList,currentPage,pageSize);
        return pageInfo;
    }

    @ResponseBody
    @RequestMapping(value = "/updateStatus")
    public int updateStatus(Integer id,Integer status) {
        return userService.updateStatus(id,status);
    }


    @ResponseBody
    @RequestMapping(value = "/deleteById")
    public int deleteById(Integer id) {
        return userService.deleteById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/addUser")
    public int addUser(User user) {
        return userService.addUser(user);
    }


    @ResponseBody
    @RequestMapping("/test1")
    public Map<String,String> test1(String userName,String password){
        System.out.println(userName);
        System.out.println(password);
        Map<String,String> map=new HashMap<>();
        map.put("雪碧","3元");
        return map;
    }



}
