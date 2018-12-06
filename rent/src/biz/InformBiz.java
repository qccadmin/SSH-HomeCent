package biz;

import java.util.List;

import entity.Inform;

public interface InformBiz {

	public boolean addInform(Inform info);
	public List<Inform> queryInfoByMid(int mid);
	public List<Inform> queryInfoByMIid(int iid);
	public boolean updateInfo(Inform info);
	public boolean deleteInfo(Inform info);
}
