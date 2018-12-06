package biz.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import dao.FollowDao;
import entity.Follow;
import biz.FollowBiz;
import util.HibernateUtil;

@Repository
public class FollowBizImpl implements FollowBiz{
	@Resource
	private FollowDao dao;
	
	@Override
	public Follow get(int userid, int houseid) {
		// TODO Auto-generated method stub
		return dao.get("from Follow where userid.userid=? and houseid.houseid=?", userid,houseid);
	}

	@Override
	public List<Follow> getlist(int userid) {
		// TODO Auto-generated method stub
		return dao.getlist("from Follow where userid.userid=?",userid);
	}

	@Override
	public boolean delete(Follow follow) {
		// TODO Auto-generated method stub
		return dao.delete(follow);
	}

	@Override
	public boolean add(Follow follow) {
		// TODO Auto-generated method stub
		return dao.add(follow);
	}



}
