package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.MediumDao;
import entity.Medium;
@Repository
public class MediumDaoImpl implements MediumDao{
	@Resource
	private HibernateUtil util;
	//²éÑ¯ËùÓÐ
	public List<Medium> queryAll(){
		String hql="from Medium";
		List<Medium> m=util.queryHQL(hql);
		return m;
	}
	@Override
	public boolean insertMedium(Medium m) {
		boolean n=util.add(m);
		return n;
	}

	@Override
	public List<Medium> queryAllMedium(String hql, Object... obj) {
		// TODO Auto-generated method stub
		return util.queryHQL(hql, obj);
	}

	@Override
	public Medium queryByUid(int uid) {
		// TODO Auto-generated method stub
		return util.queryUnique("from Medium where userid.userid=?", uid);
	}
	@Override
	public Medium queryByMid(int mid) {
		// TODO Auto-generated method stub
		return util.queryUnique("from Medium where userid.userid=?", mid);
	}


}
