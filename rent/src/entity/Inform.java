package entity;

public class Inform {
    private int iid; 
    private User userid;    //用户id
    private Medium mediumid;//经济人id
    private String status;  //消息状态
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	public User getUserid() {
		return userid;
	}
	public void setUserid(User userid) {
		this.userid = userid;
	}
	public Medium getMediumid() {
		return mediumid;
	}
	public void setMediumid(Medium mediumid) {
		this.mediumid = mediumid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Inform() {
		super();
	}
	public Inform(int iid, User userid, Medium mediumid, String status) {
		super();
		this.iid = iid;
		this.userid = userid;
		this.mediumid = mediumid;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Inform [iid=" + iid + ", userid=" + userid.getUserid() + ", mediumid="
				+ mediumid + ", status=" + status + "]";
	}
	
}
