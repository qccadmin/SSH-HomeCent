package action;

import java.util.List;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import biz.HouseBiz;
import biz.HouseTypeBiz;
import biz.InformBiz;
import biz.MediumBiz;
import biz.UserBiz;
import entity.House;
import entity.Housetype;
import entity.Inform;
import entity.Medium;
import entity.User;

public class PointAction {
	private int regionid;
	private int cid;
	private Housetype ht;
	private String flag;
	@Resource
	private HouseTypeBiz htbiz;
	@Resource
	private HouseBiz hbiz;
	@Resource
	private InformBiz ibiz;
	@Resource
	private MediumBiz mbiz;
	@Resource
	private UserBiz ubiz;
	public String infoMedium(){
		int tid=0;
		List<Housetype> list = htbiz.queryByCondition(ht.getRoom(), ht.getHall(), ht.getToilet());
		for(Housetype htype :list){
			tid=htype.getTid();
		}
		
		List<Object> hlist=hbiz.queryPoint(regionid, cid, tid);
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session=req.getSession();
		User u=(User) session.getAttribute("user");
		if(hlist.size()>0){
			for(Object i:hlist){
				Inform info= new Inform();
				Medium m =mbiz.queryByMid((Integer) i);
				String em = ubiz.queryById(m.getUserid().getUserid()).getEmail();
				boolean f = verifyEmail(em);
				System.out.println(f);
				info.setMediumid(new Medium((Integer) i));
				info.setUserid(u);
				info.setStatus("未读");
				ibiz.addInform(info);
				
			}
			flag="ok";
			return "ok";
		}
		return "ok";
	}
	// 创建一封包含文本的邮件,导入mail.jar到lib中
		public MimeMessage createSimpleMail(Session session, String email)  throws Exception {
				// 创建邮件对象
				MimeMessage message = new MimeMessage(session);
				// 发件人邮箱
				message.setFrom(new InternetAddress("1637633817@qq.com"));
				// 收件人邮箱
				message.setRecipient(Message.RecipientType.TO, new InternetAddress(
						email));
				// 邮件标题
				message.setSubject("邻居大妈指定购房");
				// 邮件文本内容
				message.setContent("有用户向您发送了购房请求！", "text/html;charset=UTF-8");
				return message;

			}

			
			
			// 直接返回字符串界面，不用请求获取jsp页面。去掉报404错误，找不到页面。
			public boolean verifyEmail(String email) { 
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

				try {
					message = createSimpleMail(session, email);
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
				return true;

			}
	public int getRegionid() {
		return regionid;
	}

	public void setRegionid(int regionid) {
		this.regionid = regionid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Housetype getHt() {
		return ht;
	}

	public void setHt(Housetype ht) {
		this.ht = ht;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	
	

}
