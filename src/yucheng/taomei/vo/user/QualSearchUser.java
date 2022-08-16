package yucheng.taomei.vo.user;

/**条件化搜索用户*/
public class QualSearchUser {
	private String wantSex;
	private String wantLivePlace;
	private String wantEducational;
	private String wantIncome;
	private String wantLowestAge;
	private String wantHighestAge;
	private String wantLowestHeight;
	private String wantHighestHeight;
	private String wantMarriage;
	private String wantTag;
	private int page;
	private int count;
	public String getWantSex() {
		return wantSex;
	}
	public String getWantTag() {
		return wantTag;
	}
	public void setWantTag(String wantTag) {
		this.wantTag = wantTag;
	}
	public void setWantSex(String wantSex) {
		this.wantSex = wantSex;
	}
	public String getWantLivePlace() {
		return wantLivePlace;
	}
	public void setWantLivePlace(String wantLivePlace) {
		this.wantLivePlace = wantLivePlace;
	}
	public String getWantEducational() {
		return wantEducational;
	}
	public void setWantEducational(String wantEducational) {
		this.wantEducational = wantEducational;
	}
	public String getWantIncome() {
		return wantIncome;
	}
	public void setWantIncome(String wantIncome) {
		this.wantIncome = wantIncome;
	}
	public String getWantLowestAge() {
		return wantLowestAge;
	}
	public void setWantLowestAge(String wantLowestAge) {
		this.wantLowestAge = wantLowestAge;
	}
	public String getWantHighestAge() {
		return wantHighestAge;
	}
	public void setWantHighestAge(String wantHighestAge) {
		this.wantHighestAge = wantHighestAge;
	}
	public String getWantLowestHeight() {
		return wantLowestHeight;
	}
	public void setWantLowestHeight(String wantLowestHeight) {
		this.wantLowestHeight = wantLowestHeight;
	}
	public String getWantHighestHeight() {
		return wantHighestHeight;
	}
	public void setWantHighestHeight(String wantHighestHeight) {
		this.wantHighestHeight = wantHighestHeight;
	}
	public String getWantMarriage() {
		return wantMarriage;
	}
	public void setWantMarriage(String wantMarriage) {
		this.wantMarriage = wantMarriage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
