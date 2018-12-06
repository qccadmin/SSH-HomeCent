package dao;

import java.util.List;

import entity.Image;

public interface ImgDao {
	public boolean insertImg(Object obj);
	public List<Integer> selectImg(String hql);
	public boolean updateImg(int hid,List<Integer> alist);
}
