package cn.BlackHumour.easymeeting.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.BlackHumour.easymeeting.entity.Employee;
import cn.BlackHumour.easymeeting.entity.Visit;
import cn.BlackHumour.easymeeting.service.EmployeeService;
import cn.BlackHumour.easymeeting.service.VisitService;

/**
 * @author EricFu
 * @date 2017-8-22 上午10:07:20
 */
@Controller
@RequestMapping("/home")
public class MainAction {

	@Resource
	private EmployeeService employeeService;
	
	@Resource
	private VisitService visitService;
	
	@RequestMapping("/index")
	public String goIndex(HttpServletRequest reuqest) {
		String ipString = reuqest.getRemoteAddr();
		if (visitService.exists(ipString)) {
			visitService.addCount(ipString);
		} else {
			Visit visit = new Visit();
			visit.setIp(ipString);
			visitService.insert(ipString);
		}
		int count = visitService.getCount();
		reuqest.getSession().getServletContext().setAttribute("count", count);
		return "forward:/WEB-INF/jsp/home/index.jsp";
	}
	
	@RequestMapping("/header")
	public String getHeader() {
		return "forward:/WEB-INF/jsp/home/header.jsp";
	}
	
	@RequestMapping("/left")
	public String getLeft() {
		return "forward:/WEB-INF/jsp/home/left.jsp";
	}
	
	@RequestMapping("/footer")
	public String getFooter() {
		return "forward:/WEB-INF/jsp/home/footer.jsp";
	}
	
	@RequestMapping("/main")
	public String getMain() {
		return "forward:/WEB-INF/jsp/home/main.jsp";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session) {
		if (session.getAttribute("id")!=null) {
			return "redirect:/home/index.action";
		}
		return "forward:/WEB-INF/jsp/home/login.jsp";
	}
	
	@RequestMapping("/loginSubmit")
	public String loginSubmit(Employee employee, HttpSession session) {
		Employee e = employeeService.login(employee);
		if (e!= null) {
			session.setAttribute("id", e.getId());
			session.setAttribute("name", e.getName());
		} else {
			session.setAttribute("message", "登录");
			return "forward:/WEB-INF/jsp/failure.jsp";
		}
		return "redirect:/home/index.action";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("name");
		return "redirect:/home/login.action";
	}
}
