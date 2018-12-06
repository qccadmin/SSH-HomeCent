package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.InformDao;
import biz.InformBiz;
import entity.Inform;

@Service
public class InformBizImpl implements InformBiz{
	
	@Resource
	private InformDao idao;
	public boolean addInform(Inform info){
		return idao.addInform(info);
	}
	@Override
	public List<Inform> queryInfoByMid(int mid) {
		// TODO Auto-generated method stub
		return idao.queryHQL("from Inform where mediumid.mediumid=?", mid);
	}
	@Override
	public boolean updateInfo(Inform info) {
		// TODO Auto-generated method stub
		return idao.updateInfo(info);
	}
	@Override
	public List<Inform> queryInfoByMIid(int iid) {
		// TODO Auto-generated method stub
		return idao.queryHQL("from Inform where iid=?", iid);
	}
	@Override
	public boolean deleteInfo(Inform info) {
		// TODO Auto-generated method stub
		return idao.deleteInfo(info);
	}
	
}
