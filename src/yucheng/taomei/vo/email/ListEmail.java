package yucheng.taomei.vo.email;

/*我的私信列表*/
public class ListEmail {
	private int email_id;
	private int from_emid;
	private int to_emid;
	private String headPicture;
	private String nickName;
	private String age;
	private String city;
	private String emailTime;
	private int contentSize;
	private boolean fromState;
	private boolean toState;
	private boolean state;
	private boolean you;
	private int tID;
	
	public int gettID() {
		return tID;
	}
	public void settID(int tID) {
		this.tID = tID;
	}
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
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public boolean isYou() {
		return you;
	}
	public void setYou(boolean you) {
		this.you = you;
	}
	public int getTo_emid() {
		return to_emid;
	}
	public void setTo_emid(int to_emid) {
		this.to_emid = to_emid;
	}
	
	
}
