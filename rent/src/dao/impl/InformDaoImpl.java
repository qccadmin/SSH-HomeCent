package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.InformDao;
import entity.Inform;

@Repository
public class InformDaoImpl implements InformDao{
	
	@Resource
	private HibernateUtil util;
	public boolean addInform(Inform info){
		return util.add(info);
		}
	@Override
	public List<Inform> queryHQL(String hql, Object... obj) {
		// TODO Auto-generated method stub
		return util.queryHQL(hql, obj);
	}
	@Override
	public boolean updateInfo(Inform info) {
		// TODO Auto-generated method stub
		return util.update(info);
	}
	@Override
	public boolean deleteInfo(Inform info) {
		// TODO Auto-generated method stub
		return util.delete(info);
	}
	
}
