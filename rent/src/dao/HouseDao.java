package dao;

import java.util.List;

import entity.House;
import entity.Housetype;

public interface HouseDao {
	public List<Object> query(String hql,Object ...obj);
	public List<House> queryHQL(String hql,Object obj);
	public List<House> queryHQLByRentType(String hql, int renttype);
	public List<House> queryHQLByTiaoJian(String hql, Object ...obj);
	public List<House> queryHQLByNew(String hql, int renttype);
	public List<House> queryHQLByRentType(String hql, int renttype, int pagesize, int pagenub);
	public int updateStatus(int id,String str);
	public boolean addHouse(Object o);
	public List<House> queryAllHouse(String hql,Object...obj);
	public boolean delete(House h);
}
