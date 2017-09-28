package cn.BlackHumour.easymeeting.service;

import java.util.List;

import cn.BlackHumour.easymeeting.entity.Employee;

/**
 * @author EricFu
 * @date 2017-8-21 下午11:24:43
 */
public interface EmployeeService extends BaseService<Employee>{
	List<Employee> search(Employee employee);
	int setStatus(int id, int status);
	List<Employee> listByStatus(int id);
	List<Employee> selectByMeetingId(int id);
	Employee login(Employee employee);
	List<Employee> getEmployeesByDetpId(int deptId);
	Employee existsCheck(String account);
}
