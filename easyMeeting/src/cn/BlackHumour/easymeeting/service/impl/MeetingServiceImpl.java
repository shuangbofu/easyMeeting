package cn.BlackHumour.easymeeting.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.BlackHumour.easymeeting.dao.MeetingDao;
import cn.BlackHumour.easymeeting.entity.Employee;
import cn.BlackHumour.easymeeting.entity.Meeting;
import cn.BlackHumour.easymeeting.service.MeetingService;

/**
 * @author EricFu
 * @date 2017-8-21 下午6:21:10
 */
@Service
public class MeetingServiceImpl extends BaseServiceImpl<Meeting> implements MeetingService {

	@Resource
	private MeetingDao meetingDao;
	
	public List<Meeting> selectByParam(Meeting meeting) {
		return meetingDao.selectByParam(meeting);
	}

	public Meeting getDetail(int id) {
		return meetingDao.getDetail(id);
	}

	public boolean abolish(int id) {
		return meetingDao.abolish(id)> 0; 
	}

	public List<Meeting> getRecentMeetings(int id) {
		return meetingDao.getRecentMeetings(id);
	}

	public List<Meeting> getCancelMeetings(int id) {
		return meetingDao.getCancelMeetings(id);
	}

	public boolean insertMtEm(Meeting meeting) {
		int id = meeting.getCreator().getId();
		List<Employee> employees = meeting.getEmployees();
		Employee e = new Employee();
		e.setId(id);
		employees.add(e);
		for (Employee employee : employees) {
			meetingDao.insertMtEm(meeting.getId(), employee.getId());
		}
		return true;
	}
}
