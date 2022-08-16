package yucheng.taomei.vo.user;

import java.util.ArrayList;

public class Photo {
	private ArrayList<String> list;
	
	public Photo() {
	}
	public Photo(int i) {
		list = new ArrayList<String>();
	}
	public ArrayList<String> getList() {
		return list;
	}
	
	public void setList(ArrayList<String> list) {
		this.list = list;
	}

	
}
