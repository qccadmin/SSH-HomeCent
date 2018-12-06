package dao.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.PowerDao;
import entity.Power;
@Repository
public class PowerDaoImpl implements PowerDao{
	@Resource
	private HibernateUtil util;
	//查询所有权限信息
	@Override
	public Power queryAll(int pid) {
		String hql="from Power where powerid=？";
		Power p=util.get(Power.class, pid);
		return p;
	}

}
