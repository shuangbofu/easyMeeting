package cn.BlackHumour.easymeeting.service;

import java.util.List;

import cn.BlackHumour.easymeeting.entity.Meeting;

/**
 * @author EricFu
 * @date 2017-8-21 下午6:20:44
 */
public interface MeetingService extends BaseService<Meeting>{
	List<Meeting> selectByParam(Meeting meeting);
	Meeting getDetail(int id);
	boolean abolish(int id);
	List<Meeting> getRecentMeetings(int id);
	List<Meeting> getCancelMeetings(int id);
	boolean insertMtEm(Meeting meeting);
}
