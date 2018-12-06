package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.CommonDao;
import biz.CommonBiz;
import entity.Common;

@Service
public class CommonBizImpl implements CommonBiz{
	@Resource
	private CommonDao cdao;
	public List<Common> queryAll(){
		return cdao.queryHQL("from Common where ctype=?", "出租类型");
	}
	public List<Common> queryByOT(){
		return cdao.queryHQL("from Common where ctype=?", "朝向");
	}
	@Override
	public List<Common> queryByZX() {
		// TODO Auto-generated method stub
		return cdao.queryHQL("from Common where ctype=?", "装修");
	}
}
