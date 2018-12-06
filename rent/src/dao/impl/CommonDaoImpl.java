package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.CommonDao;
import entity.Common;

@Repository
public class CommonDaoImpl implements CommonDao{
	@Resource
	private HibernateUtil util;
	public List<Common> queryHQL(String hql,Object obj){
		return util.queryHQL(hql, obj);
		}

}
