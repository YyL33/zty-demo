<%@ page import="com.demo.ztydemo.dao.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<script type="text/javascript" src="webjars/jquery/3.5.1/jquery.min.js" ></script>
<script>
    function selectUser(){
            $.ajax(
                {
                    type:"post",
                    url:'getUserPageList',
                    // contentType:"application/json",
                    dataType:"json",
                    data:$("#SelectUser").serialize(),
                    async:false,
                    success:function(result){
                        var str1='';
                        $('.userData').remove();
                        pageSize(result.pageSize);
                        currentPage(result.currentPage);
                        sumPage(result.sumPage);
                        sumCounts(result.sumCounts);
                        var userlist = result.dataList;
                        for(var i=0;i<userlist.length;i++){
                            var usedata = userlist[i];

                            str1+='<tr class="userData">'+
                                '<td  class="userData">'+usedata.accountNo+'</td>'+
                                '<td class="userData">'+usedata.userName+'</td>'+
                                '<td class="userData">'+ (usedata.sex===1?"男":usedata.sex===2?"女":"未知") + '</td>'+
                                '<td class="userData">'+usedata.phone+'</td>'+
                                '<td class="userData">'+(usedata.roleId===1?"管理员":usedata.roleId===2?"学生":usedata.roleId===3?"老师":"外卖员")+'</td>'+
                                '<td><input type="button" onclick="updateStatus('+usedata.id+','+usedata.status+')" value="'+(usedata.status===1?"正常":"锁定")+'"></td>'+
                                '<td class="userData">'+usedata.createTime+'</td>'+
                                '<td class="userData">'+usedata.updateTime+'</td>'+
                                '<td><input type="button" onclick="deleteById('+usedata.id+')" value="删除"></td>'+
                                '<td class="userData"><a href="QueryUser?id'+usedata.id+'">修改</a></td>'+
                                '</tr>';
                        }
                        alert("查询用户信息成功");
                        $("#formHeader").after(str1);

                    },
                    error: function(e) {
                        alert("error")
                    }
                }
            )
        }

    function pageSize (pageSize){
        $("#pageSize").val(pageSize);
    }
    function currentPage(currentPage){
        $("#currentPage").val(currentPage);
    }
    function sumPage(sumPage){
        $("#sumPage").val(sumPage);
    }
    function sumCounts(sumCounts){
        $("#sumCounts").val(sumCounts);
    }


    function updateStatus(id,status){
        alert("开始修改状态")
        $.ajax(
            {
                type:"get",
                url:'updateStatus',
                // contentType:"application/json",
                dataType:"json",
                data:{
                    id:id,
                    status:status,
                },
                async:false,
                success:function(result){
                    alert("状态修改成功");
                    selectUser();

                },
                error: function(e) {
                    alert("状态修改失败")
                }
            }

        )
    }
    function deleteById(id){
        jQuery.ajax(
            {
                type:"get",
                url:'deleteById',
                contentType:"application/json",
                dataType:"json",
                data:{
                    id:id
                },
                async:false,
                success:function(result){
                    alert("删除成功");
                    selectUser();
                },
                error: function(e) {
                    alert("删除失败")
                }
            }

        )
    }




    $(function () {
            selectUser();
        })
</script>
<form id="SelectUser" name="SelectUser">
    <table border="1">
    <tr>
        <td>账号:<input type="text" name="accountNo" id="accountNo"/></td>
        <td>用户名<input type="text" name="userName"  /></td>
        <td>
            性别:
            <input type="radio" name="sex" value="1">男
            <input type="radio"  name="sex" value="2">女
            <input type="radio"  name="sex" value="0" >未知
            <script language= JavaScript>
                function initradio(rName,rValue){
                    var rObj = document.getElementsByName(rName);
                    for(var i = 0;i < rObj.length;i++){
                        if(rObj[i].value == rValue){
                            rObj[i].checked =  'checked';
                        }
                    }
                }

                var s="${uservo.sex}";//这里传入什么值就设为默认值。
                initradio('sex',s);  //调用js方法来实现动态改变默认值
            </script>
        </td>
        <td>
            <input type="button" onclick="selectUser()" value="搜索">
            <a href="AddUser.jsp">添加</a>
<%--            <input type="button" onclick="addUser()" value="添加">--%>

        </td>
    </tr>
    <tr>
        <td>
            页码：
<%--            <c:forEach begin="1" end="${pageInfo.sumPage}"  varStatus="num">--%>
<%--                <input type="submit" name="currentPage" value="${num.index}">--%>
<%--            </c:forEach>--%>
           <input type="text" name="currentPage" id="currentPage">
        </td>
        <td>
            <!--<input type="text" name="pageSize" value="${pageInfo.pageSize}">-->
            <select name="pageSize">
                <optgroup label="选择每页条数">
                    <option value="5">5</option>
                    <option selected value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                    <option value="40">40</option>
                    <option value="50">50</option>
                </optgroup>
            </select>

            条/页
        </td>
        <td>共<input type="button" id="sumPage">页</td>
        <td>共<input type="button" id="sumCounts">条信息</td>
    </tr>
    </table>
</form>

<table border="1">
    <tr id="formHeader">
        <td>账号</td>
        <td>用户名</td>
        <td>性别</td>
        <td>手机号</td>
        <td>角色</td>
        <td>状态</td>
        <td>创建时间</td>
        <td>更新时间</td>
        <td>操作</td>
    </tr>
    <%--<c:if test="${not empty pageInfo.dataList}" >
        <c:forEach items="${pageInfo.dataList}" var="user" varStatus="vs">
            <tr>
                <td>${user.accountNo}</td>
                <td>${user.userName}</td>
                <td>
                    <c:if test="${user.sex == 0}">
                        未知
                    </c:if>
                    <c:if test="${user.sex == 1}">
                        男
                    </c:if>
                    <c:if test="${user.sex == 2}">
                        女
                    </c:if>
                </td>
                <td>${user.phone}</td>
                <td>
                    <c:if test="${user.roleId == 1}">
                        管理员
                    </c:if>
                    <c:if test="${user.roleId == 2}">
                        学生
                    </c:if>
                    <c:if test="${user.roleId == 3}">
                        教师
                    </c:if>
                    <c:if test="${user.roleId == 4}">
                        外卖员
                    </c:if>
                    <c:if test="${user.roleId > 4||user.roleId < 1}">
                        未知角色
                    </c:if>
                </td>
                <td>
                    <a href="UpdateStatus?id=${user.id}&status=${user.status}&currentPage=${pageInfo.currentPage}&pageSize=${pageInfo.pageSize}">
                        <c:if test="${user.status == 1}">
                            正常
                        </c:if>
                        <c:if test="${user.status == 0}">
                            锁定
                        </c:if>
                    </a>
                </td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${user.createTime}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${user.updateTime}"/></td>
                <td>
                    <a href="DeleteById?id=${user.id}&currentPage=${pageInfo.currentPage}&pageSize=${pageInfo.pageSize}">删除</a>
                    <a href="QueryUser?id=${user.id}">修改</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>--%>
</table>
</body>
</html>