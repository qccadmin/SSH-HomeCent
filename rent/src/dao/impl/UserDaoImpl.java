package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.UserDao;
import entity.User;
@Repository
public class UserDaoImpl implements UserDao{
	@Resource
	private HibernateUtil util;

	@Override
	public User queryByLogin(String name, String upwd) {
		String hql="from User where username=? and password=?";
		User u=util.queryUnique(hql, name,upwd);
		return u;
	}

	@Override
	public boolean register(User user) {
		boolean n=util.add(user);
		return n;
	}

	@Override
	public User queryByPhone(String phone, String upwd) {
		String hql="from User where phone=? and password=?";
		User u=util.queryUnique(hql, phone,upwd);
		return u;
	}

	@Override
	public User queryByphone(String phone) {
		String hql="from User where phone=?";
		User u=util.queryUnique(hql, phone);
		return u;
	}

	@Override
	public int updateByPhone(String upwd,String phone) {
		String hql="update User set password=? where phone=?";
		int n=util.queryUpdate(hql,upwd,phone);
		return n;
	}

	@Override
	public List<User> queryAll() {
		String hql="from User";
		List<User> list=util.queryHQL(hql);
		return list;
	}

	@Override
	public int updateimg(String headimage, int userid) {
		String hql="update User set headimage=? where userid=?";
		int n=util.queryUpdate(hql, headimage,userid);
		return n;
	}

	@Override
	public boolean updateById(User u) {
		boolean n=util.update(u);
		return n;
	}

	@Override
	public User queryById(int uid) {
		String hql="from User where userid=?";
		User u=util.queryUnique(hql, uid);
		return u;
	}

	@Override
	public int updateById(String upwd, int uid) {
		String hql="update User set password=? where userid=?";
		int n=util.queryUpdate(hql,upwd,uid);
		return n;
	}

	@Override
	public User queryByEmail(String email, String upwd) {
		String hql="from User where email=? and password=?";
		User u=util.queryUnique(hql, email,upwd);
		return u;
	}

	@Override
	public User queryByemail(String email) {
		String hql="from User where email=?";
		User u=util.queryUnique(hql, email);
		return u;
	}

	@Override
	public int updateByEmail(String upwd, String email) {
		String hql="update User set password=? where email=?";
		int n=util.queryUpdate(hql,upwd,email);
		return n;
	}

	
	
	
	

}
