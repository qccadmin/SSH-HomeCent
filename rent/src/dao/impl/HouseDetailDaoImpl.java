package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import dao.HouseDetailDao;
import entity.Follow;
import entity.House;
import entity.Image;
import util.HibernateUtil;

@Repository
public class HouseDetailDaoImpl implements HouseDetailDao{
	@Resource
	private HibernateUtil util;

	@Override
	public House getByid(int houseid) {
		
		House list=util.get(House.class, houseid);
	
		return list;
	}



	@Override
	public List<Image> get(String hql, Object... obj) {
		// TODO Auto-generated method stub
		return util.queryHQL(hql, obj);
	}



	@Override
	public List<Follow> getBytype(String hql, Object... obj) {
		// TODO Auto-generated method stub
		return util.queryHQL(hql, obj);
	}



}
