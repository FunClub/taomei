package yucheng.taomei.vo.user;


/**
 * 各个User的联合
 * */
public class UnionUser {
	private int infoPerfect;
	private BaseInfoUser baseInfoUser;
	private DetailedInfoUser detailedInfoUser;
	private QualificationInfoUser qualificationInfoUser;
	private OtherInfoUser otherInfoUser;
	public BaseInfoUser getBaseInfoUser() {
		return baseInfoUser;
	}
	public void setBaseInfoUser(BaseInfoUser baseInfoUser) {
		this.baseInfoUser = baseInfoUser;
	}
	public DetailedInfoUser getDetailedInfoUser() {
		return detailedInfoUser;
	}
	public void setDetailedInfoUser(DetailedInfoUser detailedInfoUser) {
		this.detailedInfoUser = detailedInfoUser;
	}
	public QualificationInfoUser getQualificationInfoUser() {
		return qualificationInfoUser;
	}
	public void setQualificationInfoUser(QualificationInfoUser qualificationInfoUser) {
		this.qualificationInfoUser = qualificationInfoUser;
	}
	public OtherInfoUser getOtherInfoUser() {
		return otherInfoUser;
	}
	public void setOtherInfoUser(OtherInfoUser otherInfoUser) {
		this.otherInfoUser = otherInfoUser;
	}
	public int getInfoPerfect() {
		return infoPerfect;
	}
	public void setInfoPerfect(int infoPerfect) {
		this.infoPerfect = infoPerfect;
	}
	
}
