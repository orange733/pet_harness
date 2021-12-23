package chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ChatListServlet")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String listType=request.getParameter("listType");
		if(listType==null||listType.equals("")) response.getWriter().write("");
		else {
			try {
				Integer.parseInt(listType);
				response.getWriter().write(getID(listType));
			}catch(Exception e) {
				response.getWriter().write("");
			}
		}
	}
	public String getID(String chatID) {
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		UserDAO userDAO=new UserDAO();
		ArrayList<UserDTO> chatlist = userDAO.getChatListByRecent(chatID);
		for(int i=0; i < chatlist.size();i++) {
			result.append("[{\"value\": \""+chatlist.get(i).getChatname()+"\"},");
			result.append("{\"value\": \""+chatlist.get(i).getUserchat()+"\"},");
			result.append("{\"value\": \""+chatlist.get(i).getChattime()+"\"},");
			result.append("{\"value\": \""+chatlist.get(i).getChatID()+"\"}]");
			if(i !=chatlist.size()-1) result.append(",");
		}
		result.append("],\"last\":\""+chatlist.get(chatlist.size()-1).getChatID()+"\"}");
		return result.toString();
	}

}
