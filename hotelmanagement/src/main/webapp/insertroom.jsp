<%@page import="com.dxc.hotelmanagement.Room"%>
<%@page import="com.dxc.hotelmanagement.HotelDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Room</title>
</head>
<body>
<jsp:useBean id="room" class="com.dxc.hotelmanagement.Room" />
<jsp:setProperty name="room" property="roomId"/>
<jsp:setProperty name="room" property="status"/>
<jsp:setProperty name="room" property="type" />
<%
if (request.getParameter("costPerDay") != null) 
{
		int cpd = Integer.parseInt(request.getParameter("costPerDay"));
		room.setCostPerDay(cpd);
}
%>

<%= new HotelDAO().addRoom(room) %>
</body>
</html>