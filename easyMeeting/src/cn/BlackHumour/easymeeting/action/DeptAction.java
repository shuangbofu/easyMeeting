package cn.BlackHumour.easymeeting.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.BlackHumour.easymeeting.entity.Dept;
import cn.BlackHumour.easymeeting.service.DeptService;

/**
 * @author EricFu
 * @date 2017-8-21 下午11:47:28
 */
@Controller
@RequestMapping("/dept")
public class DeptAction extends BaseAction<Dept>{

	@Resource
	private DeptService deptService;
	
	@RequestMapping("/list")
	public String listDept(Model model) {
		List<Dept> depts = deptService.list();
		model.addAttribute("depts", depts);
		String url = "forward:/base/goURL/dept/list.action";
		return url;
	}
	
	@RequestMapping("/add")
	public String add(Dept dept) {
		deptService.insert(dept);
		return "forward:/dept/list.action";
	}
	
	@RequestMapping("/delete")
	public String delete(int id) { 
		deptService.delete(id);
		return "forward:/dept/list.action";
	}
}
