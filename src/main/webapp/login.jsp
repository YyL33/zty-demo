<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML >
<html>
<head>
  <title>欢迎！用户登陆</title>
</head>

<script type="text/javascript" src="webjars/jquery/3.5.1/jquery.min.js" ></script>
<script>
  function userLogin(){
    if(validateForm()===1){
      $.ajax(
              {

                type:"post",
                url:'userLogin',
                // contentType:"application/json",
                dataType:"json",
                data:$("#loginForm").serialize(),
                async:false,
                success:function(result){
                  if(result===1){
                    alert("登陆成功");
                    window.location.href="UserManage.jsp";
                  }
                  if(result===0){
                    alert("账号或密码错误！");
                  }

                },
                error: function(e) {
                  alert("登陆失败")
                }
              }
      )
    }
    document.getElementById("userName").value="";
    document.getElementById("password").value="";
  }

  function validateForm() {
    let username = document.getElementById("userName").value;
    let password = document.getElementById("password").value;
    if (username == "" || password == "") {
      alert("用户名或密码不可为空");
      return 0;
    }
    if(!isPassword(password)){
      alert("密码应当为数字或字母");
      return 0;
    }
    return 1;
  }
  function isPassword(val){
    var regPos = /^[a-zA-Z0-9_-]+$/;
    return regPos.test(val);
  }
</script>
<body>
<div class="login">
  <div class="login_top">用户登陆</div>
  <form id="loginForm" name="loginForm">
    <div class="ref">
      用户名<input type="text" id="userName" name="userName" />
    </div>
    <div class="ref">
      密码<input type="password" id="password" name="password"/>
    </div>
    <div class="ref">
      <input type="button" onclick="userLogin()" value="登陆" id="btn" />
      <input type="button"  onclick="window.location.href='register.jsp'" value="注册" id="res" />
    </div>
    <div><a href="ForgetPassword.jsp">找回密码</a></div>
  </form>
</div>
<h1>
  <%= "Hello World!-ZTY"%>
</h1>
</body>


<style>
  body{
    background: #d5e21c;
  }
  .login{
    width: 500px;
    height: 300px;
    background:#d9e3e8;
    margin:200px auto;/*盒子顶部距离200，水平居中*/
    border-radius: 10px;/*圆角10个像素*/
  }
  .login_top{
    width: 100%;
    height: 50px;
    background:#f34d0b;
    float: left;
    border-radius: 10px 10px 0px 0px;/* 圆角四个参数的写法分别指左上，右上，右下 左下 */
    color: white;
    text-align: center; /* 水平居中 */
    line-height: 50px; /* 垂直居中 */
  }
  .ref{
    width: 500px;
    height: 80px;
    /* background:red; 这个背景色后面是要去掉的*/
    margin-left: 10px;
    margin-top: 5px;
    /* 以上两句可以简写为margin:5px opx opk 10px; */
    float: left; /*在这里你可以试着不加浮动，就知道浮动的作用了*/
    text-align: center;
    line-height: 40px;

  }
  #btn,#res{
    width: 80px;
    height: 40px;
    font-size: 10pt;
  }
</style>

</html>