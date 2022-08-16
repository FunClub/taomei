package yucheng.taomei.vo.chat;

public class UpdateMessageState {
	private int users_chid1;
	private int users_chid2;
	private int target_id;
	private String cacheType;
	public UpdateMessageState() {
		setCacheType("getMessage");
	}
	public int getUsers_chid1() {
		return users_chid1;
	}
	public void setUsers_chid1(int users_chid1) {
		this.users_chid1 = users_chid1;
	}
	public int getUsers_chid2() {
		return users_chid2;
	}
	public void setUsers_chid2(int users_chid2) {
		this.users_chid2 = users_chid2;
	}
	public int getTarget_id() {
		return target_id;
	}
	public void setTarget_id(int target_id) {
		this.target_id = target_id;
	}
	public String getCacheType() {
		return cacheType;
	}
	public void setCacheType(String cacheType) {
		this.cacheType = cacheType;
	}
	
	
}
