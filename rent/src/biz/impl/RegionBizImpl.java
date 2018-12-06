package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.RegionBiz;
import dao.RegionDao;
import entity.Housetype;
import entity.Region;

@Service
public class RegionBizImpl  implements RegionBiz{
	@Resource
	private RegionDao rdao;

	@Override
	public List<Region> queryAll() {
		// TODO Auto-generated method stub
		return rdao.query("from Region");
	}

	@Override
	public boolean save(Region r) {
		// TODO Auto-generated method stub
		return rdao.save(r);
	}

	@Override
	public boolean update(Region r) {
		// TODO Auto-generated method stub
		return rdao.update(r);
	}

	@Override
	public boolean delete(Region r) {
		// TODO Auto-generated method stub
		return rdao.delete(r);
	}

	@Override
	public Region queryById(int id) {
		// TODO Auto-generated method stub
		return rdao.get(id);
	}
}
