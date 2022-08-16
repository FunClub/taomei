package yucheng.taomei.dao.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.IEmailDao;
import yucheng.taomei.vo.email.UpdateEmail;
import yucheng.taomei.vo.email.InsertEmail;
import yucheng.taomei.vo.email.ListEmail;
import yucheng.taomei.vo.email.ShowOneEmail;
import yucheng.taomei.vo.email.StateEmail;
@Component("emailDaoImpl")
public class EmailDaoImpl implements IEmailDao{
	private SqlSessionTemplate sessionTemplate;
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	//插入一条新的私信
	@Override
	public boolean insertEmail(InsertEmail insertEmail) {	
		return sessionTemplate.insert("yucheng.taomei.vo.email.insertEmail", insertEmail)>0;
	}
	
	//查询我的私信列表
	@Override
	public List<ListEmail> getListEmail(int users_id, int page) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("users_id", users_id);map.put("page", page);
		return sessionTemplate.selectList("yucheng.taomei.vo.email.getListEmail", map);
	}
	
	//查询我的私信数量
	@Override
	public int getEmailSize(int users_id) {	
		return sessionTemplate.selectOne("yucheng.taomei.vo.email.getEmailSize",users_id);
	}
	
	//查询我私信的状态
	@Override
	public List<StateEmail> getEmailState(int users_id) {
		return sessionTemplate.selectList("yucheng.taomei.vo.email.getEmailState",users_id);
	}

	//查看一条私信
	@Override
	public ShowOneEmail getOneEmail(int email_id,int users_id) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("users_id", users_id);map.put("email_id", email_id);
		return sessionTemplate.selectOne("yucheng.taomei.vo.email.getOneEmail", map);
	}
	
	//修改一条私信的内容
	@Override
	public boolean updateContEmails(UpdateEmail updateEmail) {
		boolean flag=sessionTemplate.update("yucheng.taomei.vo.email.updateContEmails1", updateEmail)>0;
		if(flag==false){
			flag = sessionTemplate.update("yucheng.taomei.vo.email.updateContEmails2", updateEmail)>0;
		}
		return flag;
	}
	
	//修改我的一条私信的状态为已读users_id是对方的
	@Override
	public boolean updateEmailState(int email_id, int users_id) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("users_id", users_id);map.put("email_id", email_id);
		boolean flag= sessionTemplate.update("yucheng.taomei.vo.email.updateEmailState1", map)>0;
		if(flag==false){
			flag= sessionTemplate.update("yucheng.taomei.vo.email.updateEmailState2", map)>0;
		}
		return flag;
	}
	
	//删除指定私信
	@Override
	public boolean deleteEmail(List<String> email_ids) {
		boolean flag = false;
		for (Iterator<String> iterator = email_ids.iterator(); iterator.hasNext();) {
			String string = iterator.next();
			flag = sessionTemplate.update("yucheng.taomei.vo.email.deleteEmail", string)>0;
		}
		return flag;
	}

}
