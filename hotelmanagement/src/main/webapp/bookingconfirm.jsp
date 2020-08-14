<%@page import="com.dxc.hotelmanagement.Booking"%>
<%@page import="com.dxc.hotelmanagement.HotelDAO" %>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="booking" class="com.dxc.hotelmanagement.Booking" />
<jsp:setProperty name="booking" property="bookId"/>
<jsp:setProperty name="booking" property="roomId"/>
<jsp:setProperty name="booking" property="custname"/>
<jsp:setProperty name="booking" property="city"/>
<%
//String roomId = request.getParameter("roomId");
String bdate = request.getParameter("bookdate");
Date bd = Date.valueOf(bdate);
booking.setBookdate(bd);
String cdate = request.getParameter("chkdate");
Date cd = Date.valueOf(cdate);
booking.setChkdate(cd);
%>
<%=new HotelDAO().addBooking(booking) %>
</body>
</html>