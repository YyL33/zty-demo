<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8"%>




<%--<script  src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>--%>
<%--<script>window.jQuery || document.write('<script src="http://kiwenlau.com/js/jquery.min.js"><\/script>')</script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/webjars1/jQuery.js"></script>--%>

<!DOCTYPE HTML >
<html>
<head>

  <title>欢迎！-JSP-Hello World!</title>

</head>

<body>
<h1>
  <%= "Hello World!"%>
</h1>
<a href="UserManage.jsp">点击进入用户查询页面</a><br>
<a href="login.jsp">点击进入登陆页面</a><br>

<%--<form action="" method="post" enctype="multipart/form-data">
<input type="file" name="fileupload" id="">
</form>--%>

<div><button type="button" onclick="Jquery_AJAX_GET()">点我测试ajax</button></div>
</body>

<script type="text/javascript" src="webjars/jquery/3.5.1/jquery.min.js" ></script>
<script>

  function Jquery_AJAX_GET() {
    jQuery.get('test1',{
              userName:"王老师",
              password:"666666"
            },
            //请求成功时回调函数
            function(result,status,xhr) {
              alert("111111");
              alert(result.雪碧);
            },
            "json"
    )
  }

  function Jquery_AJAX(){
    jQuery.ajax({
      type: "post",
      contentType: "application/json",
      url: 'test1',
      dataType: "json",
      data: {
        name:"李师傅",
        password:"666333"
      },
      async: false,
      success: function(result) {
        alert("我是返回内容");
      },
      error: function(e) {
        alert("error")
      }
    })


    alert("猜猜我在哪");
  }
</script>


</html>