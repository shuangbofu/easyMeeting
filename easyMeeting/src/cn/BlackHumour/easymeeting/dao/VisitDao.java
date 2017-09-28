package cn.BlackHumour.easymeeting.dao;

import cn.BlackHumour.easymeeting.entity.Visit;

/**
 * @author EricFu
 * @date 2017-8-22 下午5:59:50
 */
public interface VisitDao extends BaseDao<Visit>{

	Visit exists(String ipString);

	int addCount(String ipString);

	int insert(String ipString);

	int getCount();

}
