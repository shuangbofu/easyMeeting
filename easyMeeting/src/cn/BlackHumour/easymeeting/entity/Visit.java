package cn.BlackHumour.easymeeting.entity;
/**
 * @author EricFu
 * @date 2017-8-22 下午5:59:08
 */
public class Visit {
	private int id;
	private String ip;
	private int count;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
