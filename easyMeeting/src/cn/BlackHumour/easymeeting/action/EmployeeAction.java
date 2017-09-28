package cn.BlackHumour.easymeeting.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.BlackHumour.easymeeting.entity.Dept;
import cn.BlackHumour.easymeeting.entity.Employee;
import cn.BlackHumour.easymeeting.entity.Page;
import cn.BlackHumour.easymeeting.service.DeptService;
import cn.BlackHumour.easymeeting.service.EmployeeService;

/**
 * @author EricFu
 * @date 2017-8-21 下午10:08:06
 */
@Controller
@RequestMapping("/employee")
public class EmployeeAction extends BaseAction<Employee>{
	
	@Resource
	private DeptService deptService;
	
	@Resource
	private EmployeeService employeeService;
	
	@RequestMapping("/register")
	public String register(Model model) {
		String url = "forward:/base/goURL/employee/register.action";
		List<Dept> depts = deptService.list();
		model.addAttribute("depts", depts);
		return url;
	}
	
	@RequestMapping("/search")
	public String search(Employee employee, Page<Employee> page, Model model, String command, HttpSession session) {
		// page.setKeyEntity(employee);
		if ("".equals(employee.getAccount())) {
			employee.setAccount(null);
		}
		if ("".equals(employee.getName())) {
			employee.setName(null);
		}
		super.list("search", employee, employeeService, command, page, model, session);
		return "forward:/base/goURL/employee/search.action";
	}
	
	@RequestMapping("/exam")
	public String waitExamList(Model model) {
		List<Employee> employees = employeeService.listByStatus(4);
		model.addAttribute("employees", employees);
		return "forward:/base/goURL/employee/exam.action";
	}
	
	@RequestMapping("/editPsd")
	public String edit() {
		return "forward:/base/goURL/employee/editPsd.action";
	}
	
	// -------------------------------------------------------------
	@RequestMapping("/registerSubmit") 
	public String register(Employee employee, Model model) {
		boolean flag = employeeService.insert(employee);
		model.addAttribute("message", "注册");
		String flagString = flag ? "success" : "failure";
		return "forward:/WEB-INF/jsp/"+flagString+".jsp";
	}
	
	@RequestMapping("/updatePsd")
	public String updatePsd(Employee employee) {
		 employeeService.update(employee);
		return "redirect:/home/index.action";
	}
	
	// ---------------------------ajax--------------------------------
	
	@RequestMapping(value="/close", method=RequestMethod.POST)
	public @ResponseBody 
	String close(int id) {
		int flag = employeeService.setStatus(id, 2);
		if (flag > 0) {
			return "success";
		} else {
			return "failure";
		}
	}
	
	@RequestMapping(value="/setStatus", method=RequestMethod.POST)
	public @ResponseBody
	String setStatus(int id, int status) {
		int flag = employeeService.setStatus(id, status);
		if (flag > 0) {
			return "success";
		} else {
			return "failure";
		}
	}
	
	@RequestMapping(value="/getEmployeesByDetpId", method=RequestMethod.POST)
	public @ResponseBody
	List<Employee> getEmployeesByDetpId(int deptId) {
		return employeeService.getEmployeesByDetpId(deptId);
	}
	
	@RequestMapping(value="/existsCheck", method=RequestMethod.POST)
	public @ResponseBody
	String existsCheck(String account) {
		Employee employee = employeeService.existsCheck(account);
		return employee!=null ? "failure" : "success";
	}
}
