package yucheng.taomei.vo.email;

/*用于向数据库插入一封信的私信*/
public class InsertEmail {
	private int from_emid;
	private int to_emid;
	private String content;
	private int contentSize;
	private boolean fromState;
	private boolean toState;
	private String emailTime;
	public int getFrom_emid() {
		return from_emid;
	}
	public void setFrom_emid(int from_emid) {
		this.from_emid = from_emid;
	}
	public int getTo_emid() {
		return to_emid;
	}
	public void setTo_emid(int to_emid) {
		this.to_emid = to_emid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getContentSize() {
		return contentSize;
	}
	public void setContentSize(int contentSize) {
		this.contentSize = contentSize;
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
	public String getEmailTime() {
		return emailTime;
	}
	public void setEmailTime(String emailTime) {
		this.emailTime = emailTime;
	}
	
	
}
