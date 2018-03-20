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
          errMsg += "�û�������Ϊ�գ�";
        }
        if (pwd == "") {
          errMsg += "���벻��Ϊ�գ�";
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
      
      function changeImg() {
        var img = document.getElementById("code"); 
        now = new Date(); 
        img.src="makeCertPic.jsp?code="+now.getTime();
      }
      
      //�鿴���																										1
      function isVerMacth(actualCode) {
		 var inputVerCode = document.getElementById("certCode").value;
		 var vertCodeErr = document.getElementById("vertCodeErr");
		 
		 if(inputVerCode != actualCode) {
		   vertCodeErr.innerHTML = "*��֤�벻һ��";
		 }
      }
    
    </script>

  </head>
  
  <body>
    <form action="handler" method="post" onsubmit="return check()">
      <input type="hidden" name="m" value="login">
      <p>�û�����
        <input name="username" id="un">
        <a href="register.jsp">ע��</a>
      </p>
      <p>��&nbsp;&nbsp;�룺
        <input type="password" name="password" id="pwd">
        <a href="findPassword.jsp">��������?</a>
      </p>
      <p>��֤�룺
        <input type="text" id="certCode" onblur="isVerMacth(${session.certCode })">
        <img id="code" src="makeCertPic.jsp"/>
        <a href="javascript:changeImg()">��һ��</a>
      </p>
      <div id="vertCodeErr" style="color:red">*</div>
      <p>
        <input type="radio" name="role" value="����Ա" >����Ա
        <input type="radio" name="role" value="��ͨ�û�" >��ͨ�û�
      </p>
      <p><input type="submit" value="��¼"></p>
    </form>
  
  </body>
</html>
