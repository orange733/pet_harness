package chat;

public class UserDTO { 
	int chatID;
	
	String nickname; 
	String chatMessage; 
	String chatTime;
	public int getChatID() {
		return chatID;
	}
	public void setChatID(int chatID) {
		this.chatID = chatID;
	}
	public String getChatname() {
		return nickname;
	}
	public void setChatname(String nickname) {
		this.nickname = nickname;
	}
	public String getUserchat() {
		return chatMessage;
	}
	public void setUserchat(String chatMessage) {
		this.chatMessage = chatMessage;
	}
	public String getChattime() {
		return chatTime;
	}
	public void setChattime(String chatTime) {
		this.chatTime = chatTime;
	}

	
}

