package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.MediumBiz;
import dao.MediumDao;
import entity.Medium;
@Service
public class MediumBizImpl implements MediumBiz{
	@Resource
	private MediumDao dao;

	@Override
	public List<Medium> queryAll() {
		// TODO Auto-generated method stub
		return dao.queryAll();
	}

	@Override
	public boolean insertMedium(Medium m) {
		// TODO Auto-generated method stub
		return dao.insertMedium(m);
	}


	@Override
	public List<Medium> queryAllMedium() {
		// TODO Auto-generated method stub
		return dao.queryAllMedium("from Medium");
	}


	@Override
	public Medium queryByUid(int uid) {
		// TODO Auto-generated method stub
		return dao.queryByUid(uid);
	}

	@Override
	public Medium queryByMid(int mid) {
		// TODO Auto-generated method stub
		return dao.queryByMid(mid);
	}
	

}
