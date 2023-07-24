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
    <title>更新数据</title>
</head>
<body>
<form action="UpdateById">
    <input type="hidden" value="${uservo.id}" name="id" />
    <table border="1">
        <tr>
            <td>账号</td>
            <td><input type="text" name="accountNo" value="${uservo.accountNo}" /></td>
        </tr>
        <tr>
            <td>用户名</td>
            <td>
            <input type="text" name="userName" value="${uservo.userName}"/></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
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
        </tr>
        <tr>
            <td>手机号</td>
            <td><input type="text"  name="phone" value="${uservo.phone}"/></td>
        </tr>
        <tr><td>角色</td>
            <td>
                <select name="roleId">
                    <option selected value="${uservo.roleId}" label="${uservo.roleName}">
                        ${uservo.roleName}
                    </option >
                    <optgroup label="选择角色">
                        <option value="1">管理员</option>
                        <option value="2">学生</option>
                        <option value="3">教师</option>
                        <option value="4">外卖员</option>
                    </optgroup>
                </select>

            </td>
        </tr>
        <tr><td>部门</td>
            <td>${uservo.department}</td>
        </tr>
        <tr><td>角色描述</td>
            <td><textarea rows="5" readonly="readonly"
                          cols="10" name="remark" value="${uservo.remark}"
                          style="height: 120px;width: 150px">${uservo.remark}</textarea></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="确认"></td>
        </tr>
    </table>
</form>
</body>
</html>
