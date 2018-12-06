package action;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import biz.ImgBiz;

import com.opensymphony.xwork2.ActionContext;

import entity.Image;
@Controller
public class FailInputAction {
	private String title;
	private File myfile[];
	private String myfileContentType[];
	private String myfileFileName[];
	private String savePath;
	private String success;
	private JSONObject jmsg;
	@Resource
	private ImgBiz imgbiz;
	
	public String myFileUp(){
		String path = ServletActionContext.getServletContext().getRealPath(savePath);
		System.out.println(path);
		File filePath = new File(path);
		if(!filePath.exists()){
			filePath.mkdir();
		}
		try {
			
			for(int i = 0;i < myfile.length;i++){
				File myfileitem = myfile[i];
				if(myfileitem == null && myfileitem.length()<0){
					success="ÄÚÈÝ´íÎó£¬ÉÏ´«Ê§°Ü";
					return "no";
				}
				myfileFileName[i]=new Date().getTime()+"_"+myfileFileName[i];
				
				FileUtils.copyFile(myfileitem, new File(path,myfileFileName[i]));
				success="{code:200}";
				jmsg = JSONObject.fromObject(success);
				myfileFileName[i]="upload/"+myfileFileName[i];
				imgbiz.insertImg(new Image(myfileFileName[i]));
			}
			HttpServletRequest req=ServletActionContext.getRequest();
			HttpSession session=req.getSession();
			session.setAttribute("myfileFileName", myfileFileName);
			
			return "ajax";
		} catch (Exception e) {
			success="ÄÚÈÝ´íÎó£¬ÉÏ´«Ê§°Ü";
			return "no";
		}
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public JSONObject getJmsg() {
		return jmsg;
	}

	public void setJmsg(JSONObject jmsg) {
		this.jmsg = jmsg;
	}

	
	
	
	
}
