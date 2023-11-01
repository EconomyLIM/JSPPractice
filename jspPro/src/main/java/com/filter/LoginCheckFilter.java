package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*@WebFilter("/LoginCheckFilter")*/
public class LoginCheckFilter implements Filter {

	
	
    public LoginCheckFilter() {
    	
    } // LoginCheckFilter

	public void destroy() {
		
	} // destroy

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println(">LoginCheckFilter.doFilter()...");
		// 세션 인증+권한 저장
		// SessionTest의 매개변수 클래스는 HttpServletRequest라서 getSession으로 세션불러오기가 가능하나 ServletRequest 클래스는 안된다
		// 그래서 다운캐스팅 해야한다.
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 
		String auth = null;
		boolean isLogon = false; // 인증 true, false
		
		HttpSession session = req.getSession(false);
		if (session != null && (auth =(String) session.getAttribute("auth")) != null) {
			// 인증처리가 된 상태
			isLogon = true;
		}//if
		
		if (isLogon) {
			chain.doFilter(request, response);
		} else {
			String referer = req.getRequestURI(); // /jspPro/days07/board/write.jsp
			session.setAttribute("referer", referer);
			String location = "/jspPro/days07/member/logon.jsp";
			res.sendRedirect(location);
		} //if/else
		
		
	} // doFilter

	public void init(FilterConfig fConfig) throws ServletException {
		
	}// init

} //class
