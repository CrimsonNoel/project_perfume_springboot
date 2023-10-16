package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;


// 유저 로그인 확인 클래스
@Component
public class LoginUser implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) {
			response.sendRedirect(request.getContextPath()+"/home/loginAlert?id=login");
			return false; 
		} else {
			return true; 
		}
	}

}