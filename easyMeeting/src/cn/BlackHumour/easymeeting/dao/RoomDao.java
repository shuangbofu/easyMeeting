package cn.BlackHumour.easymeeting.dao;

import java.util.List;

import cn.BlackHumour.easymeeting.entity.Room;

/**
 * @author EricFu
 * @date 2017-8-21 下午5:28:33
 */
public interface RoomDao extends BaseDao<Room> {

	Room getDetail(int id);

	List<Room> getEffectiveList();
}
