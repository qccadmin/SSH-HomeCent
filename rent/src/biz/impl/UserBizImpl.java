package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.UserDao;
import biz.UserBiz;
import entity.User;
@Service
public class UserBizImpl implements UserBiz{
	@Resource
	private UserDao dao;

	@Override
	public User queryByLogin(String name, String upwd) {
		// TODO Auto-generated method stub
		return dao.queryByLogin(name, upwd);
	}

	@Override
	public boolean register(User user) {
		// TODO Auto-generated method stub
		return dao.register(user);
	}

	@Override
	public User queryByPhone(String phone, String upwd) {
		// TODO Auto-generated method stub
		return dao.queryByPhone(phone, upwd);
	}

	@Override
	public User queryByphone(String phone) {
		// TODO Auto-generated method stub
		return dao.queryByphone(phone);
	}

	@Override
	public int updateByPhone(String upwd, String phone) {
		// TODO Auto-generated method stub
		return dao.updateByPhone(upwd, phone);
	}

	@Override
	public List<User> queryAll() {
		// TODO Auto-generated method stub
		return dao.queryAll();
	}

	@Override
	public int updateimg(String headimage, int userid) {
		// TODO Auto-generated method stub
		return dao.updateimg(headimage, userid);
	}

	@Override
	public boolean updateById(User u) {
		// TODO Auto-generated method stub
		return dao.updateById(u);
	}

	@Override
	public User queryById(int uid) {
		// TODO Auto-generated method stub
		return dao.queryById(uid);
	}

	@Override
	public int updateById(String upwd, int uid) {
		// TODO Auto-generated method stub
		return dao.updateById(upwd, uid);
	}

	@Override
	public User queryByEmail(String email, String upwd) {
		// TODO Auto-generated method stub
		return dao.queryByEmail(email, upwd);
	}

	@Override
	public User queryByemail(String email) {
		// TODO Auto-generated method stub
		return dao.queryByemail(email);
	}

	@Override
	public int updateByEmail(String upwd, String email) {
		// TODO Auto-generated method stub
		return dao.updateByEmail(upwd, email);
	}
	

}
