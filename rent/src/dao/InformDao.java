package dao;

import java.util.List;

import entity.Inform;



public interface InformDao {

	public boolean addInform(Inform info);
	public List<Inform> queryHQL(String hql,Object ...obj);
	public boolean updateInfo(Inform info);
	public boolean deleteInfo(Inform info);
	
}
