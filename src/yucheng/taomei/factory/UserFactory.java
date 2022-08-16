package yucheng.taomei.factory;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;

import yucheng.taomei.vo.user.AllInfoUser;
import yucheng.taomei.vo.user.BaseInfoUser;
import yucheng.taomei.vo.user.DetailedInfoUser;
import yucheng.taomei.vo.user.OtherInfoUser;
import yucheng.taomei.vo.user.QualificationInfoUser;
import yucheng.taomei.vo.user.SearchInfoUser;
import yucheng.taomei.vo.user.UnionUser;

/**
 * 用于对用户的辅助行操作
 * */
public class UserFactory {
	public static UnionUser getUnionUser(AllInfoUser all){
		UnionUser unionUser = new UnionUser();
		BaseInfoUser base = new BaseInfoUser();
		base.setAccount(all.getAccount());//1
		base.setAge(all.getAge());//2
		base.setBlood(all.getBlood());//3
		base.setCity(all.getCity());//4
		base.setEducational(all.getEducational());//5
		base.setHasHouseAble(all.getHasHouseAble());//5
		base.setHeight(all.getHeight());//7
		base.setID(all.getID());//8
		base.setIncome(all.getIncome());//9
		base.setMarriage(all.getMarriage());//10
		base.setNickName(all.getNickName());//11
		base.setProfession(all.getProfession());//12
		base.setQQ(all.getQQ());//13
		base.setSex(all.getSex());//14
		base.setTelphone(all.getTelphone());//15
		base.setTown(all.getTown());//16
		base.setUsers_id(all.getUsers_id());//17
		base.setWeights(all.getWeights());//18
		base.setLastLoginTime(all.getLastLoginTime());
		
		DetailedInfoUser deta = new DetailedInfoUser();
		deta.setDistanceLoveAble(all.getDistanceLoveAble());//19
		deta.setIntroduction(all.getIntroduction());//20
		deta.setLiveWithParentsAble(all.getLiveWithParentsAble());//21
		deta.setLoverType(all.getLoverType());//22
		deta.setPrettyParts(all.getPrettyParts());//23
		deta.setSexAble(all.getSexAble());//24
		deta.setTag(all.getTag());//25
		deta.setWantChildAble(all.getWantChildAble());//26
		deta.setUsers_id(all.getUsers_id());
		
		QualificationInfoUser qual = new QualificationInfoUser();
		qual.setWantEducational(all.getWantEducational());//27
		qual.setWantHighestAge(all.getWantHighestAge());//28
		qual.setWantHighestHeight(all.getWantHighestHeight());//29
		qual.setWantIncome(all.getWantIncome());//30
		qual.setWantLivePlace(all.getWantLivePlace());//31
		qual.setWantLowestAge(all.getWantLowestAge());//32
		qual.setWantLowestHeight(all.getWantLowestHeight());//33
		qual.setWantWeight(all.getWantWeight());//34
		qual.setUsers_id(all.getUsers_id());
		qual.setSex(base.getSex());
		
		OtherInfoUser othe = new OtherInfoUser();
		othe.setHeadPicture(all.getHeadPicture());//35
		othe.setMeiyuan(all.getMeiyuan());//36
		othe.setPassWords(all.getPassWords());//37
		othe.setPhoto(all.getPhoto());//38
		othe.setVIP(all.getVIP());//39
		othe.setUsers_id(all.getUsers_id());
		
		unionUser.setBaseInfoUser(base);
		unionUser.setDetailedInfoUser(deta);
		unionUser.setOtherInfoUser(othe);
		unionUser.setQualificationInfoUser(qual);
		unionUser.setInfoPerfect(preInfoPerfect(unionUser));
		return unionUser;
	}
	public static int preInfoPerfect(UnionUser union){
		BaseInfoUser base = union.getBaseInfoUser();
		DetailedInfoUser deta = union.getDetailedInfoUser();
		QualificationInfoUser qual = union.getQualificationInfoUser();
		OtherInfoUser othe = union.getOtherInfoUser();
		int count=0;
		count+=getInfoPerfect(base);
		count+=getInfoPerfect(deta);
		count+=getInfoPerfect(qual);
		count+=getInfoPerfect(othe);
		return count+1-1-1;
		//加一是因为,去掉了这几个User的users_id,实际上有一个users_id.
		//减一是因为：出了base中有sex外，qual还有sex
		//减一是因为：base里有lastLoginTime
	}
	/**
	 * 获得用户资料完整度
	 * */
	public static int getInfoPerfect(Object o){
		int count=0;
		Field[] f= o.getClass().getDeclaredFields();
		for (int i = 1; i < f.length; i++) {
			try {
				
				String fieldName = f[i].getName();
				String firstLetter = fieldName.substring(0, 1).toUpperCase();    
			    String getter = "get" + firstLetter + fieldName.substring(1);
				Method method = o.getClass().getMethod(getter, new Class[] {});
				Object value = method.invoke(o, new Object[] {});
				if(value!=null&&value.equals("保密")==false&&value.equals("未填写")==false){
					count++;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}     
		}
		return count;
	}
	
}
