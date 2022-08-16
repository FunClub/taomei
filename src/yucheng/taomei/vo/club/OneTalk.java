package yucheng.taomei.vo.club;

import java.util.List;

public class OneTalk {
	private int talk_id;
	private int users_id;
	private String talkTitle;
	private String talkContent;
	private String talkTag;
	private String talkImg;
	private String talkDiscuss;
	private String talkTime;
	private int talkSeeCount;
	private int talkDiscussCount;
	private String headPicture;
	private String nickName;
	private String height;
	private String age;
	private String town;
	private String city;
	private List<String> imgs;
	private List<String> tags;
	private List<DiscussTalk> discuss;
	private String discussTalkJSON;
	private List<AboutTalk> abouts;
	public int getTalk_id() {
		return talk_id;
	}
	public void setTalk_id(int talk_id) {
		this.talk_id = talk_id;
	}
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
	public String getTalkTag() {
		return talkTag;
	}
	public void setTalkTag(String talkTag) {
		this.talkTag = talkTag;
	}
	public String getTalkImg() {
		return talkImg;
	}
	public void setTalkImg(String talkImg) {
		this.talkImg = talkImg;
	}
	public String getTalkDiscuss() {
		return talkDiscuss;
	}
	public void setTalkDiscuss(String talkDiscuss) {
		this.talkDiscuss = talkDiscuss;
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
	public int getTalkDiscussCount() {
		return talkDiscussCount;
	}
	public void setTalkDiscussCount(int talkDiscussCount) {
		this.talkDiscussCount = talkDiscussCount;
	}
	public String getHeadPicture() {
		return headPicture;
	}
	public void setHeadPicture(String headPicture) {
		this.headPicture = headPicture;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public List<String> getImgs() {
		return imgs;
	}
	public void setImgs(List<String> imgs) {
		this.imgs = imgs;
	}
	public List<DiscussTalk> getDiscuss() {
		return discuss;
	}
	public void setDiscuss(List<DiscussTalk> discuss) {
		this.discuss = discuss;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	public String getDiscussTalkJSON() {
		return discussTalkJSON;
	}
	public void setDiscussTalkJSON(String discussTalkJSON) {
		this.discussTalkJSON = discussTalkJSON;
	}
	public List<AboutTalk> getAbouts() {
		return abouts;
	}
	public void setAbouts(List<AboutTalk> abouts) {
		this.abouts = abouts;
	}
	
}
