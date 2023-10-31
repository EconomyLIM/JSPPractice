package days06.mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days06.mvc.command.CommandHandler;
import days06.mvc.command.ListHandler;

public class DispatcherServlet extends HttpServlet{

	private static final long serialVersionUID = 2651573099997609735L;
	
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
//		System.out.println("> DispatcherServlet.init()");
		String path = this.getInitParameter("path");
		/* System.out.println(path); // /WEB-INF/command/commandHandler.properties */
		String realPath = this.getServletContext().getRealPath(path); // 배포 후 실제 물리적 주소
		System.out.println("realPath:  "+realPath);
		Properties prop = new Properties();
		
		try(FileReader reader = new FileReader(realPath)) {
			
			prop.load(reader); // 키 = /board/list.do, 값 = days06.mvc.command.ListHandler
			
		} catch (Exception e) {
			
			throw new ServletException();
			
		} // try catch
		
		// prop(String, String) -> commandHandlerMap(String)에 담는다
		Set<Entry<Object, Object>> set = prop.entrySet();
		Iterator<Entry<Object, Object>> it = set.iterator();
		while (it.hasNext()) {
			Entry<Object, Object> entry =it.next();
			String url = (String) entry.getKey();
			String className = (String) entry.getValue();
			System.out.println(url);
			System.out.println(className);
			
			Class<?> commandhandlerClass = null;
			try {
				commandhandlerClass = Class.forName(className);
				CommandHandler commandHandler = (CommandHandler) commandhandlerClass.newInstance();// newInstance() 객체를 생성하는 멧서드
				this.commandHandlerMap.put(url, commandHandler);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}
			
			
		} //while
	} // init
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* System.out.println(request.getRequestURL()); */ ///jspPro/days06/list.do 
		String requestURI =  request.getRequestURI();
		System.out.println("requestURI:  "+requestURI);
		String contextPath = request.getContextPath();
		System.out.println("contextPath:  "+contextPath);
		requestURI = requestURI.replace(contextPath, "");
		
		CommandHandler handler = this.commandHandlerMap.get(requestURI);
		
		String viewPage = null;
		try {
			viewPage = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		} //if
	} //doGet

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	} // doPost

	@Override
	public void destroy() {
//		System.out.println("> DispatcherServlet.destroy()");
	} // destroy



	
} //class