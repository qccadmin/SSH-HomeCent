package biz;

import java.util.List;
import entity.Housetype;

public interface HouseTypeBiz {
	public List<Housetype> queryByCondition(int room,int hall,int toilet);
	public List<Housetype> queryAll();
	public boolean save(Housetype h);    //添加户型   若数据库中存在相同户型  则提示添加失败 返回某个页面
	public boolean update(Housetype h);
	public boolean delete(Housetype h);
	public Housetype queryById(int id); //通过id查询户型
}
