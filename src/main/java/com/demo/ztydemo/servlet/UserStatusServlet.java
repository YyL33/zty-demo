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

public class UserStatusServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf8");


        String id = request.getParameter("id");
        String status = request.getParameter("status");
        if (id == null || id.equals("")) {                                   //判断id与status是否非空
            request.setAttribute("errorMsg","id can not be null!");
            request.getRequestDispatcher("UserManage.jsp").forward(request,response);
            return;
        }
        if (status == null || status.equals("")) {
            request.setAttribute("errorMsg","status can not be null!");
            request.getRequestDispatcher("UserManage.jsp").forward(request,response);
            return;
        }

        User user = new User();
        user.setId(Integer.parseInt(id));
        Integer iStatus=Integer.parseInt(status);           //转换状态属性
        if(iStatus.equals(0)){
            user.setStatus(1);
        }else{
            user.setStatus(0);
        }

        UserServiceImpl userServiceImpl = new UserServiceImpl();
        int n = userServiceImpl.updateStatus(user);
        if(n!=1){
            request.setAttribute("errorMsg","修改失败");
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
