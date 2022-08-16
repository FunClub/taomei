package yucheng.taomei.vo.email;

public class StateEmail {
	private int from_emid;
	private boolean fromState;
	private boolean toState;
	public int getFrom_emid() {
		return from_emid;
	}
	public void setFrom_emid(int from_emid) {
		this.from_emid = from_emid;
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
	
}
