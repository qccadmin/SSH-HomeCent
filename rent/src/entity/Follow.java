package entity;

public class Follow {
	private int fid;
	private User userid; 
	private House houseid;

	

	
	public House getHouseid() {
		return houseid;
	}
	public void setHouseid(House houseid) {
		this.houseid = houseid;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public User getUserid() {
		return userid;
	}
	public void setUserid(User userid) {
		this.userid = userid;
	}

	
	
	public Follow( User userid, House houseid) {
		super();
		
		this.userid = userid;
		this.houseid = houseid;
	}
	public Follow() {
		super();
	}
	@Override
	public String toString() {
		return "Follow [fid=" + fid + ", userid=" + userid + ", houseid="
				+ houseid + "]";
	}
	
	
}
