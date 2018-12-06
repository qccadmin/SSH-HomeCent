package dao;

import java.util.List;

import entity.Medium;

public interface MediumDao {
	//查询所有
	public List<Medium> queryAll();
	//插入
	public boolean insertMedium(Medium m);
    public List<Medium> queryAllMedium(String hql,Object ...obj);
	public Medium queryByUid(int uid);
	public Medium queryByMid(int mid);
}
