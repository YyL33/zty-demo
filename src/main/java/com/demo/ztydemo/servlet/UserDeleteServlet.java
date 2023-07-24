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

public class UserDeleteServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf8");


        String id = request.getParameter("id");
        User user = new User();
        user.setId(Integer.parseInt(id));
        UserServiceImpl userServiceImpl = new UserServiceImpl();
        int n = userServiceImpl.deleteById(user);
        if(n!=1){
            request.setAttribute("errorMsg","删除失败");
            request.getRequestDispatcher("UserManage.jsp").forward(request,response);
        }

        //操作正确，重新查询
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

        user =new User();
        List<User> userList = userServiceImpl.queryUserList(user);
        PageInfo pageInfo= userServiceImpl.pageMaker(userList,currentPage,pageSize);
        request.setAttribute("pageInfo", pageInfo);
        request.getRequestDispatcher("UserManage.jsp").forward(request, response);
    }
}*/
