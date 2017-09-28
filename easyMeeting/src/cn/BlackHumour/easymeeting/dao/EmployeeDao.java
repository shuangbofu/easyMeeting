package cn.BlackHumour.easymeeting.dao;

import java.util.List;

import cn.BlackHumour.easymeeting.entity.Employee;

/**
 * @author EricFu
 * @date 2017-8-21 下午11:13:29
 */
public interface EmployeeDao extends BaseDao<Employee>{
	List<Employee> search(Employee employee);
	List<Employee> listByStatus(int id);
	List<Employee> selectByMeetingId(int id);
	Employee login(Employee employee);
	List<Employee> getEmployeesByDetpId(int deptId);
	Employee existsCheck(String account);
}
