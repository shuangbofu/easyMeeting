package cn.BlackHumour.easymeeting.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.BlackHumour.easymeeting.dao.RoomDao;
import cn.BlackHumour.easymeeting.entity.Room;
import cn.BlackHumour.easymeeting.service.RoomService;

/**
 * @author EricFu
 * @date 2017-8-21 下午5:46:15
 */
@Service
public class RoomServiceImpl extends BaseServiceImpl<Room> implements RoomService {

	
	@Resource
	private RoomDao roomDao;
	
	
	public Room getDetail(int id) {
		return roomDao.getDetail(id);
	}


	public boolean setDisabled(int id) {
		Room room = new Room();
		room.setId(id);
		room.setStatus(0);
		return roomDao.update(room) > 0;
	}


	public boolean setAbled(int id) {
		Room room = new Room();
		room.setId(id);
		room.setStatus(1);
		return roomDao.update(room) > 0;
	}


	public List<Room> getEffectiveList() {
		return roomDao.getEffectiveList();
	}

}
