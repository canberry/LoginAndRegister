<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>login</title>
    
    <script type="text/javascript">
      function check() {
        var un = document.getElementById("un").value;
        var pwd = document.getElementById("pwd").value;
        var role = document.getElementsByName("role");
        
        var errMsg = "";
        
        if (un == "") {
          errMsg += "用户名不能为空！";
        }
        if (pwd == "") {
          errMsg += "密码不能为空！";
        }
        
        for(var i=0; i<role.length; i++) {
          if (role.item(i).checked) break;
        }
        if (i == role.length) {
          errMsg += "角色不能为空！";
        }
        
        if (errMsg != "") {
          alert(errMsg);
          return false;
        }
      }
      
      function changeImg() {
        var img = document.getElementById("code"); 
        now = new Date(); 
        img.src="makeCertPic.jsp?code="+now.getTime();
      }
      
      //查看如何																										1
      function isVerMacth(actualCode) {
		 var inputVerCode = document.getElementById("certCode").value;
		 var vertCodeErr = document.getElementById("vertCodeErr");
		 
		 if(inputVerCode != actualCode) {
		   vertCodeErr.innerHTML = "*验证码不一致";
		 }
      }
    
    </script>

  </head>
  
  <body>
    <form action="handler" method="post" onsubmit="return check()">
      <input type="hidden" name="m" value="login">
      <p>用户名：
        <input name="username" id="un">
        <a href="register.jsp">注册</a>
      </p>
      <p>密&nbsp;&nbsp;码：
        <input type="password" name="password" id="pwd">
        <a href="findPassword.jsp">忘记密码?</a>
      </p>
      <p>验证码：
        <input type="text" id="certCode" onblur="isVerMacth(${session.certCode })">
        <img id="code" src="makeCertPic.jsp"/>
        <a href="javascript:changeImg()">换一张</a>
      </p>
      <div id="vertCodeErr" style="color:red">*</div>
      <p>
        <input type="radio" name="role" value="管理员" >管理员
        <input type="radio" name="role" value="普通用户" >普通用户
      </p>
      <p><input type="submit" value="登录"></p>
    </form>
  
  </body>
</html>
