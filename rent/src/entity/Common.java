package entity;

public class Common {
     private int cid;
     private String ctype;
     private String ctext;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getCtext() {
		return ctext;
	}
	public void setCtext(String ctext) {
		this.ctext = ctext;
	}
	public Common() {
		super();
	}
	public Common(int cid, String ctype, String ctext) {
		super();
		this.cid = cid;
		this.ctype = ctype;
		this.ctext = ctext;
	}
	@Override
	public String toString() {
		return "Common [cid=" + cid + ", ctype=" + ctype + ", ctext=" + ctext
				+ "]";
	}
	
	
}
