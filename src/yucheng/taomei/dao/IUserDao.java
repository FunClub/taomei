package yucheng.taomei.dao;

import java.util.List;

import yucheng.taomei.vo.user.AllInfoUser;
import yucheng.taomei.vo.user.NewStarUser;
import yucheng.taomei.vo.user.QualSearchUser;
import yucheng.taomei.vo.user.QualificationInfoUser;
import yucheng.taomei.vo.user.RecommendUser;
import yucheng.taomei.vo.user.RegisterUser;
import yucheng.taomei.vo.user.SearchInfoUser;
import yucheng.taomei.vo.user.UnionUser;
import yucheng.taomei.vo.user.WriteEmailUser;

/**
 * 用户的基本操作:
 * 1.注册
 * 2.账号是否存在
 * 3.资料修改
 * */
public interface IUserDao{

	//注册
	public boolean insertNewUser(RegisterUser registerUser);
	
	//查询账号是否被注册
	public boolean isAccountRegisted(String account);
	
	 //登录时判断用户账号密码是否正确
	public boolean isTrueUser(String account,String passWords);
	
	//设置上次登录时间
	public boolean updateLastLoginTime(String account,String time);
	//更新头像
	public boolean updateHead(int users_id,String headPicture);
	
	//通过账号获得联合User;
	public UnionUser getUnionUser(String account);
		
	//更新用户的基本资料
	public boolean updateInfo(Object info,String infoType);
	
	//修改内心独白
	public boolean updateIntroduction(int users_id,String introduction);
	
	//更新用户相册
	public boolean updatePhoto(int users_id,String photo);
	
	//更新用户ID
	public boolean updateID(int users_id,String photo);
	
	//更新用户手机
	public boolean updateTelphone(int users_id,String telphone);
	
	//获得一个用户的全部信息
	public AllInfoUser getAllInfoUser(int users_id);
	
	//获得符合登陆用户择偶标准的用户信息（桃梅推荐）
	public List<RecommendUser> getRecommendUser(QualificationInfoUser qualUser);
	
	//获得符合登陆用户今日新星的用户信息（桃梅推荐）
	public List<NewStarUser> getNewStarUser(String sex);
	//获得用户条件搜索和标签专区的用户信息
	public List<SearchInfoUser> getSearchInfoUser(QualSearchUser qualSearchUser);
	
	//获得用户条件搜索和标签专区的用户信息的数量
	public int getSearchInfoUserCount(QualSearchUser qualSearchUser);
	
	//获得写信时的用户信息
	public WriteEmailUser getWriteEmailUser(int users_id);
	
	//获取用户的内心独白1214
	public String getHeart(int users_id);
}
