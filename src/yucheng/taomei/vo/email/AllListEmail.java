package yucheng.taomei.vo.email;

import java.util.List;

public class AllListEmail {
	private int emailSize;
	private List<ListEmail> listEmail;
	private int unReadCount;
	public int getEmailSize() {
		return emailSize;
	}
	public void setEmailSize(int emailSize) {
		this.emailSize = emailSize;
	}
	public List<ListEmail> getListEmail() {
		return listEmail;
	}
	public void setListEmail(List<ListEmail> listEmail) {
		this.listEmail = listEmail;
	}
	public int getUnRead() {
		return unReadCount;
	}
	public void setUnRead(int unReadCount) {
		this.unReadCount = unReadCount;
	}
	
	
	
}
