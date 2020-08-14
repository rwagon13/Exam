package com.dxc.hotelmanagement;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Room")
public class Room {

	private String roomId;
	private String type;
	private String status;
	private int costPerDay;
	
	@Id
	@Column(name="RoomId")
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String RoomId) {
		roomId = RoomId;
	}
	@Column(name="Type")
	public String getType() {
		return type;
	}
	public void setType(String Type) {
		type = Type;
	}
	@Column(name="Status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String Status) {
		this.status = Status;
	}
	@Column(name="CostPerDay")
	public int getCostPerDay() {
		return costPerDay;
	}
	public void setCostPerDay(int CostPerDay) {
		costPerDay = CostPerDay;
	}
}
	