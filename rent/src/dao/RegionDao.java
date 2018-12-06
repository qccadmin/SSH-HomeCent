package dao;

import java.util.List;
import entity.Region;

public interface RegionDao {
	public List<Region> query(String hql,Object ...obj);
	public boolean save(Region r);
	public boolean update(Region r);
	public boolean delete(Region r);
	public Region get(int id);
}
