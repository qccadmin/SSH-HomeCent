package dao;

import java.util.List;

import entity.User;

public interface UserDao {
	//登录：根据名字和密码
	public User queryByLogin(String name,String upwd);
	//注册
	public boolean register(User user);
	//登录：根据手机号和密码
	public User queryByPhone(String phone,String upwd);
	//根据手机号查询
	public User queryByphone(String phone);
	//根据手机修改密码
	public int updateByPhone(String upwd,String phone);
	//个人资料
	public List<User> queryAll();
	//更新头像
	public int updateimg(String headimage,int userid);
	//根据ID修改
	public boolean updateById(User u);
	//根据ID查询
	public User queryById(int uid);
	//根据id修改密码
	public int updateById(String upwd,int uid);
	//登录：根据邮箱和密码
	public User queryByEmail(String email,String upwd);
	//判断邮箱是否存在
	public User queryByemail(String email);
	//根据邮箱修改密码
	public int updateByEmail(String upwd,String email);
}
