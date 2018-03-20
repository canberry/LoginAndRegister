<%@page contentType="image/jpeg" %><%@page language="java" pageEncoding="gbk"%>
<jsp:useBean id="image" scope="page" class="dao.MakeCertPic"/>
<%
 String str = image.getCertPic(0,0,response.getOutputStream());
 /* 
        getOutputStream(), setCharacterEncoding(java.lang.String)
如API所言，由于ServletResponse.getOutputStream()方法和
setCharacterEncoding方法都有可能被调用，来输出JSP页面的内容，
如果其中的一个方法被调用了，再调用另一个方法就会抛出异常:
getOutputStream() has already been called for this response
以下两行解决此方法
*/
out.clear();//清空缓存的内容。
pageContext.pushBody();
/*
pushBody()方法返回一个新的BodyContent(代表一个HTML页面的BODY部分内容）
保存JspWriter实例的对象
out更新PageContext的out属性的内容
*/
 //将验证码存入session中
 session.setAttribute("certCode",str);
 System.out.println(str);
%>