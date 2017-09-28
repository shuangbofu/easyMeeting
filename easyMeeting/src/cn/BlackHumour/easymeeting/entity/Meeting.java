package cn.BlackHumour.easymeeting.entity;

import java.util.Date;
import java.util.List;

/**
 * @author EricFu
 * @date 2017-8-21 下午6:16:02
 */
public class Meeting {
	private int id;
	private String name;
	private Room room;
	private int count;
	private Date startTime;
	private Date endTime;
	private Date createTime;
	private String note;
	private Employee creator;
	private Integer status;
	private List<Employee> employees;
	
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}

	public Employee getCreator() {
		return creator;
	}
	public void setCreator(Employee creator) {
		this.creator = creator;
	}
	@Override
	public String toString() {
		return "Meeting [id=" + id + ", name=" + name + ", room=" + room
				+ ", count=" + count + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", createTime=" + createTime
				+ ", note=" + note + ", creator=" + creator + ", status="
				+ status + ", employees=" + employees + "]";
	}
}
