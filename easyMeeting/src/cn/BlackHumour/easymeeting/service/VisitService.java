package cn.BlackHumour.easymeeting.service;


/**
 * @author EricFu
 * @date 2017-8-22 下午6:03:23
 */
public interface VisitService {

	boolean exists(String ipString);

	int addCount(String ipString);
	
	boolean insert(String ipString);

	int getCount();
}
