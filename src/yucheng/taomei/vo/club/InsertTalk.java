package yucheng.taomei.vo.club;

public class InsertTalk {
	private int users_id;
	private String talkTitle;
	private String talkContent;
	private String talkTag;
	private String talkImg;
	private String talkDiscuss;
	private String talkTime;	
	private int talkSeeCount;
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	public String getTalkTitle() {
		return talkTitle;
	}
	public void setTalkTitle(String talkTitle) {
		this.talkTitle = talkTitle;
	}
	public String getTalkContent() {
		return talkContent;
	}
	public void setTalkContent(String talkContent) {
		this.talkContent = talkContent;
	}
	public String getTalkDiscuss() {
		return talkDiscuss;
	}
	public void setTalkDiscuss(String talkDiscuss) {
		this.talkDiscuss = talkDiscuss;
	}
	public String getTalkImg() {
		return talkImg;
	}
	public void setTalkImg(String talkImg) {
		this.talkImg = talkImg;
	}
	public String getTalkTag() {
		return talkTag;
	}
	public void setTalkTag(String talkTag) {
		this.talkTag = talkTag;
	}
	public String getTalkTime() {
		return talkTime;
	}
	public void setTalkTime(String talkTime) {
		this.talkTime = talkTime;
	}
	
	public int getTalkSeeCount() {
		return talkSeeCount;
	}
	public void setTalkSeeCount(int talkSeeCount) {
		this.talkSeeCount = talkSeeCount;
	}
	
}
