<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.util.*"%>
<html>
 <head>
   <title>购物车</title>
 </head>
 <jsp:useBean id="Cart" scope="session" class="Cart.cart"/>
 <jsp:setProperty name="Cart" property="*"/>
 <%
  String bookName = request.getParameter("BName");
  String bookNumber = request.getParameter("BNumber");
  if(bookName != null && bookName != "")
  {
   int nbookNumber = Integer.parseInt(bookNumber);
   Cart.add(bookName,nbookNumber);
  }
  Hashtable h = Cart.ShowCartInf();
  Enumeration e = h.keys();
  float sum=Cart.getSum();
 %>
 <body>
 <div align="center">
  <p>您所选购的书籍有：</p>
  <table width="80%" border="0">
  <tr>
    <td width="50%" height="25" align="right">书籍名称&nbsp;&nbsp;</td>
    <td width="50%" align="left" colspan="2">&nbsp;数量（本）</td>
	</tr>
  <%
   //循环显示购物车中商品信息
    while(e.hasMoreElements())
    {
    String name = e.nextElement().toString();
    int number = ((Integer)h.get(name)).intValue();
  %>
    <tr>
    <td width="50%" height="25" align="right"><font color="#0000FF"><%=name%>：</font></td>
    <td width="20%" align="left">&nbsp;<font color="#FF0000"><%=number%></font></td>
    <td width="30%" align="left">&nbsp;  
    <input type="button" name="BName" value="删除"
    onClick="javascript:window.location='Delete.jsp?BName=<%=name%>'"></td>
    </tr>
  <%
   }
   
  %>
  <tr>
  <td width="50%" height="25" align="right"><font color="#0000FF">总价格：</font></td>
  <td width="50%" height="25" align="left" colspan="2"><font color="#0000FF">&nbsp;<%=sum%>&nbsp;元</font></td>
  </tr>
   <tr>
     <td colspan="3">&nbsp;</td>
	</tr>
	 <tr>
    <td width="50%" height="25" align="right"><input type="button" name="continue" value="继续购物" onClick="javascript:window.location='Cart.html'"></td>
    <td width="50%" height="25" align="left" colspan="2">&nbsp;&nbsp;<input type="button" name="finish" value="完成" onClick="javascript:window.location='#'"></font></td>
	</tr>
  </table>  
  <p></p>                                            
 </div>
 </body>
</html>
