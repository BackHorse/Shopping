<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.util.*"%>
<html>
 <head>
   <title>���ﳵ</title>
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
  <p>����ѡ�����鼮�У�</p>
  <table width="80%" border="0">
  <tr>
    <td width="50%" height="25" align="right">�鼮����&nbsp;&nbsp;</td>
    <td width="50%" align="left" colspan="2">&nbsp;����������</td>
	</tr>
  <%
   //ѭ����ʾ���ﳵ����Ʒ��Ϣ
    while(e.hasMoreElements())
    {
    String name = e.nextElement().toString();
    int number = ((Integer)h.get(name)).intValue();
  %>
    <tr>
    <td width="50%" height="25" align="right"><font color="#0000FF"><%=name%>��</font></td>
    <td width="20%" align="left">&nbsp;<font color="#FF0000"><%=number%></font></td>
    <td width="30%" align="left">&nbsp;  
    <input type="button" name="BName" value="ɾ��"
    onClick="javascript:window.location='Delete.jsp?BName=<%=name%>'"></td>
    </tr>
  <%
   }
   
  %>
  <tr>
  <td width="50%" height="25" align="right"><font color="#0000FF">�ܼ۸�</font></td>
  <td width="50%" height="25" align="left" colspan="2"><font color="#0000FF">&nbsp;<%=sum%>&nbsp;Ԫ</font></td>
  </tr>
   <tr>
     <td colspan="3">&nbsp;</td>
	</tr>
	 <tr>
    <td width="50%" height="25" align="right"><input type="button" name="continue" value="��������" onClick="javascript:window.location='Cart.html'"></td>
    <td width="50%" height="25" align="left" colspan="2">&nbsp;&nbsp;<input type="button" name="finish" value="���" onClick="javascript:window.location='#'"></font></td>
	</tr>
  </table>  
  <p></p>                                            
 </div>
 </body>
</html>
