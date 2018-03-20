<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>register</title>
    <script type="text/javascript">
      function check() {
        var un = document.getElementById("un").value;
        var pwd = document.getElementById("pwd").value;
        var repeatpwd = document.getElementById("repeatpwd").value;
        var role = document.getElementsByName("role");
        
        var errMsg = "";
        
        if (un == "") {
          errMsg += "用户名不能为空！";
        }
        if (pwd == "") {
          errMsg += "密码不能为空！";
        }
        if (repeatpwd == "") {
          errMsg += "重复密码不能为空！";
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
    
      function checkPassword() {
        var pwd = document.getElementById("pwd").value;
        var repeatpwd = document.getElementById("repeatpwd").value;
        var repeatPasswordErr = document.getElementById("repeatPasswordErr");
        var regbtn = document.getElementById("regbtn");
        
        if(pwd != repeatpwd) {
          //alert("密码不一致");
          repeatPasswordErr.innerHTML = "*密码不一致";
          
          regbtn.disabled = true;
          return false;
        }
        
        regbtn.disabled = false;
        repeatPasswordErr.innerHTML = "";
        return true;
      }
    </script>
  </head>
  
  <body>
    <form action="handler" method="post" onsubmit="return check()">
      <input type="hidden" name="m" value="register">
      <p>用户名：<input name="username" id="un"></p>
      <p>密&nbsp;&nbsp;码：<input type="password" name="password" id="pwd"></p>
      <p>重复密码：<input type="password" name="repeatpassword" id="repeatpwd" onblur="checkPassword()"></p>
      <div id="repeatPasswordErr" style="color:red"></div>
      <p>角色：
        <input type="radio" name="role" value="管理员">管理员
        <input type="radio" name="role" value="普通用户">普通用户
      </p>
      <p><input type="submit" value="注册" id="regbtn"></p>
    </form>
  
  </body>
</html>
