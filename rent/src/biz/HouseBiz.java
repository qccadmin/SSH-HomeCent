package biz;

import java.util.List;
import java.util.Map;

import entity.Common;
import entity.House;
import entity.Housetype;

public interface HouseBiz {
	public List<Object> queryPoint(int regionid,int cid,int typeid);
	public List<House> queryHQL(Common common);//根据出租类型查询房子的信息，显示到页面
	public List<House> queryHQLByRentType(int renttype);
	public List<House> queryHQLByTiaoJian(Map<String, String> map, int renttype);
	public List<House> queryHQLByNew(int renttype);
	public List<House> queryHQLByMid(int mid);
	public List<House> queryHQLByRentType(Map<String, String> map, int renttype, int pagesize, int pagenub);
	public boolean addHouse(Object o);
	public int updateStatus(int id, String str);
    public List<House> queryAllHouse();
    public boolean delete(House h);
}
