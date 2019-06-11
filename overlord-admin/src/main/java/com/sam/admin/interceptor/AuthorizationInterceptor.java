package com.sam.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sam.admin.entity.User;

public class AuthorizationInterceptor implements HandlerInterceptor{
	//不拦截"/loginForm"和"/login"请求
	private static final String[] IGNORE_URI = {"/login"};
	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response,
			Object handler,Exception exception) throws Exception{
		System.out.println("AuthorizationInterceptor afterCompletion -->");
	}
	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response,
			Object handler,ModelAndView mv) throws Exception{
		System.out.println("AuthorizationInterceptor postHandle -->");
	}
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,
			Object handler) throws Exception{
		System.out.println("AuthorizationInterceptor preHandle -->");
		boolean flag = false;
		String servletPath = request.getServletPath();
		String url = request.getRequestURI();
		System.out.println(url);
		for(String s : IGNORE_URI) {
			/*
			 * contains()是判断是否包含的意思，如"abc".contains("a");则值为true
			 */
			if(servletPath.contains(s)) {
				flag = true;
				break;
			}
		}
		if(!flag) {
			User user = (User) request.getSession().getAttribute("user");
			if(user == null) {
				System.out.println("AuthorizationInterceptor拦截请求：");
				request.setAttribute("message",	"请先登录再访问网站");
				//request.getRequestDispatcher("index.jsp").forward(request, response);
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}else {
				System.out.println("AuthorizationInterceptor放行请求：");
				flag = true;
			}
		}
		
		return flag;
	}

}
