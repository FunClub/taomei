package yucheng.taomei.service;

import java.util.List;

import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.impl.UserDaoImpl;
import yucheng.taomei.factory.UTILFactory;
import yucheng.taomei.vo.user.AllInfoUser;
import yucheng.taomei.vo.user.AllSearchInfoUser;
import yucheng.taomei.vo.user.NewStarUser;
import yucheng.taomei.vo.user.Photo;
import yucheng.taomei.vo.user.QualSearchUser;
import yucheng.taomei.vo.user.QualificationInfoUser;
import yucheng.taomei.vo.user.RecommendUser;
import yucheng.taomei.vo.user.RegisterUser;
import yucheng.taomei.vo.user.SearchInfoUser;
import yucheng.taomei.vo.user.UnionUser;
import yucheng.taomei.vo.user.WriteEmailUser;

@Component("userService")
public class UserService {
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDaoImpl impl;

	// 用户注册
	public boolean insertNewUser(RegisterUser registerUser) {
		return impl.insertNewUser(registerUser);
	}

	// 判断账号是否被注册
	public boolean isAccountRegisted(String account) {
		return impl.isAccountRegisted(account);
	}

	// 判断账号密码是否正确
	public boolean isTrueUser(String account, String passWords) {
		boolean flag = impl.isTrueUser(account, passWords);
		if (flag) {
			impl.updateLastLoginTime(account, UTILFactory.getSimpleTime());
		}
		return flag;
	}

	// 更新头像
	@CacheEvict(value = "userCache", key = "#users_id")
	public boolean updateHead(int users_id, String headPicture) {
		return impl.updateHead(users_id, headPicture);
	}

	// 更新个人信息
	@CacheEvict(value = "userCache", key = "#users_id")
	public boolean updateInfo(Object info, String infoType, int users_id) {
		return impl.updateInfo(info, infoType);
	}

	// 获得联合User
	public UnionUser getUnionUser(String account) {
		UnionUser unionUser = impl.getUnionUser(account);
		return unionUser;
	}

	// 更新内心独白
	@CacheEvict(value = "userCache", key = "#users_id")
	public boolean updateIntroduction(int users_id, String introduction) {
		return impl.updateIntroduction(users_id, introduction);
	}

	// 更新相册
	@CacheEvict(value = "userCache", key = "#users_id")
	public boolean updatePhoto(int users_id, String photo) {
		return impl.updatePhoto(users_id, photo);
	}

	// 更新用户身份证号
	public boolean updateID(int users_id, String ID) {
		return impl.updateID(users_id, ID);
	}

	// 更新用户手机号
	@CacheEvict(value = "userCache", key = "#users_id")
	public boolean updateTelphone(int users_id, String telphone) {
		return impl.updateTelphone(users_id, telphone);
	}

	// 获得用户的全部信息
	@Cacheable(value = "userCache", key = "#users_id")
	public AllInfoUser getAllInfoUser(int users_id) {
		AllInfoUser allInfoUser = impl.getAllInfoUser(users_id);
		return allInfoUser;
	}

	// 获得符合登陆用户择偶标准的用户信息（桃梅推荐）
	public List<RecommendUser> getRecommendUser(QualificationInfoUser qualUser) {
		List<RecommendUser> users = impl.getRecommendUser(qualUser);
		
		return users;
	}
	
	//获得符合登陆用户今日新星的用户信息（桃梅推荐）
	public List<NewStarUser> getNewStarUser(String sex) {
		List<NewStarUser> list = impl.getNewStarUser(sex);
		for (NewStarUser newStarUser : list) {
			String photoStr = newStarUser.getPhoto();
			photoStr = photoStr.substring(1,photoStr.length() - 1);
			Photo photoObj = (Photo) JSONObject.toBean(JSONObject.fromObject(photoStr), Photo.class);
			newStarUser.setPhotoObj(photoObj);
		}
		return list;
	}
	// 获得用户条件搜索和标签专区的用户信息
	public AllSearchInfoUser getSearchInfoUser(QualSearchUser qualSearchUser) {
		AllSearchInfoUser users = new AllSearchInfoUser();
		List<SearchInfoUser> userList = impl.getSearchInfoUser(qualSearchUser);
		int count = impl.getSearchInfoUserCount(qualSearchUser);
		users.setCount(count);
		users.setUserList(userList);
		return users;
	}

	// 获得写信时的用户信息
	public WriteEmailUser getWriteEmailUser(int users_id) {
		WriteEmailUser emailUser = impl.getWriteEmailUser(users_id);
		String photos = emailUser.getPhoto();
		String photoStr = photos.substring(1, photos.length() - 1);
		Photo photo = (Photo) JSONObject.toBean(
				JSONObject.fromObject(photoStr), Photo.class);
		emailUser.setPhotoCount(photo.getList().size());
		return emailUser;
	}

	// 获取用户的内心独白
	public String getHeart(int users_id) {
		return impl.getHeart(users_id);
	}
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		impl.setSessionTemplate(sessionTemplate);
	}

}
