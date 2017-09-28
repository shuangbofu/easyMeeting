package cn.BlackHumour.easymeeting.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.BlackHumour.easymeeting.dao.EmployeeDao;
import cn.BlackHumour.easymeeting.entity.Employee;
import cn.BlackHumour.easymeeting.service.EmployeeService;

/**
 * @author EricFu
 * @date 2017-8-21 下午11:24:57
 */
@Service
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements EmployeeService{

	
	@Resource
	private EmployeeDao employeeDao;
	

	public List<Employee> search(Employee employee) {
		return employeeDao.search(employee);
	}


	public int setStatus(int id, int status) {
		Employee e = new Employee();
		e.setId(id);
		e.setStatus(status);
		return employeeDao.update(e);
	}


	public List<Employee> listByStatus(int id) {
		return employeeDao.listByStatus(id);
	}


	public List<Employee> selectByMeetingId(int id) {
		return employeeDao.selectByMeetingId(id);
	}


	public Employee login(Employee employee) {
		return employeeDao.login(employee);
	}


	public List<Employee> getEmployeesByDetpId(int deptId) {
		return employeeDao.getEmployeesByDetpId(deptId);
	}


	public Employee existsCheck(String account) {
		return employeeDao.existsCheck(account);
	}

}
