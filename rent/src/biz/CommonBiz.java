package biz;

import java.util.List;

import entity.Common;

public interface CommonBiz {
	public List<Common> queryAll();
	public List<Common> queryByOT();
	public List<Common> queryByZX();
}
