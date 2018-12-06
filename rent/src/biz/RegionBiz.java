package biz;

import java.util.List;
import entity.Region;

public interface RegionBiz {
	public List<Region> queryAll();
	public boolean save(Region r);  //添加区域信息
	public boolean update(Region r);//修改区域信息
	public boolean delete(Region r);//删除区域信息  ？级联删除  将外键关联的所有房子删除
	public Region queryById(int id);
}
