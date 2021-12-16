package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ChatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html);charset=UTF-8");
		String message=URLDecoder.decode(request.getParameter("message"),"UTF-8");
		String nickname=URLDecoder.decode(request.getParameter("nickname"),"UTF-8");
		if(message==null) {
			response.getWriter().write("0");
		}
		else {
			response.getWriter().write(new UserDAO().join(nickname,message)+"");
		}
	}

}
