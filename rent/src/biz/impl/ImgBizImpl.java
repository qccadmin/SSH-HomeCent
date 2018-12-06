package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.ImgBiz;
import dao.ImgDao;
import entity.Image;

@Service
public class ImgBizImpl implements ImgBiz{
	@Resource
	private ImgDao imgdao;
	public boolean insertImg(Object obj){
		
		return imgdao.insertImg(obj);
	}
	@Override
	public List<Integer> selectImg() {
		// TODO Auto-generated method stub
		return imgdao.selectImg("select imageid from Image where houseid = null");
	}
	@Override
	public boolean updateImg(int hid, List<Integer> alist) {
		// TODO Auto-generated method stub
		return imgdao.updateImg(hid, alist);
	}
}