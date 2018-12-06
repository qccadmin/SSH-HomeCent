package dao;

import java.util.List;






import entity.Follow;
import entity.House;
import entity.Image;
import entity.User;

public interface HouseDetailDao {
	public House getByid(int houseid);
	
	public List<Image> get(String hql,Object ...obj);
	
	public List<Follow> getBytype(String hql,Object ...obj);
	
}
