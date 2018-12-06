package biz;

import java.util.List;




import entity.Follow;
import entity.House;
import entity.Image;

public interface HouseDetailBiz {
	public House getByid(int houseid);
	
	public List<Image> get(int id);
	
	public List<Follow> getBytype(int userid);
}
