package entity;

public class User {
    private int userid;      // id
    private String username; // 真实姓名
    private String password; // 密码
    private Power powerid;   // 权限表id
    private String phone;    // 电话
    private String sex;      // 性别
    private int age;         // 年龄
    private String uaddress; // 地址
    private String headimage;   //头像
    private String email;    // 邮箱
    private String profession;//职业
    private String follow;  //关注房源
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
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
	public Power getPowerid() {
		return powerid;
	}
	public void setPowerid(Power powerid) {
		this.powerid = powerid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getHeadimage() {
		return headimage;
	}
	public void setHeadimage(String headimage) {
		this.headimage = headimage;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	
	public String getFollow() {
		return follow;
	}
	public void setFollow(String follow) {
		this.follow = follow;
	}
	public User() {
		super();
	}
	public User(int userid, String username, String password, Power powerid,
			String phone, String sex, int age, String uaddress,
			String headimage, String email, String profession, String follow) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.powerid = powerid;
		this.phone = phone;
		this.sex = sex;
		this.age = age;
		this.uaddress = uaddress;
		this.headimage = headimage;
		this.email = email;
		this.profession = profession;
		this.follow = follow;
	}
	
	public User(int userid) {
		super();
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username
				+ ", password=" + password + ", powerid=" + powerid
				+ ", phone=" + phone + ", sex=" + sex + ", age=" + age
				+ ", uaddress=" + uaddress + ", headimage=" + headimage
				+ ", email=" + email + ", profession=" + profession
				+ ", follow=" + follow + "]";
	}
	
	
	
}
