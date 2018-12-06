package biz.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.HouseDao;
import biz.HouseBiz;
import entity.Common;
import entity.House;

@Service
public class HouseBizImpl implements HouseBiz {
	@Resource
	private HouseDao hdao;

	
	@Override
	public List<Object> queryPoint(int regionid, int cid, int typeid) {
		// TODO Auto-generated method stub
		return hdao.query(
				"select mediumid.mediumid from House where regionid.regionid=? and renttype.cid=? and typeid.tid=?  group by mediumid.mediumid"
				,regionid,cid,typeid);
	}

	@Override
	public List<House> queryHQLByRentType(int renttype) {
		String hql = "from House h where h.renttype.cid=?";
		return hdao.queryHQLByRentType(hql,renttype);
	}

	@Override
	public List<House> queryHQLByTiaoJian(Map<String, String> map,int renttype) {
		String hql = "from House h where h.renttype.cid=? and h.hstatus='上架'";
		/*List<Object> liobj = new ArrayList<Object>();
		liobj.add(renttype);*/
		for(Map.Entry<String, String> entry : map.entrySet()){
			String strkey = entry.getKey();
			String strvalue = entry.getValue();
			if(strkey.indexOf(".")==-1){
				if(strvalue.indexOf(",")>-1){
					String[] strvalues = strvalue.split(",");
					hql += " and "+"h."+strkey+" >= "+strvalues[0]
							+" and "+"h."+strkey+" <= "+strvalues[1];
				}else{
					hql += " and "+"h."+strkey+" >= "+strvalue;
				}
			}else{
				hql += " and "+"h."+strkey+" = "+strvalue;
			}
        }
		//System.out.println(hql);
		return hdao.queryHQLByTiaoJian(hql, renttype);
	}

	@Override
	public List<House> queryHQL(Common common) {
		// TODO Auto-generated method stub
		return hdao.queryHQL("from House where renttype.ctext=? and hstatus='上架' order by houseid desc",common.getCtext());
	}


	@Override
	public List<House> queryHQLByNew(int renttype) {
		// TODO Auto-generated method stub
		return hdao.queryHQLByNew("from House h where h.renttype.cid=? and h.hstatus='上架' order by h.houseid desc",renttype);
	}

	@Override
	public List<House> queryHQLByRentType(Map<String, String> map,
			int renttype, int pagesize, int pagenub) {
		String hql = "from House h where h.renttype.cid=? and h.hstatus='上架'";
		/*List<Object> liobj = new ArrayList<Object>();
		liobj.add(renttype);*/
		for(Map.Entry<String, String> entry : map.entrySet()){
			String strkey = entry.getKey();
			String strvalue = entry.getValue();
			if(strkey.indexOf(".")==-1){
				if(strvalue.indexOf(",")>-1){
					String[] strvalues = strvalue.split(",");
					hql += " and "+"h."+strkey+" >= "+strvalues[0]
							+" and "+"h."+strkey+" <= "+strvalues[1];
				}else{
					hql += " and "+"h."+strkey+" >= "+strvalue;
				}
			}else{
				hql += " and "+"h."+strkey+" = "+strvalue;
			}
        }
		//System.out.println(hql);
		return hdao.queryHQLByRentType(hql, renttype, pagesize, pagenub);
	}

	@Override
	public boolean addHouse(Object o) {
		// TODO Auto-generated method stub
		return hdao.addHouse(o);
	}

	@Override
	public List<House> queryHQLByMid(int mid) {
		// TODO Auto-generated method stub
		return hdao.queryHQL("from House where mediumid.mediumid=?", mid);
	}

	@Override
	public int updateStatus(int id, String str) {
		// TODO Auto-generated method stub
		return hdao.updateStatus(id, str);
	}

	@Override
	public List<House> queryAllHouse() {
		// TODO Auto-generated method stub
		return hdao.queryAllHouse("from House");
	}

	@Override
	public boolean delete(House h) {
		// TODO Auto-generated method stub
		return hdao.delete(h);
	}

}
