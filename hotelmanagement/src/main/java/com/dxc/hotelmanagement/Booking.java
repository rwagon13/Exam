package com.dxc.hotelmanagement;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Booking")
public class Booking {

	private String bookId;
	private String roomId;
	private String custname;
	private String city;
	private Date bookdate;
	private Date chkdate;
	
	
	@Id
	@Column(name="BookId")
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	@Column(name="RoomId")
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	@Column(name="CustName")
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	@Column(name="City")
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Column(name="BookDate")
	public Date getBookdate() {
		return bookdate;
	}
	public void setBookdate(Date bookdate) {
		this.bookdate = bookdate;
	}
	@Column(name="ChkDate")
	public Date getChkdate() {
		return chkdate;
	}
	public void setChkdate(Date chkdate) {
		this.chkdate = chkdate;
	}
		
}
