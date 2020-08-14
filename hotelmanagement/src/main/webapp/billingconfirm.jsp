<%@page import="com.dxc.hotelmanagement.HotelDAO" %>
<%@page import="com.dxc.hotelmanagement.Room" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String BookId = request.getParameter("BookId");
HotelDAO obj = new HotelDAO();
int nod = obj.noOfDays(BookId);
%>
<%
String RoomId = request.getParameter("RoomId");
int price = obj.billAmount(RoomId);
int BillAmt = price*nod;
%>
<form method="post" action="billingsuccess.jsp" >
<center>
Number Of Days:
<input type="text" name="NoOfDays" value="<%=nod %>" readonly="readonly"><br></br>
Bill Amount:
<input type="text" name="BillAmt" value="<%=BillAmt %>" readonly="readonly"><br></br>
<input type="submit" name="save">
</center>
</form>
</body>
</html>