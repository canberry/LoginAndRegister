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
          errMsg += "�û�������Ϊ�գ�";
        }
        if (pwd == "") {
          errMsg += "���벻��Ϊ�գ�";
        }
        if (repeatpwd == "") {
          errMsg += "�ظ����벻��Ϊ�գ�";
        }
        
        for(var i=0; i<role.length; i++) {
          if (role.item(i).checked) break;
        }
        if (i == role.length) {
          errMsg += "��ɫ����Ϊ�գ�";
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
          //alert("���벻һ��");
          repeatPasswordErr.innerHTML = "*���벻һ��";
          
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
      <p>�û�����<input name="username" id="un"></p>
      <p>��&nbsp;&nbsp;�룺<input type="password" name="password" id="pwd"></p>
      <p>�ظ����룺<input type="password" name="repeatpassword" id="repeatpwd" onblur="checkPassword()"></p>
      <div id="repeatPasswordErr" style="color:red"></div>
      <p>��ɫ��
        <input type="radio" name="role" value="����Ա">����Ա
        <input type="radio" name="role" value="��ͨ�û�">��ͨ�û�
      </p>
      <p><input type="submit" value="ע��" id="regbtn"></p>
    </form>
  
  </body>
</html>
