package chat;
import java.sql.Connection; 

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class UserDAO {
	Connection conn = DatabaseUtil.getConnection(); 
	
	public int join(String chatname, String text) {
		String SQL = "INSERT INTO CHAT VALUES (NULL,?,?,now())"; 
		try { 
			// 각각의 데이터를 실제로 넣어준다. 
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			// 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			pstmt.setString(1, chatname); 
			pstmt.setString(2, text); // 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수 
			return pstmt.executeUpdate(); 
			} 
		catch (Exception e) {
			e.printStackTrace(); 
			} 
		return -1; 
	}
	public int delete(int chatID) {
		String SQL="DELETE FROM CHAT WHERE chatID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, chatID);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<UserDTO> getChatListByRecent(String chatID){
		ArrayList<UserDTO> chatlist=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String SQL="SELECT * FROM CHAT WHERE chatID > ? ORDER BY chatTime";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,Integer.parseInt(chatID));
			rs=pstmt.executeQuery();
			chatlist=new ArrayList<UserDTO>();
			while(rs.next()) {
				UserDTO chat=new UserDTO();
				chat.setChatID(rs.getInt("chatID"));
				chat.setChatname(rs.getString("nickname"));
				chat.setUserchat(rs.getString("chatMessage").replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"));
				int chatTime=Integer.parseInt(rs.getString("chatTime").substring(11,13));
				String timeType="오전";
				if(Integer.parseInt(rs.getString("chatTime").substring(11,13))>=12) {
					timeType="오후";
					chatTime -= 12;
				}
				chat.setChattime(rs.getString("chatTime").substring(0,11)+" "+timeType+" "+chatTime+":"+rs.getString("chatTime").substring(14,16)+" ");
				chatlist.add(chat);
				
			}
		}catch(Exception e) {
				e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return chatlist;
	}
	
}
	
