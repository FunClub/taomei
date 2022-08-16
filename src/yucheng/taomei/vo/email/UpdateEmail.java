package yucheng.taomei.vo.email;

import java.io.Serializable;

//更新私信
public class UpdateEmail implements Serializable{

	private static final long serialVersionUID = 1L;
	private int users_id;//对方的id;
	private int email_id;
	private String content;
	private String emailTime;
	private int contentSize;
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	public int getEmail_id() {
		return email_id;
	}
	public void setEmail_id(int email_id) {
		this.email_id = email_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmailTime() {
		return emailTime;
	}
	public void setEmailTime(String emailTime) {
		this.emailTime = emailTime;
	}
	public int getContentSize() {
		return contentSize;
	}
	public void setContentSize(int contentSize) {
		this.contentSize = contentSize;
	}
	
}
