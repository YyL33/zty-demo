/*
package com.demo.ztydemo.servlet;

import com.demo.ztydemo.dao.entity.PageInfo;
import com.demo.ztydemo.dao.entity.User;
import com.demo.ztydemo.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf8");

        //根据账号/用户名/性别查询信息
        User user = new User();
        String accountNo = request.getParameter("accountNo");
        if (accountNo != null && !accountNo.equals("")) {
            user.setAccountNo(accountNo);
        }
        String userName = request.getParameter("userName");
        if (userName != null && !userName.equals("")) {
            user.setUserName(userName);
        }
        String sexString = request.getParameter("sex");
        if (sexString != null && !sexString.equals("")) {
            user.setSex(Integer.parseInt(sexString));
        }
        request.setAttribute("user", user);


        int currentPage=1;//当前页 默认值
        int pageSize=10;//页行数  默认值
        String currentPageStr = request.getParameter("currentPage");
        if (currentPageStr != null && !currentPageStr.equals("")) {
            currentPage= Integer.parseInt(currentPageStr);
        }//获取当前页信息
        String pageSizeSTR = request.getParameter("pageSize");
        if (pageSizeSTR != null && !pageSizeSTR.equals("")) {
            pageSize= Integer.parseInt(pageSizeSTR);
        }//获取分页信息

        //条件查询用户信息ee
        UserServiceImpl userServiceImpl = new UserServiceImpl();
        List<User> userList = userServiceImpl.queryUserList(user);

        PageInfo pageInfo= userServiceImpl.pageMaker(userList,currentPage,pageSize);
        request.setAttribute("pageInfo", pageInfo);
        request.getRequestDispatcher("UserManage.jsp").forward(request, response);
    }
}*/
