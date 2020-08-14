<%@page import="com.dxc.hotelmanagement.HotelDAO" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Room</title>
</head>
<body>
<%
HotelDAO obj = new HotelDAO();
String bid = obj.generateBookId();
%>
<form method="post" action="bookingconfirm.jsp">
<center>
BookId:<input type="text" name="bookId" value=<%= bid %> readonly="readonly"><br></br>
RoomId:
<select name="roomId" > <!-- onchange="this.form.submit()" -->
	<option value="please Select">Select Room Id</option>
	<%
	List <String> lrooms=new HotelDAO().getRoomId();
	for(String s : lrooms)
	{
	%>
		<option value="<%=s%>"> <%=s%> </option>
	<%
		}
	%>
			</select>
		<br/><br/>
Customer Name:
<input type="text" name="custname" /><br></br>
City
<input type="text" name="city" /><br></br>
Book Date:
<input type="date" name="bookdate" /><br></br>
Check Date:
<input type="date" name="chkdate" /><br></br>
<input type="submit" value="BookRoom" />
</center>
</form>
</body>
</html>