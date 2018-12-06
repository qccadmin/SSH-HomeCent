package action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import biz.CommonBiz;
import biz.InformBiz;
import biz.MediumBiz;
import biz.RegionBiz;
import entity.Common;
import entity.Inform;
import entity.Medium;
import entity.Region;
import entity.User;

@Controller
public class RegionAction implements ModelDriven<Region>{
	
	@Resource
	private RegionBiz rbiz;
	@Resource
	private CommonBiz cbiz;
	@Resource
	private InformBiz ibiz;
	@Resource
	private MediumBiz mbiz;

	private List<Common> clist;
 	private List<Region> rlist;
 	private List<Inform> ilist;
 	private List<Medium> mlist;
 	private Region r;
	private Region region=new Region();
	private int deleteRegionResult;
	private Region rt;
	public String queryRegion(){
		rlist=rbiz.queryAll();
		clist=cbiz.queryAll();
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		if(u.getPowerid().getPowerid() == 2){
			Medium m=mbiz.queryByUid(u.getUserid());
			ilist=ibiz.queryInfoByMid(m.getMediumid());
		}
		mlist=mbiz.queryAllMedium();
		
		System.out.println(mlist);
		return "query";
	}
    public String queryAllRegion(){
    	rlist=rbiz.queryAll();
		return "queryall";
    }
    public String queryByRegionId(){
    	System.out.println("是否进入");
    	int id=rt.getRegionid();
    	System.out.println(id);
    	r=rbiz.queryById(id);
    	System.out.println("查询到的id"+r);
		return "querybyid";
    }
    public String updateReigon(){
    	System.out.println(region);
    	boolean updateresult=rbiz.update(region);
		return "success";
    }
    public String deleteRegion(){
    	int regionid=rt.getRegionid();
    	System.out.println("删除对象的id"+regionid);
    	System.out.println(rt);
    	boolean deleteRegion=rbiz.delete(rt);
    	System.out.println("删除结果"+deleteRegion);
        deleteRegionResult=1;
		return "ajax";
    }
    public String addRegion(){
        System.out.println("添加的区域   "+region);
    	boolean addResult=rbiz.save(region);
		return "addsuccess";
    }
	public List<Region> getRlist() {
		return rlist;
	}

	public void setRlist(List<Region> rlist) {
		this.rlist = rlist;
	}

	public List<Common> getClist() {
		return clist;
	}

	public void setClist(List<Common> clist) {
		this.clist = clist;
	}

	public List<Inform> getIlist() {
		return ilist;
	}

	public void setIlist(List<Inform> ilist) {
		this.ilist = ilist;
	}
	
	
	public Region getR() {
		return r;
	}
	public void setR(Region r) {
		this.r = r;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public int getDeleteRegionResult() {
		return deleteRegionResult;
	}
	public void setDeleteRegionResult(int deleteRegionResult) {
		this.deleteRegionResult = deleteRegionResult;
	}
	@Override
	public Region getModel() {
		// TODO Auto-generated method stub
		return region;
	}
	public Region getRt() {
		return rt;
	}
	public void setRt(Region rt) {
		this.rt = rt;
	}
	public List<Medium> getMlist() {
		return mlist;
	}
	public void setMlist(List<Medium> mlist) {
		this.mlist = mlist;
	}
}
