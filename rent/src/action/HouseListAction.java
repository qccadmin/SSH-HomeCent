package action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;






import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;

import entity.Common;
import entity.House;
import entity.Housetype;
import entity.Region;
import biz.CommonBiz;
import biz.HouseBiz;
import biz.HouseTypeBiz;
import biz.RegionBiz;

@Controller
public class HouseListAction {
	
	@Resource
	private HouseBiz hbiz;
	@Resource
	private RegionBiz rbiz;
	@Resource
	private HouseTypeBiz htbiz;
	@Resource
	private CommonBiz cbiz;
	 private List<Common> clist;
  	 private List<Region> rlist;
	private int renttype;
	private String map; //查询条件json字符串
	private List<House> lihouse; //返回的house列表
	private List<House> linewhouse;//新房列表
	private List<Region> liregion;//区域列表
	private List<Housetype> liht;//房屋类型列表
	private String address;//房屋具体地址
	private int pagesize;
	private int pagenub;
	private int next;
	
	
	public String showmap(){
		return "map";
	}
	
	public String houselist(){
		rlist=rbiz.queryAll();
		clist=cbiz.queryAll();
		liregion = rbiz.queryAll();
		liht = htbiz.queryAll();
		linewhouse = hbiz.queryHQLByNew(renttype);
		return "ok";
	}
	
	public String houseajax(){
		JSONObject jbmap = JSONObject.fromObject(map);  
		Iterator iterator = jbmap.keys(); 
		Map<String, String> typemap = new HashMap<String, String>();
		while (iterator.hasNext()) { 
			String key = (String) iterator.next(); 
			typemap.put(key, jbmap.getString(key));
		}
		lihouse = hbiz.queryHQLByTiaoJian(jbmap, renttype);
		return "ajax";
	}
	
	public String houseajaxbypage(){
		JSONObject jbmap = JSONObject.fromObject(map);  
		Iterator iterator = jbmap.keys(); 
		Map<String, String> typemap = new HashMap<String, String>();
		while (iterator.hasNext()) { 
			String key = (String) iterator.next(); 
			typemap.put(key, jbmap.getString(key));
		}
		
		lihouse = hbiz.queryHQLByRentType(jbmap, renttype, pagesize, pagenub);
		next = lihouse.size()<pagesize?0:1;
		return "ajax";
	}
	
	
	public int getRenttype() {
		return renttype;
	}

	public void setRenttype(int renttype) {
		this.renttype = renttype;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public List<House> getLihouse() {
		return lihouse;
	}

	public void setLihouse(List<House> lihouse) {
		this.lihouse = lihouse;
	}

	public List<Region> getLiregion() {
		return liregion;
	}

	public void setLiregion(List<Region> liregion) {
		this.liregion = liregion;
	}

	public List<Housetype> getLiht() {
		return liht;
	}

	public void setLiht(List<Housetype> liht) {
		this.liht = liht;
	}

	public List<House> getLinewhouse() {
		return linewhouse;
	}

	public void setLinewhouse(List<House> linewhouse) {
		this.linewhouse = linewhouse;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getPagenub() {
		return pagenub;
	}

	public void setPagenub(int pagenub) {
		this.pagenub = pagenub;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public List<Common> getClist() {
		return clist;
	}

	public void setClist(List<Common> clist) {
		this.clist = clist;
	}

	public List<Region> getRlist() {
		return rlist;
	}

	public void setRlist(List<Region> rlist) {
		this.rlist = rlist;
	}
	
	
	
}
