package cn.BlackHumour.easymeeting.dao;

import java.util.List;

import cn.BlackHumour.easymeeting.entity.Page;

/**
 * @author EricFu
 * @date 2017-8-21 下午1:38:25
 */
public interface BaseDao<T> {

	public int insert(T entity);
	public int delete(int id);
	public int update(T entity);
	public List<T> list();
	public List<T> selectPageList(Page<T> page);
	public int selectRecordsCount(Page<T> page);
}
