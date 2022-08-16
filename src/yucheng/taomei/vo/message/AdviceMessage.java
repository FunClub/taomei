package yucheng.taomei.vo.message;

/*用来传递通知消息的VO，比如查看你的资料，关注了你等等
 * type:
 * 	1.查看你的资料（最近访客）
	2.关注了你
	3.给你发了私信
	4.回复了私信
	5.加你为好友
	6.给你送了礼物
 * */

public class AdviceMessage {
	private String from_id;
	private String to_id;
	private String headPicture;
	private String nickName;
	private String sex;
	private String type;
	private String email_id;
	private String time;
	
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	
	
}
