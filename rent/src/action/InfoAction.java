package action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import entity.Inform;
import entity.Medium;
import entity.User;
import biz.InformBiz;
import biz.MediumBiz;

public class InfoAction {
	
	@Resource
	private InformBiz ibiz;
	@Resource
	private MediumBiz mbiz;
	private int iid;
	private Inform info;
	private String msg;
	private List<Inform> ilist;
	public String updateInfo(){
		List<Inform> list = ibiz.queryInfoByMIid(iid);
		info=list.get(0);
		info.setStatus("已读");
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		if(ibiz.updateInfo(info)){
			Medium m=mbiz.queryByUid(u.getUserid());
			ilist=ibiz.queryInfoByMid(m.getMediumid());
			msg="已标记为已读";
		}
		return "upinfo_success";
	}
	public String deleteInfo(){
		List<Inform> list = ibiz.queryInfoByMIid(iid);
		info=list.get(0);
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		if(ibiz.deleteInfo(info)){
			Medium m=mbiz.queryByUid(u.getUserid());
			ilist=ibiz.queryInfoByMid(m.getMediumid());
			msg="删除成功";
		}
		System.out.println(ilist);
		return "delete_success";
	}

	public Inform getInfo() {
		return info;
	}

	public void setInfo(Inform info) {
		this.info = info;
	}

	public int getIid() {
		return iid;
	}

	public void setIid(int iid) {
		this.iid = iid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<Inform> getIlist() {
		return ilist;
	}
	public void setIlist(List<Inform> ilist) {
		this.ilist = ilist;
	}
	
}
