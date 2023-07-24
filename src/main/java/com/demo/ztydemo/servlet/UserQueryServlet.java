/*
package com.demo.ztydemo.servlet;

import com.demo.ztydemo.dao.vo.UserVo;
import com.demo.ztydemo.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserQueryServlet extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf8");

        String id = request.getParameter("id");
        if (id == null || id.equals("")) {                                   //判断id是否非空
            request.setAttribute("errorMsg","id can not be null!");
            request.getRequestDispatcher("UserManage.jsp").forward(request,response);
            return;
        }

        UserServiceImpl userServiceImpl = new UserServiceImpl();
        UserVo uservo  = userServiceImpl.queryUser(Integer.parseInt(id));   //根据id查询user
        request.setAttribute("uservo",uservo);
        request.getRequestDispatcher("UpdateById.jsp").forward(request, response);

    }
}*/
