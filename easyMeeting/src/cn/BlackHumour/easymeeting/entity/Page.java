package cn.BlackHumour.easymeeting.entity;

import java.util.List;

/**
 * 
 * 
 * 
 */
public class Page<T> {

	//当前页，默认显示第一行
	private Integer currentPage = 1;

	//开始下标
	private Integer startIndex;
	
	//每页显示的行数（查询返回的行数），默认每页显示6行
	private Integer pageSize = 6;
	
	//总记录数
	private Integer totalRecordsCount;
	
	//总页数  = (总记录数/每页显示的行数) +1
	private Integer pageCount;
	
	//分页查询到的数据
	private List<T> pageData;
	
	//关键字实体对象
	private T keyEntity;
	
	public T getKeyEntity() {
		return keyEntity;
	}
	public void setKeyEntity(T keyEntity) {
		this.keyEntity = keyEntity;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalRecordsCount() {
		return totalRecordsCount;
	}
	public void setTotalRecordsCount(Integer totalRecordsCount) {
		this.totalRecordsCount = totalRecordsCount;
	}
	public Integer getPageCount() {
		pageCount = totalRecordsCount / pageSize;
		if(totalRecordsCount % pageSize !=0) {
			pageCount +=1;
		}
		return pageCount;
	}
	public Integer getStartIndex() {
		return (currentPage-1)*pageSize;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public List<T> getPageData() {
		return pageData;
	}
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}
}
