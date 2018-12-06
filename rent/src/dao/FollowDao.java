package dao;

import java.util.List;

import entity.Follow;

public interface FollowDao {
	public Follow get(String hql,Object ...obj);	
	
	public List<Follow> getlist(String hql,Object ...obj);
	
	public boolean delete(Object obj);
	
	public boolean add(Object obj);
}
