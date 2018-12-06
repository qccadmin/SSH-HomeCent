package biz;

import java.util.List;

import entity.Image;

public interface ImgBiz {
	public boolean insertImg(Object obj);
	public List<Integer> selectImg();
	public boolean updateImg(int hid,List<Integer> alist);
}
