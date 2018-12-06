package interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import entity.User;

public class LoginInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		System.out.println("执行了拦截器。。。。。。");
		//获取session的值
		User user= (User) ActionContext.getContext().getSession().get("user");
		System.out.println("拦截器："+user);
		String str="";
		if(user==null){
			System.out.println("您还没有登录，请先登录。");
			return "ok2";
		}
		str=invocation.invoke();
		return str;
	}

}
