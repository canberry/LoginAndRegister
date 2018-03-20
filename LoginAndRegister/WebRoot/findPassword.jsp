<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>find back password</title>
    <script type="text/javascript">
      function check() {
        var un = document.getElementById("un").value;
        var pwd = document.getElementById("pwd").value;
        var repeatpwd = document.getElementById("repeatpwd").value;
        
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
        
        if (errMsg != "") {
          alert(errMsg);
          return false;
        }
      }
      
      function checkPassword() {
        var pwd = document.getElementById("pwd").value;
        var repeatpwd = document.getElementById("repeatpwd").value;
        var repeatPasswordErr = document.getElementById("repeatPasswordErr");
        var okbtn = document.getElementById("ok");
        
        if(pwd != repeatpwd) {
          //alert("密码不一致");
          repeatPasswordErr.innerHTML = "*密码不一致";
          
          okbtn.disabled = true;
          return false;
        }
        
        okbtn.disabled = false;
        repeatPasswordErr.innerHTML = "";
        return true;
      }
    </script>
  </head>
  
  <body>
    <form action="handler" method="post" onsubmit="return check()">
      <input type="hidden" name="m" value="findPassword">
      <p>用户名：
        <input name="username" id="un">
      </p>
      <p>输入新密码：
        <input type="password" name="password" id="pwd">
      </p>
      <p>确认密码：
        <input type="password" name="repeatpassword" id="repeatpwd" onblur="checkPassword()">
      </p>
      <div id="repeatPasswordErr" style="color:red;"></div>
      <p><input type="submit" value="确认" id="ok"></p>
    </form>
  
  </body>
</html>
