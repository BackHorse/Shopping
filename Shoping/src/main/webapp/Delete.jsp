<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
 <head>
   <title>¹ºÎï³µ</title>
 </head>
 <jsp:useBean id="Cart" scope="session" class="Cart.cart"/>
 <jsp:setProperty name="Cart" property="*"/>
 <body>
 <div align="center">
 <%
  String bookName = request.getParameter("BName");
  Cart.delete(bookName);
  response.sendRedirect("ShowCartInf.jsp");
 %>
 </div>
 </body>
</html>