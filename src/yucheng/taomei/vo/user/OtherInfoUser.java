package yucheng.taomei.vo.user;


/**
 * 存放用户其他信息的User
 * */
public class OtherInfoUser{
	private int users_id;
	private String passWords;
	private String headPicture;
	private String photo;
	private int meiyuan;
	private String vIP;
	public String getPassWords() {
		return passWords;
	}
	public void setPassWords(String passWords) {
		this.passWords = passWords;
	}
	public String getHeadPicture() {
		return headPicture;
	}
	public void setHeadPicture(String headPicture) {
		this.headPicture = headPicture;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getMeiyuan() {
		return meiyuan;
	}
	public void setMeiyuan(int meiyuan) {
		this.meiyuan = meiyuan;
	}
	public String getVIP() {
		return vIP;
	}
	public void setVIP(String vIP) {
		this.vIP = vIP;
	}
	
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
}
