package cn.BlackHumour.easymeeting.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.BlackHumour.easymeeting.dao.VisitDao;
import cn.BlackHumour.easymeeting.service.VisitService;

/**
 * @author EricFu
 * @date 2017-8-22 下午6:03:58
 */
@Service
public class VisitServiceImpl implements VisitService{

	
	@Resource
	private VisitDao visitDao;
	
	public boolean exists(String ipString) {
		return visitDao.exists(ipString) != null;
	}

	public int addCount(String ipString) {
		return visitDao.addCount(ipString);
	}
	
	public boolean insert(String ipString) {
		return visitDao.insert(ipString) > 0;
	}

	public int getCount() {
		return visitDao.getCount();
	}
}
