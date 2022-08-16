package yucheng.taomei.vo.chat;

public class AddFriend {
	private int users_chid1;
	private int users_chid2;
	private String chatText;
	private String chatTime;
	private String cacheType;
	public AddFriend() {
		setCacheType("friendList");
	}
	public int getUsers_chid1() {
		return users_chid1;
	}
	public void setUsers_chid1(int users_chid1) {
		this.users_chid1 = users_chid1;
	}
	public int getUsers_chid2() {
		return users_chid2;
	}
	public void setUsers_chid2(int users_chid2) {
		this.users_chid2 = users_chid2;
	}
	public String getChatText() {
		return chatText;
	}
	public void setChatText(String chatText) {
		this.chatText = chatText;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	public String getCacheType() {
		return cacheType;
	}
	public void setCacheType(String cacheType) {
		this.cacheType = cacheType;
	}
	
}
