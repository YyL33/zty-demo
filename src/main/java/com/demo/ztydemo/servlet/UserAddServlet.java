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

public class UserAddServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf8");


        String accountNo = request.getParameter("accountNo");         //从前端页面获取值
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        String roleId = request.getParameter("roleId");

        User user=new User();
        user.setAccountNo(accountNo);
        user.setUserName(userName);
        user.setPassword(password);
        user.setSex(Integer.parseInt(sex));
        user.setPhone(phone);
        user.setRoleId(Integer.parseInt(roleId));

        UserServiceImpl userServiceImpl = new UserServiceImpl();
        int n = userServiceImpl.addUser(user);
        if(n!=1){
            request.setAttribute("errorMsg","添加失败");
            request.getRequestDispatcher("UserManage.jsp").forward(request,response);
        }
        //操作正确，重新查询

        user =new User();
        List<User> userList = userServiceImpl.queryUserList(user);
        PageInfo pageInfo= userServiceImpl.pageMaker(userList,1,10);
        request.setAttribute("pageInfo", pageInfo);
        request.getRequestDispatcher("UserManage.jsp").forward(request, response);

    }

}*/
