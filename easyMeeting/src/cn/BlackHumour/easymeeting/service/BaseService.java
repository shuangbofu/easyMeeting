package cn.BlackHumour.easymeeting.service;

import java.util.List;

import cn.BlackHumour.easymeeting.entity.Page;


/**
 * @author EricFu
 * @date 2017-8-21 下午1:35:28
 */
public interface BaseService<T> {
	public boolean insert(T entity);
	public boolean delete(int id);
	public boolean update(T entity);
	public List<T> list(); 
	public List<T> selectPageList(Page<T> page);
	public int selectRecordsCount(Page<T> page);
}


