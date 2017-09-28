package cn.BlackHumour.easymeeting.dao;

import java.util.List;

import cn.BlackHumour.easymeeting.entity.Meeting;

/**
 * @author EricFu
 * @date 2017-8-21 下午6:20:17
 */
public interface MeetingDao extends BaseDao<Meeting>{
	List<Meeting> selectByCreatorId(int id);

	Meeting getDetail(int id);
	int abolish(int id);

	List<Meeting> selectByParam(Meeting meeting);

	List<Meeting> getRecentMeetings(int id);

	List<Meeting> getCancelMeetings(int id);

	void insertMtEm(int meetingId, int employeeId);
}
