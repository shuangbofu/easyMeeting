package cn.BlackHumour.easymeeting.action;

import java.util.Date;
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
import cn.BlackHumour.easymeeting.entity.Meeting;
import cn.BlackHumour.easymeeting.entity.Room;
import cn.BlackHumour.easymeeting.service.DeptService;
import cn.BlackHumour.easymeeting.service.EmployeeService;
import cn.BlackHumour.easymeeting.service.MeetingService;
import cn.BlackHumour.easymeeting.service.RoomService;

/**
 * @author EricFu
 * @date 2017-8-21 下午6:27:41
 */
@Controller
@RequestMapping("/meeting")
public class MeetingAction extends BaseAction<Meeting> {

	@Resource
	private MeetingService meetingService;
	
	@Resource
	private RoomService roomService;
	
	@Resource
	private DeptService deptService;
	
	@Resource
	private EmployeeService employeeService;
	
	@RequestMapping("/add")
	public String addMeeting(Model model) {
		List<Room> rooms = roomService.getEffectiveList();
		model.addAttribute("rooms", rooms);
		List<Dept> depts = deptService.list();
		model.addAttribute("depts", depts);
		return "forward:/base/goURL/meeting/add.action";
	}
	
	@RequestMapping("/list")
	public String listMeeting(Model model, HttpSession session) {
		int id = (Integer) session.getAttribute("id");
		Meeting meeting = new Meeting();
		Employee employee = new Employee();
		employee.setId(id);
		meeting.setCreator(employee);
		List<Meeting> meetings = meetingService.selectByParam(meeting);
		model.addAttribute("meetings", meetings);
		return "forward:/base/goURL/meeting/list.action";
	}
	
	@RequestMapping("/detail")
	public String getDetail(int id, Model model) {
		Meeting meeting = meetingService.getDetail(id);
		List<Employee> employees = employeeService.selectByMeetingId(id);
		model.addAttribute("meeting", meeting);
		model.addAttribute("employees", employees);
		return "forward:/base/goURL/meeting/detail.action";
	}
	
	@RequestMapping("/notice")
	public String getNotice(HttpSession session, Model model) {
		int id = (Integer)session.getAttribute("id");

		List<Meeting> cancelMeetings = meetingService.getCancelMeetings(id);

		
		List<Meeting> recentMeetings = meetingService.getRecentMeetings(id);
		
		model.addAttribute("recentMeetings", recentMeetings);
		model.addAttribute("cancelMeetings", cancelMeetings);
		
		return "forward:/base/goURL/meeting/notice.action";
	}
	
	// ---------------------------------------------------
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertMeeting(Meeting meeting, Model model) {
		System.out.println(meeting);
		meeting.setCreateTime(new Date());
		boolean flag = meetingService.insert(meeting);
		boolean flag2 = meetingService.insertMtEm(meeting);
		roomService.setDisabled(meeting.getRoom().getId());
		model.addAttribute("message", "预定会议");
		String flagString = flag &&flag2 ? "success" : "failure";
		return "forward:/WEB-INF/jsp/"+flagString+".jsp";
	}
	
	// --------------------------ajax---------------------
	@RequestMapping(value="/abolishMeeting", method=RequestMethod.POST)
	public @ResponseBody
	String aoblishMeeting(int id, int roomId) {
		boolean flag = meetingService.abolish(id);
		 roomService.setAbled(roomId);
		return flag? "success" : "failure";
	}
	
}
