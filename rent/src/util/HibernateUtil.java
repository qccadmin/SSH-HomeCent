package util;

import java.nio.channels.SeekableByteChannel;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.stereotype.Component;

@Component
public class HibernateUtil {
	@Resource(name="sessionFactory")
	private  SessionFactory factory;
	

	//获取到上面静态块中的factory
	public  SessionFactory getFactory(){
		return factory;
	}
	//开启会话
	public  Session getSession(){
		return factory.openSession();
	}
	//添加
	public  boolean add(Object obj){
		boolean flag=false;
		Session session=getSession();
		try {
			// 开启事务
			Transaction tran=session.beginTransaction();
			//保存数据
			session.save(obj);
			//提交事务
			tran.commit();
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//关闭会话
			session.close();
		}
		return flag;
	}
	//修改
	public  boolean update(Object obj){
		boolean flag=false;
		Session session=getSession();
		try {
			Transaction tran=session.beginTransaction();
			session.update(obj);
			tran.commit();
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return flag;
	}
	//修改部分
	public  boolean updateImg(int hid,List<Integer> alist){
		boolean flag=false;
		Session session=getSession();
		try {
			Transaction tran=session.beginTransaction();
			Query query = session.createQuery("update Image set houseid.houseid ="+hid+" where imageid IN (:alist)"); 
			query.setParameterList("alist", alist);
			query.executeUpdate();
			tran.commit();
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return flag;
	}
	//删除：传递过来的是对象
	public  boolean delete(Object obj){
		boolean flag=false;
		Session session=getSession();
		try {
			Transaction tran=session.beginTransaction();
			session.delete(obj);
			tran.commit();
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return flag;
	}
	//根据ID查询：不需要事物
	public  <T> T get(Class cla,int id){
		T obj=null;
		Session session=getSession();
		try {
			obj=(T) session.get(cla,id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return obj;
	}
	//查询多条记录（全部字段）
	public  <T> List<T> queryHQL(String hql,Object ...obj){
		List<T> list=new ArrayList<T>();
		Session session=getSession();
		try {
			Query query=session.createQuery(hql);
			if(obj!=null){
				for(int i=0;i<obj.length;i++){
					query.setString(i, obj[i].toString());
				}
			}
			list =query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	//查询多条记录并分页
	public  <T> List<T> queryHQLPage(String hql,int page,int size,Object ...obj){
		List<T> list=new ArrayList<T>();
		Session session=getSession();
		try {
			Query query=session.createQuery(hql);
			if(obj!=null){
				for(int i=0;i<obj.length;i++){
					query.setString(i, obj[i].toString());
				}
			}
			query.setFirstResult((page-1)*size);//从第几条开始：偏移量
			query.setMaxResults(size);//每次显示几条记录
			list =query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	/*
	 * 查询单条记录
	 * 全部字段:from HUser where huname=?
	 * 某几个字段:select new HUser(huname,husex)from HUser where huname=?
	 */
	public  <T> T queryUnique(String hql,Object ...obj){
		T object=null;
		Session session=getSession();
		try {
			Query query=session.createQuery(hql);
			if(obj!=null){
				for(int i=0;i<obj.length;i++){
					query.setString(i, obj[i].toString());
				}
			}
			object=(T) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return object;
	}
	//获取特殊某一条记录
	public  int queryCount(String hql,Object ...obj){
		int count=0;
		Session session=getSession();
		try {
			Query query=session.createQuery(hql);
			if(obj!=null){
				for(int i=0;i<obj.length;i++){
					query.setString(i, obj[i].toString());
				}
			}
			count=Integer.valueOf(query.list().get(0).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return count;
	}
	//封装 删除 修改
		public int queryUpdate(String hql,Object ...obj){
			int flag =0;
			Session session = getSession();
			try{
				Transaction tran = session.beginTransaction();
				Query query = session.createQuery(hql);
				for (int i = 0; i < obj.length; i++) {
					query.setString(i, obj[i].toString());
				}
				flag =query.executeUpdate();
				tran.commit();
			}catch(Exception e){
				e.printStackTrace();			
			}finally{
				session.close();
			}
			return flag;	
		}

}
