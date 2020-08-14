package com.dxc.hotelmanagement;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Billing")
public class Billing {

	private String BookId;
	private String RoomId;
	private int NoOfDays;
	private int BillAmt;
	
	@Id
	@Column(name="BookId")
	public String getBookId() {
		return BookId;
	}
	public void setBookId(String bookId) {
		BookId = bookId;
	}
	
	@Column(name="RoomId")
	public String getRoomId() {
		return RoomId;
	}
	public void setRoomId(String roomId) {
		RoomId = roomId;
	}
	
	@Column(name="NoOfDays")
	public int getNoOfDays() {
		return NoOfDays;
	}
	public void setNoOfDays(int noOfDays) {
		NoOfDays = noOfDays;
	}
	
	@Column(name="BillAmt")
	public int getBillAmt() {
		return BillAmt;
	}
	public void setBillAmt(int billAmt) {
		BillAmt = billAmt;
	}
	
}
