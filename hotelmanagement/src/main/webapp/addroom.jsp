<%@page import="com.dxc.hotelmanagement.Room"%>
<%@page import="com.dxc.hotelmanagement.HotelDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Room</title>
</head>
<body>
<%
HotelDAO dao = new HotelDAO();
String rid = dao.generateRoomId();
%>
<form method="post" action="insertroom.jsp">
	<center>
		RoomId:
		<input type="text" name="roomId" value=<%=rid %>  readonly="readonly" /><br></br>
		Type:
		<select name="type">
		<option value="Single">Single</option>
		<option value="Double">Double</option>
		</select><br></br>
		Status:
		<input type="text" name="status" value="Available" readonly="readonly" /><br></br>
		CostPerDay:
		<input type="text" name="costPerDay" /><br></br>
		<input type="submit" value="AddRoom" />
	</center>
</form>
</body>
</html>