package cn.BlackHumour.easymeeting.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.BlackHumour.easymeeting.entity.Page;
import cn.BlackHumour.easymeeting.service.BaseService;




/**
 * @author EricFu
 * @date 2017-8-21 下午10:10:07
 */
@Controller
@RequestMapping("/base")
public class BaseAction<T> {

	@InitBinder()
	protected void initBinder(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(
				Date.class, 
				new CustomDateEditor(
						new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"), 
						true
						)
				);
	}

	@RequestMapping("/goURL/{folder}/{file}")
	public String goURL(@PathVariable String folder, @PathVariable String file) {
		return "forward:/WEB-INF/jsp/"+folder+"/"+file+".jsp";
	}
	
	
	
	public String list(String fileString, T keyEntity, BaseService<T> baseService, String command, Page<T> page, Model model, HttpSession session) {
		if(page.getCurrentPage()==null||"".equals(page.getCurrentPage())) {
			page.setCurrentPage(1);
			System.out.println("====+++=="+page.getCurrentPage());
		}
		int currentPage = page.getCurrentPage();
		if (session.getAttribute("page")!=null) {
			page  = (Page<T>) session.getAttribute("page");
			System.out.println("======"+page.getCurrentPage());
		}
		page.setKeyEntity(keyEntity);
		if("next".equals(command)) {
			System.out.println(page.getCurrentPage());
			System.out.println(page.getPageCount());
			if(page.getCurrentPage()==page.getPageCount()) {
				System.out.println(page.getCurrentPage()+"------");
				page.setCurrentPage(page.getPageCount()-1);
			}
			page.setCurrentPage(page.getCurrentPage()+1);
			System.out.println(page.getCurrentPage());
		} else if("previous".equals(command)) {
			if(page.getCurrentPage()==1) {
				page.setCurrentPage(2);
			}
			page.setCurrentPage(page.getCurrentPage()-1);
		} else if("home".equals(command)) {
			page.setCurrentPage(1);
		} else if("end".equals(command)) {
			page.setCurrentPage(page.getPageCount());
		} else {
			page.setCurrentPage(currentPage);
		}
		page.setPageData(baseService.selectPageList(page));
		page.setTotalRecordsCount(baseService.selectRecordsCount(page));
		session.setAttribute("page", page);
		return "forward:/base/goURL/"+fileString+"/list.action";
	}
}
