
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
    function registerUser(){
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
                        alert("注册成功");
                        window.location.href="login.jsp";
                    }
                }
            )
        }

    }

    function validateForm() {
        let username = document.getElementById("userName").value;
        let password = document.getElementById("password").value;
        let repassword = document.getElementById("repassword").value;
        let accountNo = document.getElementById("accountNo").value;
        let phone = document.getElementById("phone").value;
        let roleId = document.getElementById("roleId").value;

        if (username == "" || password == "" || repassword == "" || accountNo == "" || phone == ""|| roleId == "") {
            alert("请填写完整后再提交注册");
            return 0;
        }
        if(password != repassword){
            alert("两次输入的密码不一致");
            document.getElementById("password").value = "";
            document.getElementById("passconf").value = "";
            document.getElementById("password").focus();
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
<div class="register">
    <div class="register_top">用户注册</div>
    <form action="AddUser" id="AddUser" name="AddUser">
        <div class="ref">
            <table border="1" class="tab">
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
                    <td>再次输入密码</td>
                    <td>
                        <input type="password" name="repassword" id="repassword"/></td>
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
            </table>
            <div class="ref">
                <input type="button" onclick="registerUser()" value="注册" id="btn">
                <input type="reset" value="重置" id="res" />
            </div>
        </div>
    </form>
</div>

</body>

<style>
    body{
        background: #1f88cb;
    }
    .register{
        width: 380px;
        height: 450px;
        background:#d9e3e8;
        margin:80px auto;/*盒子顶部距离200，水平居中*/
        border-radius: 10px;/*圆角10个像素*/
    }
    .register_top{
        width: 100%;
        height: 50px;
        background:#093f63;
        float: left;
        border-radius: 10px 10px 0px 0px;/* 圆角四个参数的写法分别指左上，右上，右下 左下 */
        color: white;
        text-align: center; /* 水平居中 */
        line-height: 50px; /* 垂直居中 */
    }
    .ref{
        width: 350px;
        height: 40px;
        /*background:red;  这个背景色后面是要去掉的*/
        margin-left: 10px;
        margin-top: 5px;
        /* 以上两句可以简写为margin:5px opx opk 10px; */
        float: left; /*在这里你可以试着不加浮动，就知道浮动的作用了*/
        text-align: center;
        line-height: 40px;
    }
    .tab{
        width: 350px;
        height: 40px;
        /*background:red;  这个背景色后面是要去掉的*/
        margin-left: 10px;
        margin-top: 5px;
        /* 以上两句可以简写为margin:5px opx opk 10px; */
        float: left; /*在这里你可以试着不加浮动，就知道浮动的作用了*/
        text-align: center;
        line-height: 40px;
    }

    #btn,#res{
        width: 120px;
        height: 40px;
        font-size: 15pt;
    }
</style>
</html>
