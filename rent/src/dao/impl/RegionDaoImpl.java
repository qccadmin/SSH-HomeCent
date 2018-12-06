package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import dao.RegionDao;
import util.HibernateUtil;
import entity.Region;
@Repository
public class RegionDaoImpl implements RegionDao {
	@Resource
	private HibernateUtil util;
	
	public List<Region> query(String hql,Object ...obj){
		return util.queryHQL(hql, obj);
	}

	@Override
	public boolean save(Region r) {
		// TODO Auto-generated method stub
		return util.add(r);
	}

	@Override
	public boolean update(Region r) {
		// TODO Auto-generated method stub
		return util.update(r);
	}

	@Override
	public boolean delete(Region r) {
		// TODO Auto-generated method stub
		return util.delete(r);
	}

	@Override
	public Region get(int id) {
		// TODO Auto-generated method stub
		return util.get(Region.class, id);
	}
}
