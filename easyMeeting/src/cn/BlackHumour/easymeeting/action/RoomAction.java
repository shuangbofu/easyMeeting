package cn.BlackHumour.easymeeting.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.BlackHumour.easymeeting.entity.Room;
import cn.BlackHumour.easymeeting.service.RoomService;

/**
 * @author EricFu
 * @date 2017-8-21 下午5:47:09
 */
@Controller
@RequestMapping("/room")
public class RoomAction extends BaseAction<Room>{
	
	
	@Resource
	private RoomService roomService;
	
	@RequestMapping("/list")
	public String listRoom(Model model) {
		List<Room> rooms = roomService.list();
		model.addAttribute("rooms", rooms);
		return "forward:/base/goURL/room/list.action";
	}

	@RequestMapping("/add")
	public String addRoom() {
		return "forward:/base/goURL/room/add.action";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String getDetail(@RequestParam int id, Model model) {
		Room room = roomService.getDetail(id);
		model.addAttribute("room", room);
		return "forward:/base/goURL/room/detail.action";
	}
	
	// --------------------------------------------------
	@RequestMapping("/insert")
	public String insert(Room room) {
		roomService.insert(room);
		return "forward:/room/list.action";
	}
}
