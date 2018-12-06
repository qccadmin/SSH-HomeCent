package biz;

import java.util.List;

import entity.Medium;

public interface MediumBiz {
	//查询所有
	public List<Medium> queryAll();
	//插入
	public boolean insertMedium(Medium m);
	public List<Medium> queryAllMedium();
	
	public Medium queryByUid(int uid);
	public Medium queryByMid(int mid);
}
