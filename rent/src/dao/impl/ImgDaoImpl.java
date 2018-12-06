package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import dao.ImgDao;
import entity.Image;
import util.HibernateUtil;

@Repository
public class ImgDaoImpl implements ImgDao{
	@Resource
	private HibernateUtil util;
	@Override
	public boolean insertImg(Object obj) {
		// TODO Auto-generated method stub
		return util.add(obj);
	}
	@Override
	public List<Integer> selectImg(String hql) {
		// TODO Auto-generated method stub
		return util.queryHQL(hql);
	}
	@Override
	public boolean updateImg(int hid,List<Integer> alist) {
		// TODO Auto-generated method stub
		return util.updateImg(hid,alist);
	}
}
