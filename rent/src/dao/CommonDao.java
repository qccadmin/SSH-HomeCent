package dao;

import java.util.List;

import entity.Common;

public interface CommonDao {
	public List<Common> queryHQL(String hql,Object obj);

}
