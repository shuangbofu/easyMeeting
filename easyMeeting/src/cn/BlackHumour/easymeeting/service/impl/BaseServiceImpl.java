package cn.BlackHumour.easymeeting.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import cn.BlackHumour.easymeeting.dao.BaseDao;
import cn.BlackHumour.easymeeting.dao.DeptDao;
import cn.BlackHumour.easymeeting.dao.EmployeeDao;
import cn.BlackHumour.easymeeting.dao.MeetingDao;
import cn.BlackHumour.easymeeting.dao.RoomDao;
import cn.BlackHumour.easymeeting.entity.Page;
import cn.BlackHumour.easymeeting.service.BaseService;

/**
 * @author EricFu
 * @date 2017-8-21 下午1:37:01
 */
public class BaseServiceImpl<T> implements BaseService<T> {

	@Autowired
	protected BaseDao<T> baseDao;
	
	
	@Autowired
	private DeptDao deptDao;
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private MeetingDao meetingDao;
	
	@PostConstruct//在构造方法后，初化前执行
	private void initBaseMapper() throws Exception{
		//this关键字指对象本身，这里指的是调用此方法的实现类（子类）
		ParameterizedType type =(ParameterizedType) this.getClass().getGenericSuperclass();
		//获取第一个参数的class
		Class clazz = (Class)type.getActualTypeArguments()[0];
		//转化为属性名（相关的Mapper子类的引用名）Supplier  supplierMapper
		String localField = clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1)+"Dao";
		//getDeclaredField:可以使用于包括私有、默认、受保护、公共字段，但不包括继承的字段
		Field field=this.getClass().getSuperclass().getDeclaredField(localField);
		Field baseField = this.getClass().getSuperclass().getDeclaredField("baseDao");
		//field.get(this)获取当前this的field字段的值。例如：Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，子类型对象已被spring实例化于容器中
		baseField.set(this, field.get(this));

	}	
	
	public boolean insert(T entity) {
		return baseDao.insert(entity) > 0;
	}

	public boolean delete(int id) {
		return baseDao.delete(id) > 0;
	}

	public boolean update(T entity) {
		return baseDao.update(entity) > 0;
	}

	public List<T> list() {
		return baseDao.list();
	}

	public List<T> selectPageList(Page<T> page) {
		return baseDao.selectPageList(page);
	}

	public int selectRecordsCount(Page<T> page) {
		return baseDao.selectRecordsCount(page);
	}

}
