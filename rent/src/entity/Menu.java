package entity;

public class Menu {
    private int menuid;  
    private String murl;  //菜单路径
    private String mname; //菜单名称
    private String mpid;  //副菜单id
	public int getMenuid() {
		return menuid;
	}
	public void setMenuid(int menuid) {
		this.menuid = menuid;
	}
	public String getMurl() {
		return murl;
	}
	public void setMurl(String murl) {
		this.murl = murl;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpid() {
		return mpid;
	}
	public void setMpid(String mpid) {
		this.mpid = mpid;
	}
	public Menu() {
		super();
	}
	public Menu(int menuid, String murl, String mname, String mpid) {
		super();
		this.menuid = menuid;
		this.murl = murl;
		this.mname = mname;
		this.mpid = mpid;
	}
	@Override
	public String toString() {
		return "Menu [menuid=" + menuid + ", murl=" + murl + ", mname=" + mname
				+ ", mpid=" + mpid + "]";
	}
	
}
