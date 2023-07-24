<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/7/11
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>添加用户</title>
</head>
<body>
<script type="text/javascript" src="webjars/jquery/3.5.1/jquery.min.js" ></script>
<script>
    function addUser(){
        if(validateForm()===1){
            $.ajax(
                {
                    type:"post",
                    url:'addUser',
                    // contentType:"application/json",
                    dataType:"json",
                    data:$("#AddUser").serialize(),
                    async:false,
                    success:function(result){
                        alert("添加成功");
                        window.location.href="UserManage.jsp";
                    }
                }
            )
        }

    }

    function validateForm() {
        let username = document.getElementById("userName").value;
        let password = document.getElementById("password").value;
        let accountNo = document.getElementById("accountNo").value;
        let phone = document.getElementById("phone").value;
        let roleId = document.getElementById("roleId").value;

        if (username == "" || password == ""  || accountNo == "" || phone == ""|| roleId == "") {
            alert("请填写完整后再提交注册");
            return 0;
        }
        if(!isNumber(phone)){
            alert("手机号只能为数字");
            return 0;
        }
        return 1;
    }
    function isNumber(val){
        var regPos = /^[0-9]+$/; //判断是否是数字。
        return regPos.test(val);
    }
    function isEmail(val){
        var regPos = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
        return regPos.test(val);
    }
</script>
<form action="AddUser" id="AddUser" name="AddUser">
    <table border="1">
        <tr>
            <td>设置账号</td>
            <td><input type="text" name="accountNo" id="accountNo"/></td>
        </tr>
        <tr>
            <td>设置用户名</td>
            <td>
                <input type="text" name="userName" id="userName"/></td>
        </tr>
        <tr>
            <td>请输入密码</td>
            <td>
                <input type="password" name="password" id="password"/></td>
        </tr>
        <tr>
            <td>选择性别</td>
            <td>
                <input type="radio" name="sex" value="1" >男
                <input type="radio"  name="sex" value="2" >女
                <input type="radio"  name="sex" value="0" >未知

            </td>
        </tr>
        <tr>
            <td>输入手机号</td>
            <td><input type="text"  name="phone" id="phone"/></td>
        </tr>
        <tr><td>选择角色</td>
            <td><select name="roleId" id="roleId">
                <option>-请选择角色-</option >
                <option value="1">管理员</option>
                <option value="2">学生</option>
                <option value="3">教师</option>
                <option value="4">外卖员</option>
            </select></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="button" onclick="addUser()" value="添加"></td>
        </tr>
    </table>
</form>
</body>
</html>
