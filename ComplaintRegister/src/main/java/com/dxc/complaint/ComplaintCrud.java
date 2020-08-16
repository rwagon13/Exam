package com.dxc.complaint;

import java.util.List;

import javax.persistence.Query;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class ComplaintCrud {

	public String registerComplaint(Complaint complaint) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
		HibernateTemplate ht=(HibernateTemplate)ctx.getBean("hibernateTemplate");
		ht.save(complaint);
		return "Complaint Registered";
	}
		
	public String resolveComplaint(Resolve resolve ) 
	{
		ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
		HibernateTemplate ht=(HibernateTemplate)ctx.getBean("hibernateTemplate");
		ht.save(resolve);
		String result;
		int complaintId = resolve.getComplaintId();
		Complaint complaint = null;
		List<Complaint> complaints = ht.find("from Complaint where ComplaintId="+complaintId+"and Cstatus='PENDING'");
		if(complaints.size()>0) {
			complaint=complaints.get(0);
		}
		else {
			result = "complaint not found";
		}
		complaint.setCstatus("RESOLVED");
		ht.merge(complaint);
		result = "complaint resolved";
		return result;
	}
	
	public List<Complaint> showComplaints(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
		HibernateTemplate ht=(HibernateTemplate)ctx.getBean("hibernateTemplate");
		List<Complaint> complaints = ht.find("from Complaint where Cstatus='PENDING'");
		return complaints;
	}

}
