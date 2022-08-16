package yucheng.taomei.vo.club;

import java.util.List;

public class NewListTalk {
	private int users_id;
	private int talk_id;
	private String headPicture;
	private String talkTitle;
	private String talkContent;
	private String talkImg;
	private List<String> talkImgList;
	private int talkDiscussCount;
	private int talkSeeCount;
	private String talkTime;
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	public int getTalk_id() {
		return talk_id;
	}
	public void setTalk_id(int talk_id) {
		this.talk_id = talk_id;
	}
	public String getHeadPicture() {
		return headPicture;
	}
	public void setHeadPicture(String headPicture) {
		this.headPicture = headPicture;
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
	public String getTalkImg() {
		return talkImg;
	}
	public void setTalkImg(String talkImg) {
		this.talkImg = talkImg;
	}
	public List<String> getTalkImgList() {
		return talkImgList;
	}
	public void setTalkImgList(List<String> talkImgList) {
		this.talkImgList = talkImgList;
	}
	public int getTalkDiscussCount() {
		return talkDiscussCount;
	}
	public void setTalkDiscussCount(int talkDiscussCount) {
		this.talkDiscussCount = talkDiscussCount;
	}
	public int getTalkSeeCount() {
		return talkSeeCount;
	}
	public void setTalkSeeCount(int talkSeeCount) {
		this.talkSeeCount = talkSeeCount;
	}
	public String getTalkTime() {
		return talkTime;
	}
	public void setTalkTime(String talkTime) {
		this.talkTime = talkTime;
	}
}
