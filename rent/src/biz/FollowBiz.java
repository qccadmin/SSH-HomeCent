package biz;

import java.util.List;




import entity.Follow;
import entity.House;
import entity.Image;

public interface FollowBiz {
	
    public Follow get(int userid,int houseid);	
	
	public List<Follow> getlist(int userid);
	
	public boolean delete(Follow follow);
	
	public boolean add(Follow follow);
}
