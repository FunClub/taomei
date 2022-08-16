package yucheng.taomei.vo.email;

/*我的私信列表*/
public class PreListEmail {
	private int email_id;
	private int from_emid;
	private String headPicture;
	private String nickName;
	private String age;
	private String city;
	private String emailTime;
	private int contentSize;
	private boolean fromState;
	private boolean toState;
	public boolean isFromState() {
		return fromState;
	}
	public void setFromState(boolean fromState) {
		this.fromState = fromState;
	}
	public boolean isToState() {
		return toState;
	}
	public void setToState(boolean toState) {
		this.toState = toState;
	}
	public int getEmail_id() {
		return email_id;
	}
	public void setEmail_id(int email_id) {
		this.email_id = email_id;
	}
	public int getFrom_emid() {
		return from_emid;
	}
	public void setFrom_emid(int from_emid) {
		this.from_emid = from_emid;
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
