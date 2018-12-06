package biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.PowerDao;
import biz.PowerBiz;
import entity.Power;
@Service
public class PowerBizImpl implements PowerBiz{
	@Resource
	private PowerDao dao;

	@Override
	public Power queryAll(int pid) {
		// TODO Auto-generated method stub
		return dao.queryAll(pid);
	}
	

}
