package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import dao.FollowDao;
import entity.Follow;
import util.HibernateUtil;

@Repository
public class FollowDaoImpl implements FollowDao{
	@Resource
	private HibernateUtil util;
	@Override
	public List<Follow> getlist(String hql, Object... obj) {
		// TODO Auto-generated method stub
		return util.queryHQL(hql, obj);
	}
	@Override
	public boolean delete(Object obj) {
		
		return util.delete(obj);
	}
	@Override
	public Follow get(String hql, Object... obj) {
		// TODO Auto-generated method stub
		return util.queryUnique(hql, obj);
	}
	@Override
	public boolean add(Object obj) {
		// TODO Auto-generated method stub
		return util.add(obj);
	}



}
