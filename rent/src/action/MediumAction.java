package action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import entity.Common;
import entity.House;
import entity.Medium;
import entity.Region;
import entity.User;
import biz.CommonBiz;
import biz.HouseBiz;
import biz.MediumBiz;
import biz.RegionBiz;

@Controller
public class MediumAction {
	private int id;
	private int status;
	private List<House> hlist;
    private List<Common> clist;
 	private List<Region> rlist;
    @Resource
    private RegionBiz rbiz;
    @Resource
 	 private CommonBiz cbiz;
	@Resource
	private HouseBiz hbiz;
	@Resource
	private MediumBiz mbiz;
	public String getHouseByMid(){
 		rlist=rbiz.queryAll();
		clist=cbiz.queryAll();
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		Medium m =mbiz.queryByMid(u.getUserid());
		hlist = hbiz.queryHQLByMid(m.getMediumid());
		System.out.println(hlist);
		return "myhouse";
	}
	public String change(){
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		Medium m =mbiz.queryByMid((u.getUserid()));
		if(status==1){
			hbiz.updateStatus(id, "ио╪э");
		}else
			hbiz.updateStatus(id, "об╪э");
		hlist = hbiz.queryHQLByMid(m.getMediumid());
		System.out.println(hlist);
		return "houseajax";
	}
	public List<House> getHlist() {
		return hlist;
	}
	public void setHlist(List<House> hlist) {
		this.hlist = hlist;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
