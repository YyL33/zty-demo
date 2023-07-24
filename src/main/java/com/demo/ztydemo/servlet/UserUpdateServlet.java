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

public class UserUpdateServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf8");

        String id = request.getParameter("id");
        String accountNo = request.getParameter("accountNo");         //从前端页面获取值
        String userName = request.getParameter("userName");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        String roleId = request.getParameter("roleId");

        if (id == null || id.equals("")) {                                   //判断id是否非空
            request.setAttribute("errorMsg","id can not be null!");
            request.getRequestDispatcher("UserManage.jsp").forward(request,response);
            return;
        }



        User user = new User();
        user.setId(Integer.parseInt(id));
        user.setAccountNo(accountNo);
        user.setUserName(userName);
        user.setSex(Integer.parseInt(sex));
        user.setPhone(phone);
        user.setRoleId(Integer.parseInt(roleId));

        UserServiceImpl userServiceImpl = new UserServiceImpl();
        int n = userServiceImpl.updateById(user);             //更新数据库
        if(n!=1){
            request.setAttribute("errorMsg","修改失败");
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
