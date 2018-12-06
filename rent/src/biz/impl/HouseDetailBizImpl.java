package biz.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import biz.HouseDetailBiz;
import dao.HouseDetailDao;
import entity.Follow;
import entity.House;
import entity.Image;
import util.HibernateUtil;

@Repository
public class HouseDetailBizImpl implements HouseDetailBiz{
	@Resource
	private HouseDetailDao dao;

	@Override
	public House getByid(int houseid) {

		return dao.getByid(houseid);
	}

	@Override
	public List<Image> get(int id) {
		// TODO Auto-generated method stub
		return dao.get("from Image where houseid=?", id);
	}

	@Override
	public List<Follow> getBytype( int userid) {
		// TODO Auto-generated method stub
		return dao.getBytype("from Follow f where  f.userid.userid=?",userid);
	}



}
