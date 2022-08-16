package yucheng.taomei.vo.email;

/*表示一封私信的单向信息*/
public class ContentEmail {
	private int users_id;
	private String time;
	private String content;
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
