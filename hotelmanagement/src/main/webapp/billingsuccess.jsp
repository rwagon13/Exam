<%@page import="com.dxc.hotelmanagement.HotelDAO" %>
<%@page import="com.dxc.hotelmanagement.Billing" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="billing" class="com.dxc.hotelmanagement.Billing" />
<%-- <jsp:setProperty name="billing" property="BookId"/> --%>
<%-- <jsp:setProperty name="billing" property="RoomId"/> --%>
<%
String BookId = request.getParameter("BookId");
billing.setBookId(BookId);

HotelDAO obj = new HotelDAO();
int nod = obj.noOfDays(BookId);
billing.setNoOfDays(nod);

String RoomId = request.getParameter("RoomId");
billing.setRoomId(RoomId);

int BillAmt = Integer.parseInt(request.getParameter("BillAmt"));
billing.setBillAmt(BillAmt);

%>
<%= new HotelDAO().addBill(billing) %>
</body>
</html>