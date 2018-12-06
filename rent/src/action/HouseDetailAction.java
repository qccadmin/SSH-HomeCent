package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.security.auth.message.callback.SecretKeyCallback.Request;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import entity.Common;
import entity.Follow;
import entity.House;
import entity.Image;
import entity.Region;
import entity.User;
import biz.CommonBiz;
import biz.FollowBiz;
import biz.HouseDetailBiz;
import biz.RegionBiz;

@Controller
public class HouseDetailAction  {
	@Resource
	private HouseDetailBiz biz;
    @Resource
    private RegionBiz rbiz;
    @Resource
 	private CommonBiz cbiz;
    @Resource
    private FollowBiz fbiz;
    

    private int userid;
	private House house;
	private int houseid;
	private String msg;
	private List<Image> ilist;
    private List<Common> clist;
 	private List<Region> rlist;
 	private List<House> hlist;
 	private List<Follow> flist;
 	private Follow follow;
 	private User user;
 	private int renttype;
 	
 	
	public String query(){	
		HttpServletRequest req=ServletActionContext.getRequest();
	HttpSession sess=req.getSession();
		user=(User) sess.getAttribute("user");
		System.out.println(user);
		if (user!=null) {
			follow=fbiz.get(user.getUserid(), houseid);
		}
 		rlist=rbiz.queryAll();
		clist=cbiz.queryAll();
		house=biz.getByid(houseid);
		ilist=biz.get(houseid);
		System.out.println(ilist);
		return "ok";
	}
	public String right(){
		house=biz.getByid(houseid);
		System.out.println(houseid);
		return "right";
	}

	public boolean delete(){
		follow=fbiz.get(userid, houseid);	
		System.out.println("dasdsa");
		return fbiz.delete(follow);
	}
	public boolean add(){
		User user=new User();
		user.setUserid(userid);
		house=biz.getByid(houseid);
		follow=new Follow(user, house);	
		System.out.println("dasdsa");
		return fbiz.add(follow);
	}
	public String queryBytype(){
		flist=biz.getBytype(userid);
		hlist=new ArrayList<House>();
		for(Follow sales:flist){
			if (sales.getHouseid().getRenttype().getCid()==renttype) {
				hlist.add(sales.getHouseid());
			}	
	}
		System.out.println(hlist);
		return "ajax";
	}
	public String guanzhu(){
		rlist=rbiz.queryAll();
		clist=cbiz.queryAll();
		return "guanzhu";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public HouseDetailBiz getBiz() {
		return biz;
	}

	public void setBiz(HouseDetailBiz biz) {
		this.biz = biz;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getHouseid() {
		return houseid;
	}

	public void setHouseid(int houseid) {
		this.houseid = houseid;
	}

	public List<Image> getIlist() {
		return ilist;
	}

	public void setIlist(List<Image> ilist) {
		this.ilist = ilist;
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

	public RegionBiz getRbiz() {
		return rbiz;
	}

	public void setRbiz(RegionBiz rbiz) {
		this.rbiz = rbiz;
	}

	public CommonBiz getCbiz() {
		return cbiz;
	}

	public void setCbiz(CommonBiz cbiz) {
		this.cbiz = cbiz;
	}

	public FollowBiz getFbiz() {
		return fbiz;
	}

	public void setFbiz(FollowBiz fbiz) {
		this.fbiz = fbiz;
	}

	public Follow getFollow() {
		return follow;
	}

	public void setFollow(Follow follow) {
		this.follow = follow;
	}

	
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getRenttype() {
		return renttype;
	}

	public void setRenttype(int renttype) {
		this.renttype = renttype;
	}



	public List<House> getHlist() {
		return hlist;
	}

	public void setHlist(List<House> hlist) {
		this.hlist = hlist;
	}

	public List<Follow> getFlist() {
		return flist;
	}

	public void setFlist(List<Follow> flist) {
		this.flist = flist;
	}


	
	

	
	
	
	

}
