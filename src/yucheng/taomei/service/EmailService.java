package yucheng.taomei.service;

import java.util.List;

import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.impl.EmailDaoImpl;
import yucheng.taomei.factory.EmailFactory;
import yucheng.taomei.vo.email.AllListEmail;
import yucheng.taomei.vo.email.InsertEmail;
import yucheng.taomei.vo.email.ListEmail;
import yucheng.taomei.vo.email.ShowOneEmail;
import yucheng.taomei.vo.email.StateEmail;
import yucheng.taomei.vo.email.UpdateEmail;
import yucheng.taomei.vo.user.Photo;

@Component("emailService")
public class EmailService {
	@Autowired
	@Qualifier("emailDaoImpl")
	private EmailDaoImpl impl;

	// 插入一条新的私信
	public boolean insertEmail(InsertEmail insertEmail) {
		return impl.insertEmail(insertEmail);
	}

	// 查询我的私信列表
	public AllListEmail getAllListEmail(int users_id, int page) {
		List<ListEmail> emaillist = impl.getListEmail(users_id, page);
		int emailSize = impl.getEmailSize(users_id);
		EmailFactory.setEmailList(emaillist, users_id);
		int unReadCount=getUnReadCount(users_id);
		
		AllListEmail allListEmail = new AllListEmail();
		allListEmail.setEmailSize(emailSize);
		allListEmail.setListEmail(emaillist);
		allListEmail.setUnRead(unReadCount);
		return allListEmail;
	}
	//获得私信未读数量
	public int getUnReadCount(int users_id){
		List<StateEmail> stateList = impl.getEmailState(users_id);
		int unReadCount = EmailFactory.getUnReadCount(stateList, users_id);
		return unReadCount;
	}
	
	// 获得指定页的私信列表
	public List<ListEmail> getPointListEmail(int users_id, int page) {
		List<ListEmail> emaillist = impl.getListEmail(users_id, page);
		EmailFactory.setEmailList(emaillist, users_id);
		return emaillist;
	}

	// 查看一条私信user-id是对方的id
	@Cacheable(value="userCache",key="#email_id")
	public ShowOneEmail getOneEmail(int email_id, int users_id) {
		ShowOneEmail email = impl.getOneEmail(email_id, users_id);
		String photos = email.getPhoto();
		String photoStr = photos.substring(1, photos.length() - 1);
		Photo photo = (Photo) JSONObject.toBean(
				JSONObject.fromObject(photoStr), Photo.class);
		email.setPhotoCount(photo.getList().size());
		return email;
	}
	
	// 修改一条私信的内容
	@CacheEvict(value="userCache",key="#updateEmail.email_id")
	public boolean updateContEmails(UpdateEmail updateEmail) {
		return impl.updateContEmails(updateEmail);
	}

	// 修改一条私信的状态
	@CacheEvict(value="userCache",key="#email_id")
	public boolean updateEmailState(int email_id, int users_id) {
		return impl.updateEmailState(email_id, users_id);
	}

	// 删除指定私信
	public boolean deleteEmail(List<String> email_ids) {
		return impl.deleteEmail(email_ids);
	}

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		impl.setSessionTemplate(sessionTemplate);
	}
}
