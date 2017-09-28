package cn.BlackHumour.easymeeting.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 
 * 
 * 
 */
public class HomeFilter extends OncePerRequestFilter {
	
	
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		if (uri.contains("register") || uri.contains("existsCheck")) {
			doFilter(request, response, filterChain);
		} else {
			if(!uri.contains("login")) {
				if(session.getAttribute("id")==null) {
					response.sendRedirect(request.getContextPath()+"/home/login.action");
				} else {
					filterChain.doFilter(request, response);
				}
			} else {
				filterChain.doFilter(request, response);
			}
		}
	}
}
