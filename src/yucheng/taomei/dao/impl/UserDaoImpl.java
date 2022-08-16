package yucheng.taomei.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.IUserDao;
import yucheng.taomei.factory.UserFactory;
import yucheng.taomei.vo.user.AllInfoUser;
import yucheng.taomei.vo.user.NewStarUser;
import yucheng.taomei.vo.user.QualSearchUser;
import yucheng.taomei.vo.user.QualificationInfoUser;
import yucheng.taomei.vo.user.RecommendUser;
import yucheng.taomei.vo.user.RegisterUser;
import yucheng.taomei.vo.user.SearchInfoUser;
import yucheng.taomei.vo.user.UnionUser;
import yucheng.taomei.vo.user.WriteEmailUser;

@Component("userDaoImpl")
public class UserDaoImpl implements IUserDao{
	private SqlSessionTemplate sessionTemplate;
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	//注册
	@Override
	public boolean insertNewUser(RegisterUser registerUser) {
		int flag = sessionTemplate.insert("yucheng.taomei.vo.user.insertNewUser", registerUser);
		return flag>0;
	}
	
	//查询账号是否被注册
	@Override
	public boolean isAccountRegisted(String account) {
		account=sessionTemplate.selectOne("yucheng.taomei.vo.user.isAccountRegisted", account);
		return account==null;
	}
	
	//判断账号密码是否正确
	@Override
	public boolean isTrueUser(String account, String passWords) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("account", account);
		map.put("passWords", passWords);
		account = sessionTemplate.selectOne("yucheng.taomei.vo.user.isTrueUser",map);
		return account!=null;
	}
	
	//更新上次登录时间
	@Override
	public boolean updateLastLoginTime(String account, String time) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("account", account);
		map.put("lastLoginTime", time);
		int count=sessionTemplate.update("yucheng.taomei.vo.user.updateLastLoginTime", map);
		return count>0;
	}
	
	//更新头像
	@Override
	public boolean updateHead(int users_id, String headPicture) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("users_id", String.valueOf(users_id));
		map.put("headPicture", headPicture);
		int count=sessionTemplate.update("yucheng.taomei.vo.user.updateHead", map);
		return count>0;
	}
	
	//更新个人资料
	@Override
	public boolean updateInfo(Object info,String infoType) {
		int count=0;
		if(infoType.equals("base")){
			count = sessionTemplate.update("yucheng.taomei.vo.user.updateBaseInfo", info);
		}else if(infoType.equals("deta")){
			count = sessionTemplate.update("yucheng.taomei.vo.user.updateDetaInfo", info);
		}else{
			count = sessionTemplate.update("yucheng.taomei.vo.user.updateQualInfo", info);
		}
		return count>0;
	}
	
	//获得联合User
	@Override
	public UnionUser getUnionUser(String account) {
		AllInfoUser allInfoUser = sessionTemplate.selectOne("yucheng.taomei.vo.user.getAllInfoUser", account);
		UnionUser unionUser = UserFactory.getUnionUser(allInfoUser);
		return unionUser;
	}
	
	//更新内心独白
	@Override
	public boolean updateIntroduction(int users_id, String introduction) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("users_id", String.valueOf(users_id));
		map.put("introduction", introduction);
		int count=sessionTemplate.update("yucheng.taomei.vo.user.updateIntroduction", map);
		return count>0;
	}
	//更新相册
	@Override
	public boolean updatePhoto(int users_id, String photo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("users_id", String.valueOf(users_id));
		map.put("photo", photo);
		int count=sessionTemplate.update("yucheng.taomei.vo.user.updatePhoto", map);
		return count>0;
	}
	
	//更新用户身份证号
	@Override
	public boolean updateID(int users_id, String ID) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("users_id", String.valueOf(users_id));
		map.put("ID", ID);
		int count=sessionTemplate.update("yucheng.taomei.vo.user.updateID", map);
		return count>0;
	}
	
	//更新用户手机号
	@Override
	public boolean updateTelphone(int users_id, String telphone) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("users_id", String.valueOf(users_id));
		map.put("telphone", telphone);
		int count=sessionTemplate.update("yucheng.taomei.vo.user.updateTelphone", map);
		return count>0;
	}
	
	//获得用户的全部信息
	@Override
	public AllInfoUser getAllInfoUser(int users_id) {
		AllInfoUser allInfoUser = sessionTemplate.selectOne("yucheng.taomei.vo.user.getOtherInfoUser", users_id);
		allInfoUser.setInfoPerfect(UserFactory.getInfoPerfect(allInfoUser)-1-1);
		//减一是因为有infoPerfect属性
		//减一是因为有lastLoginTime
		return allInfoUser;
	}
	
	//获得符合登陆用户择偶标准的用户信息（桃梅推荐）
	@Override
	public List<RecommendUser> getRecommendUser(QualificationInfoUser qualUser) {
		List<RecommendUser> users = sessionTemplate.selectList("yucheng.taomei.vo.user.getRecommendUser", qualUser);
		return users;
	}
	
	//获得用户条件搜索和标签专区的用户信息
	@Override
	public List<SearchInfoUser> getSearchInfoUser(QualSearchUser qualSearchUser) {
		List<SearchInfoUser> users = sessionTemplate.selectList("yucheng.taomei.vo.user.getSearchInfoUser", qualSearchUser);
		return users;
	}
	
	//获得写信时的用户信息
	@Override
	public WriteEmailUser getWriteEmailUser(int users_id) {	
		return sessionTemplate.selectOne("yucheng.taomei.vo.user.getWriteEmailUser", users_id);
	}
	
	//获取用户的内心独白
	@Override
	public String getHeart(int users_id) {	
		return sessionTemplate.selectOne("yucheng.taomei.vo.user.getHeart", users_id);
	}
	
	//获得用户条件搜索和标签专区的用户信息的数量
	@Override
	public int getSearchInfoUserCount(QualSearchUser qualSearchUser) {
		int count = sessionTemplate.selectOne("yucheng.taomei.vo.user.getSearchInfoUserCount", qualSearchUser);
		return count;
	}
	
	//获得符合登陆用户今日新星的用户信息（桃梅推荐）
	@Override
	public List<NewStarUser> getNewStarUser(String sex) {
		return sessionTemplate.selectList("yucheng.taomei.vo.user.getNewStarUser", sex);
	}
	
}
