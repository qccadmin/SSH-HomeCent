package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.HouseDao;
import entity.House;
@Repository
public class HouseDaoImpl implements HouseDao{
	
	@Resource
	private HibernateUtil util;
	public List<Object> query(String hql,Object ...obj){
		return util.queryHQL(hql, obj);
	}
	@Override
	public List<House> queryHQL(String hql, Object obj) {
		return util.queryHQL(hql, obj);
	}
	@Override
	public List<House> queryHQLByRentType(String hql, int renttype) {
		return util.queryHQL(hql,renttype);
	}

	@Override
	public List<House> queryHQLByTiaoJian(String hql, Object ...obj) {
		return util.queryHQL(hql, obj);
	}
	@Override
	public List<House> queryHQLByNew(String hql, int renttype) {
		// TODO Auto-generated method stub
		return util.queryHQLPage(hql, 1, 3, renttype);
	}
	@Override
	public List<House> queryHQLByRentType(String hql, int renttype,
			int pagesize, int pagenub) {
		// TODO Auto-generated method stub
		return util.queryHQLPage(hql, pagenub, pagesize, renttype);
	}
	@Override
	public boolean addHouse(Object o) {
		// TODO Auto-generated method stub
		return util.add(o);
	}
	@Override
	public int updateStatus(int id, String str) {
		// TODO Auto-generated method stub
		return util.queryUpdate("update House set hstatus=? where houseid=? ", str,id);
	}
	@Override
	public List<House> queryAllHouse(String hql, Object... obj) {
		// TODO Auto-generated method stub
		return util.queryHQL(hql, obj);
	}
	@Override
	public boolean delete(House h) {
		// TODO Auto-generated method stub
		return util.delete(h);
	}
}
