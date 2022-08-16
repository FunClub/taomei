package yucheng.taomei.vo.user;

import java.io.Serializable;


/**
 * 用户全部信息的user
 * */
public class AllInfoUser implements Serializable{

	private static final long serialVersionUID = -3343121860618785719L;
	private int users_id;// 用户ID(字段自增长ID)1a
	private String account;// 登录账号2a
	private String passWords;// 密码3a
	private String nickName;//昵称4a
	private String headPicture;//头像5a
	private String ID;//身份证号码6a
	private String QQ;//QQ7a
	private String telphone;//手机号8a
	private String photo;//相册9a
	private String sex;//性别10a
	private String age;//年龄11a
	private int meiyuan;//梅元12a
	private String VIP;//是否是VIP13a
	private String height;//身高14a
	private String weights;//体重15a
	private String blood;//血型16a
	private String profession;//职业17a
	private String educational;//学历18a
	private String marriage;//婚姻19a
	private String city;//现居城市20a
	private String town;//现居县区21a
	private String income;//收入22a
	private String tag;//我的标签23a
	private String introduction;//自我介绍24a
	private String hasHouseAble;//是否有房25a
	private String wantChildAble;//是否想要小孩(想，不想，还没想好，保密)26a
	private String distanceLoveAble;//是否接受异地恋(能，不能，看情况,保密)27a
	private String sexAble;//是否接受婚前性行为(能，不能，看情况,保密)28a
	private String liveWithParentsAble;//是否愿意和父母同住(能，不能，看情况,保密)29a
	private String loverType;//喜欢的另一半类型30a
	private String prettyParts;//最有魅力的身体部位31a
	private String wantLivePlace;//希望对方的居住地32a
	private String wantLowestAge;//希望对方最低年龄33a
	private String wantHighestAge;//希望对方最高年龄34a
	private String wantLowestHeight;//希望对方最低身高35a
	private String wantHighestHeight;//希望对方最高身高36a
	private String wantWeight;//希望对方体重37a
	private String wantEducational;//希望对方学历38a
	private String wantIncome;//希望对方收入39a
	private int infoPerfect;
	private String lastLoginTime;
	
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public int getInfoPerfect() {
		return infoPerfect;
	}
	public void setInfoPerfect(int infoPerfect) {
		this.infoPerfect = infoPerfect;
	}
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassWords() {
		return passWords;
	}
	public void setPassWords(String passWords) {
		this.passWords = passWords;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getHeadPicture() {
		return headPicture;
	}
	public void setHeadPicture(String headPicture) {
		this.headPicture = headPicture;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public int getMeiyuan() {
		return meiyuan;
	}
	public void setMeiyuan(int meiyuan) {
		this.meiyuan = meiyuan;
	}
	public String getVIP() {
		return VIP;
	}
	public void setVIP(String vIP) {
		VIP = vIP;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeights() {
		return weights;
	}
	public void setWeights(String weights) {
		this.weights = weights;
	}
	public String getBlood() {
		return blood;
	}
	public void setBlood(String blood) {
		this.blood = blood;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getEducational() {
		return educational;
	}
	public void setEducational(String educational) {
		this.educational = educational;
	}
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getHasHouseAble() {
		return hasHouseAble;
	}
	public void setHasHouseAble(String hasHouseAble) {
		this.hasHouseAble = hasHouseAble;
	}
	public String getWantChildAble() {
		return wantChildAble;
	}
	public void setWantChildAble(String wantChildAble) {
		this.wantChildAble = wantChildAble;
	}
	public String getDistanceLoveAble() {
		return distanceLoveAble;
	}
	public void setDistanceLoveAble(String distanceLoveAble) {
		this.distanceLoveAble = distanceLoveAble;
	}
	public String getSexAble() {
		return sexAble;
	}
	public void setSexAble(String sexAble) {
		this.sexAble = sexAble;
	}
	public String getLiveWithParentsAble() {
		return liveWithParentsAble;
	}
	public void setLiveWithParentsAble(String liveWithParentsAble) {
		this.liveWithParentsAble = liveWithParentsAble;
	}
	public String getLoverType() {
		return loverType;
	}
	public void setLoverType(String loverType) {
		this.loverType = loverType;
	}
	public String getPrettyParts() {
		return prettyParts;
	}
	public void setPrettyParts(String prettyParts) {
		this.prettyParts = prettyParts;
	}
	public String getWantLivePlace() {
		return wantLivePlace;
	}
	public void setWantLivePlace(String wantLivePlace) {
		this.wantLivePlace = wantLivePlace;
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
	public String getWantWeight() {
		return wantWeight;
	}
	public void setWantWeight(String wantWeight) {
		this.wantWeight = wantWeight;
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

	
	
}
