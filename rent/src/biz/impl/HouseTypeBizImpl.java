package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.HouseTypeBiz;
import dao.HouseTypeDao;
import entity.Housetype;

@Service
public class HouseTypeBizImpl implements HouseTypeBiz {
	@Resource
	private HouseTypeDao tdao;

	@Override
	public List<Housetype> queryByCondition(int room, int hall, int toilet) {
		// TODO Auto-generated method stub
		return tdao.query("from Housetype where room=? and hall=? and toilet=?",room,hall,toilet);
		
	}


	@Override
	public List<Housetype> queryAll() {
		return tdao.query("from Housetype");
	}


	@Override
	public boolean save(Housetype h) {
		// TODO Auto-generated method stub
		return tdao.save(h);
	}

	@Override
	public boolean update(Housetype h) {
		// TODO Auto-generated method stub
		return tdao.update(h);
	}

	@Override
	public boolean delete(Housetype h) {
		// TODO Auto-generated method stub
		return tdao.delete(h);
	}


	@Override
	public Housetype queryById(int id) {
		// TODO Auto-generated method stub
		return tdao.get(id);
	}


}
