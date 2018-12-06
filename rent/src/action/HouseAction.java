package action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;


















import com.opensymphony.xwork2.ModelDriven;

import biz.CommonBiz;
import biz.HouseBiz;
import biz.HouseTypeBiz;
import biz.ImgBiz;
import biz.MediumBiz;
import biz.RegionBiz;
import entity.Common;
import entity.House;
import entity.Housetype;
import entity.Image;
import entity.Medium;
import entity.Region;
import entity.User;

@Controller
public class HouseAction {
     @Resource
     private HouseBiz hbiz;
     @Resource
     private RegionBiz rbiz;
     @Resource
  	 private CommonBiz cbiz;
     @Resource
     private HouseTypeBiz htbiz;
     @Resource
     private ImgBiz imgbiz;
     @Resource
     private MediumBiz mbiz;
     private File myfile[];
 	 private String myfileContentType[];
 	 private String myfileFileName[];
     private List<House> xinhouselist;  //新房
     private List<House> erhouselist;   //二手房
     private List<House> zuhouselist;   //租房
     private List<Common> clist;
  	 private List<Region> rlist;
  	 private List<Region> rglist;
  	 private List<Common> rentlist;
  	 private List<Common> orlist;
  	 private List<Common> zxlist;
  	 private List<House>  houselist;
  	 private String housename;
  	 private int area;
  	 private int floor;
  	 private int rentmoney;
  	 private String haddress;
  	 private Housetype typeid;
  	 private String discreption;
  	 private Region regionid;
  	 private Common renttype;
  	 private Common orientation;
  	 private Common renovate;
  	 private int houseid;
  /*	public House getHs() {
		return hs;
	}
	public void setHs(House hs) {
		this.hs = hs;
	}*/
	
  	public Common getRenttype() {
		return renttype;
	}
	public void setRenttype(Common renttype) {
		this.renttype = renttype;
	}
	private Common com;
 	public String queryByRentType(){
 		rlist=rbiz.queryAll();
		clist=cbiz.queryAll();
		Common common1=new Common();
		common1.setCtext("租房");
		zuhouselist=hbiz.queryHQL(common1);
		Common common2=new Common();
		common2.setCtext("新房");
		xinhouselist=hbiz.queryHQL(common2);
		System.out.println(xinhouselist);
		Common common3=new Common();
		common3.setCtext("二手房");
		erhouselist=hbiz.queryHQL(common3);
		System.out.println(erhouselist);
		return "ok";
	}
 	public String prepub(){
 		rglist=rbiz.queryAll();
 		rentlist=cbiz.queryAll();
 		orlist=cbiz.queryByOT();
 		zxlist=cbiz.queryByZX();
 		return "view";
 	}
 	
 	public String pub(){
 		House hs = new House();
 		hs.setHousename(housename);
 		hs.setArea(area);
 		hs.setFloor(floor);
 		hs.setHaddress(haddress);
 		hs.setDiscreption(discreption);
 		hs.setRegionid(regionid);
 		hs.setRenttype(renttype);
 		hs.setOrientation(orientation);
 		hs.setRenovate(renovate);
 		hs.setRentmoney(rentmoney);
 		hs.setHstatus("上架");
 		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
 		hs.setReleaseTime(df.format(date));
 		List<Housetype> htype=htbiz.queryByCondition(typeid.getRoom(), typeid.getHall(), typeid.getToilet());
 		if(htype.size()==0){
 			htbiz.save(typeid);
 			hs.setTypeid(typeid);
 		}else{
 			hs.setTypeid(htype.get(0));
 		}
 		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		if(u.getPowerid().getPowerid()==2){
		Medium m=mbiz.queryByUid(u.getUserid());
		hs.setMediumid(m);
		}
		
		String[] myfileFileName= (String []) session.getAttribute("myfileFileName");
		session.removeAttribute("myfileFileName");
 		hs.setImgurl(myfileFileName[0]);
 		boolean flag=hbiz.addHouse(hs);
 		System.out.println("!!!!");
 		houseid=hs.getHouseid();
		List<Integer> mlist = imgbiz.selectImg();
 		imgbiz.updateImg(hs.getHouseid(), mlist);
 		return "viewdetail";
 	}
 	public String queryHouse() {
		System.out.println("查询全部的房子信息11111");
		houselist = hbiz.queryAllHouse();
		System.out.println(houselist);
		System.out.println("查询全部的房子信息222222");
		return "myhouse";
	}
	public List<House> getXinhouselist() {
		return xinhouselist;
	}

	public void setXinhouselist(List<House> xinhouselist) {
		this.xinhouselist = xinhouselist;
	}

	public List<House> getErhouselist() {
		return erhouselist;
	}

	public void setErhouselist(List<House> erhouselist) {
		this.erhouselist = erhouselist;
	}

	public List<House> getZuhouselist() {
		return zuhouselist;
	}

	public void setZuhouselist(List<House> zuhouselist) {
		this.zuhouselist = zuhouselist;
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
	public List<Common> getRentlist() {
		return rentlist;
	}
	public void setRentlist(List<Common> rentlist) {
		this.rentlist = rentlist;
	}
	public List<Common> getOrlist() {
		return orlist;
	}
	public void setOrlist(List<Common> orlist) {
		this.orlist = orlist;
	}
	public List<Common> getZxlist() {
		return zxlist;
	}
	public void setZxlist(List<Common> zxlist) {
		this.zxlist = zxlist;
	}
	public Common getCom() {
		return com;
	}
	public void setCom(Common com) {
		this.com = com;
	}
	public List<Region> getRglist() {
		return rglist;
	}
	public void setRglist(List<Region> rglist) {
		this.rglist = rglist;
	}
	public Region getRegionid() {
		return regionid;
	}
	public void setRegionid(Region regionid) {
		this.regionid = regionid;
	}
	public Common getOrientation() {
		return orientation;
	}
	public void setOrientation(Common orientation) {
		this.orientation = orientation;
	}
	public Common getRenovate() {
		return renovate;
	}
	public void setRenovate(Common renovate) {
		this.renovate = renovate;
	}
	public String getHousename() {
		return housename;
	}
	public void setHousename(String housename) {
		this.housename = housename;
	}
	
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public String getHaddress() {
		return haddress;
	}
	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}
	public String getDiscreption() {
		return discreption;
	}
	public void setDiscreption(String discreption) {
		this.discreption = discreption;
	}
	public int getRentmoney() {
		return rentmoney;
	}
	public void setRentmoney(int rentmoney) {
		this.rentmoney = rentmoney;
	}
	public Housetype getTypeid() {
		return typeid;
	}
	public void setTypeid(Housetype typeid) {
		this.typeid = typeid;
	}
	public File[] getMyfile() {
		return myfile;
	}
	public void setMyfile(File[] myfile) {
		this.myfile = myfile;
	}
	public String[] getMyfileContentType() {
		return myfileContentType;
	}
	public void setMyfileContentType(String[] myfileContentType) {
		this.myfileContentType = myfileContentType;
	}
	public String[] getMyfileFileName() {
		return myfileFileName;
	}
	public void setMyfileFileName(String[] myfileFileName) {
		this.myfileFileName = myfileFileName;
	}
	public int getHouseid() {
		return houseid;
	}
	public void setHouseid(int houseid) {
		this.houseid = houseid;
	}
	public List<House> getHouselist() {
		return houselist;
	}
	public void setHouselist(List<House> houselist) {
		this.houselist = houselist;
	}
}
