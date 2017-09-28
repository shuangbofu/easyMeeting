package cn.BlackHumour.easymeeting.service;

import java.util.List;

import cn.BlackHumour.easymeeting.entity.Room;

/**
 * @author EricFu
 * @date 2017-8-21 下午5:45:08
 */
public interface RoomService extends BaseService<Room>{

	Room getDetail(int id);

	boolean setDisabled(int id);
	boolean setAbled(int id);
	List<Room> getEffectiveList();
}
