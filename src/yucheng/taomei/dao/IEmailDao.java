package yucheng.taomei.dao;

import java.util.List;

import yucheng.taomei.vo.email.InsertEmail;
import yucheng.taomei.vo.email.ListEmail;
import yucheng.taomei.vo.email.ShowOneEmail;
import yucheng.taomei.vo.email.StateEmail;
import yucheng.taomei.vo.email.UpdateEmail;

/*对私信的基本操作*/
public interface IEmailDao {
	
	//插入一条新的私信
	public boolean insertEmail(InsertEmail insertEmail);
	
	//查询我的私信列表
	public List<ListEmail> getListEmail(int users_id,int page);
	
	//查询我的私信数量
	public int getEmailSize(int users_id);
	
	//查询我私信的状态
	public List<StateEmail> getEmailState(int users_id);
	
	//查看一条私信 users_id是对方的id
	public ShowOneEmail getOneEmail(int email_id,int users_id);
	
	//修改一条私信的内容
	public boolean updateContEmails(UpdateEmail updateEmail);
	
	//修改我的一条私信的状态为已读users_id是对方的
	public boolean updateEmailState(int email_id,int users_id);
	
	//删除指定私信
	public boolean deleteEmail(List<String> email_ids);
}
