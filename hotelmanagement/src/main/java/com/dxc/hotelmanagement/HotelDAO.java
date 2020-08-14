package com.dxc.hotelmanagement;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;



/*import com.dxc.hotelmanagement.Room;
import com.dxc.hotelmanagement.SessionHelper;
*/

public class HotelDAO 
{
	
	public String addBill(Billing billing) {
		SessionFactory sf = SessionHelper.getFactory();
		Session s = sf.openSession();
		Transaction t =s.beginTransaction();
		//String rid = generateRoomId();
		//room.setRoomId(rid);
		s.save(billing);
		t.commit();
	return "Bill Added Successfully...";
	}
	public int noOfDays(String bookId) {
		int result = 0;
		SessionFactory sf = SessionHelper.getFactory();
		Session s = sf.openSession();
		Query q = s.createQuery("select DATEDIFF(ChkDate,BookDate) from Booking where bookId='"+bookId+"'");
		List<?> lst = q.list();
		
		for(Object ob : lst){
			result=(Integer)ob;
		}
		return result;
	}
	public int billAmount(String roomId) {
		int price = 0;
		SessionFactory sf = SessionHelper.getFactory();
		Session s = sf.openSession();
		Query q = s.createQuery("select costPerDay from Room where roomId='"+roomId+"'");
		List <?> lst = q.list();
		int cpd = (int)lst.get(0);
		return cpd;
	}
	public String addBooking(Booking booking) {
		SessionFactory sf = SessionHelper.getFactory();
		Session s = sf.openSession();
		Transaction t =s.beginTransaction();
		String rid = booking.getRoomId();
		Query q = s.createQuery("UPDATE Room SET Status='Booked' Where RoomId='"+rid+"'");
		q.executeUpdate();
		s.save(booking);
		t.commit();
	return "Booking Done Successfully...";
	}
	
	public List<String> getRoomId() 
	{
		SessionFactory sf = SessionHelper.getFactory();
		Session s = sf.openSession();
		Query q = s.createQuery("select roomId from Room Where Status = 'Available'");
		List <String> rooms=q.list();
		return rooms;
	}
	public String generateBookId() {
		SessionFactory sf = SessionHelper.getFactory();
		Session s = sf.openSession();
		Query q = s.createQuery("select count(bookId) from Booking");
		List blist = q.list();
		Number bid = (Number) blist.get(0);
		int id = bid.intValue();
		String result = "";
		id++;
		if (id >= 1 && id <= 9) {
			result = "B00"+id;
		}
		if (id >=10 && id <= 99) {
			result = "B0" +id;
		}
		if (id >=100 && id <=999) {
			result = "B"+id;
		}
		return result;
	}
	public String generateRoomId() {
		SessionFactory sf = SessionHelper.getFactory();
		Session s = sf.openSession();
		Query q = s.createQuery("select count(RoomId) from Room");
		List rlist = q.list();
		Number rid = (Number) rlist.get(0);
		int id = rid.intValue();
		String result="";
		id++;
		if (id >= 1 && id <= 9) {
			result = "R00"+id;
		}
		if (id >=10 && id <= 99) {
			result = "R0" +id;
		}
		if (id >=100 && id <=999) {
			result = "R"+id;
		}
		
return result;
	}
	
	public String addRoom(Room room) {
		SessionFactory sf = SessionHelper.getFactory();
		Session s = sf.openSession();
		Transaction t =s.beginTransaction();
		//String rid = generateRoomId();
		//room.setRoomId(rid);
		s.save(room);
		t.commit();
	return "Room Added Successfully...";
	}
}
