package cn.BlackHumour.easymeeting.entity;
/**
 * @author EricFu
 * @date 2017-8-21 下午5:23:57
 */
public class Room {
	private int id;
	private int number;
	private String name;
	private int maxCount;
	private Integer status;
	private String note;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMaxCount() {
		return maxCount;
	}
	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@Override
	public String toString() {
		return "Room [id=" + id + ", number=" + number + ", name=" + name
				+ ", maxCount=" + maxCount + ", status=" + status + ", note="
				+ note + "]";
	}
}
