package entity;

public class Region {
   private int regionid;     //ÇøÓòid
   private String regionname;//ÇøÓòÃû³Æ
	public int getRegionid() {
		return regionid;
	}
	public void setRegionid(int regionid) {
		this.regionid = regionid;
	}
	public String getRegionname() {
		return regionname;
	}
	public void setRegionname(String regionname) {
		this.regionname = regionname;
	}
	public Region() {
		super();
	}
	public Region(int regionid, String regionname) {
		super();
		this.regionid = regionid;
		this.regionname = regionname;
	}
	@Override
	public String toString() {
		return "Region [regionid=" + regionid + ", regionname=" + regionname
				+ "]";
	}
	
}
