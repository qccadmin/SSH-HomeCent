package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.HouseTypeDao;
import entity.Housetype;

@Repository
public class HouseTypeDaoImpl implements HouseTypeDao{
	@Resource
	private HibernateUtil util;
	
	public List<Housetype> query(String hql,Object ...obj){
		
		return util.queryHQL(hql, obj);
	}

	@Override
	public boolean save(Housetype h) {
		// TODO Auto-generated method stub
		return util.add(h);
	}

	@Override
	public boolean update(Housetype h) {
		// TODO Auto-generated method stub
		return util.update(h);
	}

	@Override
	public boolean delete(Housetype h) {
		// TODO Auto-generated method stub
		return util.delete(h);
	}

	@Override
	public Housetype get(int id) {
		// TODO Auto-generated method stub
		return util.get(Housetype.class, id);
	}
}
