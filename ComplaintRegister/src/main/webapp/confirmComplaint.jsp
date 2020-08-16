<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dxc.complaint.Complaint"%>
<%@page import="com.dxc.complaint.ComplaintCrud"%>
<%@page import="java.sql.Date" %>
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
	Complaint complaint = new Complaint();
	//complaint.setComplaintId(1);
	String des = request.getParameter("description");
	if (des!= null)
		complaint.setDescription(des);
	else
		complaint.setDescription("If rectified it is good");
    String ct=request.getParameter("complaintType");
    if (ct!= null)
    	complaint.setComplaintType(request.getParameter("complaintType"));
    else
    	complaint.setComplaintType("No complaint");
	
    String strcdate = request.getParameter("Cdate");
    Date cdate;
	if (strcdate == null)
	{
            cdate = Date.valueOf("2020-08-15");
	} 
	else 
    {
            cdate = Date.valueOf(strcdate);
    }
    complaint.setCdate(cdate);
    //int tat;
    /* if (request.getParameter("Tat")!=null)
    {
    	tat = Integer.parseInt(request.getParameter("Tat"));
    }
    else
    {
    	tat=0;
    } */
    long millis=System.currentTimeMillis(); 
    java.sql.Date sqlDate = new java.sql.Date(millis);
    SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
    long ms = (sdf.parse(sdf.format(sqlDate)).getTime())-(sdf.parse(sdf.format(complaint.getCdate())).getTime());
    long m = ms / (1000*24*60*60);
    int tat = (int) m;
    if(tat == 0){
    	complaint.setTat(1);
    }
    else{
    complaint.setTat(tat);
    }
  	int severity;
  	if (request.getParameter("severity")!=null)
  	{
  		severity = Integer.parseInt(request.getParameter("severity"));
  	}
  	else
  	{
  		severity = 0;
  	}
    complaint.setSeverity(severity);
   	complaint.setCstatus("PENDING");

%>
<%= new ComplaintCrud().registerComplaint(complaint) %>
</body>
</html>