package dao;

import java.util.List;

import entity.Housetype;

public interface HouseTypeDao {
	public List<Housetype> query(String hql,Object ...obj);
	public boolean save(Housetype h);
	public boolean update(Housetype h);
	public boolean delete(Housetype h);
	public Housetype get(int id);
}
