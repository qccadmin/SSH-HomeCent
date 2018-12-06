package action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import entity.Medium;
import entity.Power;
import entity.Region;
import entity.User;
import biz.MediumBiz;
import biz.PowerBiz;
import biz.RegionBiz;
import biz.UserBiz;

@Controller
public class LoginAction extends ActionSupport{
	
	@Resource
	private UserBiz userBiz;
	@Resource
	private PowerBiz powerBiz;
	@Resource
	private MediumBiz mediumBiz;
	@Resource
	private RegionBiz regionBiz;
	private int userid;
	private String username;
	private String password;
	private User user;
	private String phone;
	private String email; 
	private String msg;
	private List<User> list;
	private File myfile;  
	private String headimage;
	private String myfileContentType;  //文件类型：ContentType固定格式
	private String myfileFileName;    // 文件名称：FileName固定格式
	private String savePath;   //通过Struts_user.xml配置文件注入的地址
	private Power power;
	private List<Medium> mlist;
	private String quyu;
	private List<Region> regionlist;
	private String regionname;
	private String email2;//获取到填写的邮箱验证码
	private String cunt;
	private String msg2;
	//登录
	public String login(){
		String ph = "^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$";//判断邮箱的正则表达式
	//	System.out.println("---"+username);
		if(username.matches(ph)){//是否是用手机号登录
			user = userBiz.queryByEmail(username, password);
		}else{
			user=userBiz.queryByLogin(username,password);
		}
		System.out.println("----"+user);
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		if(user!=null && user.getPowerid().getPowerid()==1){
			session.setAttribute("user",user);
			username=user.getUsername();
			return "houtai";
		}
		else if(user!=null){
			
			msg="欢迎您："+username;
			session.setAttribute("user", user);
			System.out.println("user:"+user);
			return "login";
		}
		else{
			msg="用户名或密码错误，请重新登录！";
			return "no";
		}
	}
	//注册时验证邮箱是否已经注册过
	public String email(){
		user=userBiz.queryByemail(email);
		if(user==null){
			msg2="true";
		} else{
	    	msg2="false";
	    }
		return "ajaxemail";
	}
	//注册
	public String register(){
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		cunt=(String) session.getAttribute("cunt");
			if (email2.equalsIgnoreCase(cunt)) {// 如果填写的验证码和发送的验证码一致
				Power p = new Power();
				p.setPowerid(3);
				User u = new User();
				// u.setUsername(username);
				u.setPassword(password);
				// u.setPhone(phone);
				u.setEmail(email);
				u.setPowerid(p);
				boolean flag;
				flag = userBiz.register(u);
				// System.out.println("---"+flag);
				if (flag) {
					msg = "注册成功！";
					return "ok2";
				} else {
					msg = "注册失败！";
					return "no";
				}
				
			} else {
				msg = "验证码错误！";
				return "no";
			}
	}
	//忘记密码
	public String forget(){
		user=userBiz.queryByphone(phone);
		System.out.println("user:"+user);
		if(user!=null){
		//	System.out.println(user.getPhone());
			if(user.getPhone()==null){
				System.out.println("--"+user.getPhone()==null);
			msg="手机号不存在。";
			return "no2";
			}
			HttpServletRequest req=ServletActionContext.getRequest();
			HttpSession session=req.getSession();
			session.setAttribute("phone", phone);
			return "ok3";
	  }else{
		  msg="用户不存在。";
		  return "no2";
	  }
	}
	//忘记密码时验证邮箱是否已经注册过
		public String email2(){
			user=userBiz.queryByemail(email);
			if(user!=null){
				msg2="true";
			} else{
		    	msg2="false";
		    }
			return "ajaxemail2";
		}
	//忘记密码:邮箱验证
		public String forget2(){
			HttpServletRequest req=ServletActionContext.getRequest();
			HttpSession session=req.getSession();
			cunt=(String) session.getAttribute("cunt");
			user=userBiz.queryByemail(email);
			//System.out.println("user:"+user);
			if(user!=null){
			if (email2.equalsIgnoreCase(cunt)) {// 如果填写的验证码和发送的验证码一致
				session.setAttribute("email", email);
				return "ok3";
				}else {
					msg = "验证码错误！";
					return "no2";
					}
			}else {
			msg = "用户不存在。";
			return "no2";
			}
		}
	//找回密码中的修改密码
	public String updateupwd(){
		//int n=userBiz.updateByPhone(password, phone);
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		email=(String) session.getAttribute("email");
		int n=userBiz.updateByEmail(password, email);
		if(n>0){
			session.removeAttribute("user");
			user=userBiz.queryByemail(email);
			session.setAttribute("user", user);
			msg="修改密码成功";
			return "ok2";
		}else{
			msg="修改密码失败";
			return "no3";
		}
	}
	//上传头像
	public String updateimage(){
		System.out.println("-----");
		System.out.println("文件类型："+myfileContentType);
		System.out.println("文件名称："+myfileFileName);
		ServletContext app=ServletActionContext.getServletContext();
		String path=app.getRealPath(savePath);
		System.out.println("注入地址："+path);
		File filepath=new File(path);  //文件地址
		if(!filepath.exists()){     //如果文件地址没有
			filepath.mkdir();      //创建文件地址
		}
		if(myfile==null || myfile.length()<=0){
			msg="文件传输错误，请重新上传！";
			return "no4";
		}
		//对文件名字根据当前时间毫秒数重新命名
		myfileFileName=new Date().getTime()+"_"+myfileFileName; 
		try {
			//上传文件
			FileUtils.copyFile(myfile, new File(path, myfileFileName));
			msg="文件上传成功";
			HttpServletRequest req=ServletActionContext.getRequest();
			HttpSession session=req.getSession();
			User u=(User) session.getAttribute("user");
			int n=userBiz.updateimg("upload/"+myfileFileName, u.getUserid());
			System.out.println("n======="+n);
			if(n>0){
		    	session.removeAttribute("user");
				user = userBiz.queryById(u.getUserid());
				System.out.println("===="+user);
				session.setAttribute("user", user);
				msg="修改成功";
			}else{
				msg="修改失敗";
			}
			return "ok4";
			
		} catch (Exception e) {
			e.printStackTrace();
			msg="异常了";
			return "no4";
		}

	}
	//修改个人信息
	public String updateById(){
		boolean flag;
		//System.out.println("修改信息！！！！！");
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		user.setUserid(u.getUserid());
		user.setPassword(u.getPassword());
		user.setHeadimage(u.getHeadimage());
		user.setPowerid(u.getPowerid());
		user.setEmail(u.getEmail());
		flag=userBiz.updateById(user);
		System.out.println("flag"+flag);
		if(flag){
			session.removeAttribute("user");
			user = userBiz.queryById(user.getUserid());
			System.out.println("===="+user);
			session.setAttribute("user", user);
			msg="修改成功。";
			return "ziliao";
		}else{
			msg="修改失败。";
			return "no5";
		}
		
	}
	//账号密码设置
	public String updateupwd2(){
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		int n=userBiz.updateById(user.getPassword(), u.getUserid());
		if(n>0){
			session.removeAttribute("user");
			user = userBiz.queryById(u.getUserid());			
			session.setAttribute("user", user);
			msg= "密码修改成功";
			return "ok5";
		}else{
			msg= "密码修改成功";
			return "no6";
		}		
	}
	//读取区域信息
	public String shenqing(){
		regionlist=regionBiz.queryAll();
		if(regionlist!=null){
			HttpServletRequest req=ServletActionContext.getRequest();
			HttpSession session=req.getSession();
			session.setAttribute("regionlist", regionlist);
		}
		return "ok6";
	}
	//申请自由经纪人
	public String shenqing2(){
		boolean flag;
		boolean n;
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		regionlist=(List<Region>) session.getAttribute("regionlist");//获取区域信息
		/*int mid=0;
		String quyu = null;
		for(int i=0;i<mlist.size();i++){
		mid=mlist.get(i).getMediumid();
		quyu=mlist.get(i).getQuyu();
		}
		Medium m=new Medium();
		m.setMediumid(mid);
		m.setQuyu(quyu);
		m.setUserid(user);*/
		Medium m=new Medium();
		m.setQuyu(regionname);
		m.setUserid(user);
		user.setUserid(u.getUserid());
	    user.setPhone(u.getPhone());
		user.setFollow(u.getFollow());
		user.setPassword(u.getPassword());
		user.setHeadimage(u.getHeadimage());
		user.setProfession(u.getProfession());
		user.setEmail(u.getEmail());
		Power power=new Power();
		power.setPowerid(2);
		user.setPowerid(power);//申请经济人-修改权限ID为2
		
		flag=userBiz.updateById(user);
		n=mediumBiz.insertMedium(m);
		if(flag && n){
			session.removeAttribute("user");
			user = userBiz.queryById(u.getUserid());
			//System.out.println("===="+user);
			session.setAttribute("user", user);
			msg="申请成功。";
			return "shenqing";
		}else{
			msg="申请失败。";
			return "shenqing";
		}
	}
	// 创建一封包含文本的邮件,导入mail.jar到lib中
	public MimeMessage createSimpleMail(Session session, String email,
			String stringBuilder)  throws Exception {
			// 创建邮件对象
			MimeMessage message = new MimeMessage(session);
			// 发件人邮箱
			message.setFrom(new InternetAddress("1637633817@qq.com"));
			// 收件人邮箱
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(
					email));
			// 邮件标题
			message.setSubject("邻居大妈账号注册");
			// 邮件文本内容
			message.setContent("欢迎您注册邻居大妈,账号注册验证码为(一分钟有效):" + stringBuilder
					+ ",如非本人,请尽快修改密码,请勿回复此邮箱", "text/html;charset=UTF-8");
			return message;

		}

		
		
		// 直接返回字符串界面，不用请求获取jsp页面。去掉报404错误，找不到页面。
		public String verifyEmail() { 
			System.out.println("email:"+email);
			Properties prop = new Properties();
			// 开启debug调试
			prop.setProperty("mail.debug", "true");
			// 设置邮件服务器主机名
			prop.setProperty("mail.host", "smtp.qq.com");
			// 发送服务器需要的身份验证
			prop.setProperty("mail.smtp.auth", "true");
			// 发送邮件协议
			prop.setProperty("mail.transport.protocol", "smtp");
			prop.put("mail.smtp.ssl.enable", "true");
			Session session = Session.getInstance(prop);
			Transport ts = null;
			MimeMessage message = null;
			try {
				ts = session.getTransport();
			} catch (NoSuchProviderException e1) {
				e1.printStackTrace();
			}

			try {
				ts.connect("smtp.qq.com", "1637633817", "wdfsnduxjaljbeii");
			} catch (MessagingException e) {
				e.printStackTrace();
			}

			String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			StringBuilder stringBuilder = new StringBuilder(6);
			for (int i = 0; i < 6; i++) {
				char ch = str.charAt(new Random().nextInt(str.length()));
				stringBuilder.append(ch);
			}
			try {
				message = createSimpleMail(session, email, stringBuilder.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 发送邮件
			try {
				ts.sendMessage(message, message.getAllRecipients());
				session.setDebug(true);
				ts.close();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			cunt = stringBuilder.toString();
			HttpServletRequest req=ServletActionContext.getRequest();
			HttpSession session1=req.getSession();
			session1.setAttribute("cunt", cunt);
			msg=cunt;
			return "ajax";

		}
		//退出登录
		public String logout(){
			System.out.println("退出");
			ActionContext.getContext().getSession().remove("user");
			return "ok2";
		}
		
		
	public String getMsg2() {
			return msg2;
		}

		public void setMsg2(String msg2) {
			this.msg2 = msg2;
		}

	public String getEmail2() {
			return email2;
		}
		public void setEmail2(String email2) {
			this.email2 = email2;
		}
	public String getCunt() {
			return cunt;
		}
		public void setCunt(String cunt) {
			this.cunt = cunt;
		}
	public List<Region> getRegionlist() {
		return regionlist;
	}
	public void setRegionlist(List<Region> regionlist) {
		this.regionlist = regionlist;
	}
	public String getRegionname() {
		return regionname;
	}
	public void setRegionname(String regionname) {
		this.regionname = regionname;
	}
	public String getQuyu() {
		return quyu;
	}
	public void setQuyu(String quyu) {
		this.quyu = quyu;
	}
	public List<Medium> getMlist() {
		return mlist;
	}
	public void setMlist(List<Medium> mlist) {
		this.mlist = mlist;
	}
	public Power getPower() {
		return power;
	}
	public void setPower(Power power) {
		this.power = power;
	}
	public File getMyfile() {
		return myfile;
	}
	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}
	public String getMyfileContentType() {
		return myfileContentType;
	}
	public void setMyfileContentType(String myfileContentType) {
		this.myfileContentType = myfileContentType;
	}
	public String getMyfileFileName() {
		return myfileFileName;
	}
	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<User> getList() {
		return list;
	}
	public void setList(List<User> list) {
		this.list = list;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getHeadimage() {
		return headimage;
	}
	public void setHeadimage(String headimage) {
		this.headimage = headimage;
	}
	
	
 
}
