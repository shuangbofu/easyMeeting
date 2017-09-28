package cn.BlackHumour.easymeeting.entity;
/**
 * @author EricFu
 * @date 2017-8-21 下午10:20:27
 */
public class Employee {
	private int id;
	private String account;
	private String password;
	private String name;
	private String phone;
	private String email;
	private Dept dept;
	private int gender;
	private Integer status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", account=" + account + ", password="
				+ password + ", name=" + name + ", phone=" + phone + ", email="
				+ email + ", dept=" + dept + ", gender=" + gender + ", status="
				+ status + "]";
	}
}
