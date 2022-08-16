package yucheng.taomei.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.IChatDao;
import yucheng.taomei.vo.chat.AddFriend;
import yucheng.taomei.vo.chat.ListFriend;
import yucheng.taomei.vo.chat.NearMessage;
import yucheng.taomei.vo.chat.SaveMessage;

@Component("chatDaoImpl")
public class ChatDaoImpl implements IChatDao{
	private SqlSessionTemplate sessionTemplate;
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	//添加好友
	@Override
	public boolean addFriend(AddFriend addFriend) {
		return sessionTemplate.insert("yucheng.taomei.vo.chat.addFriend", addFriend)>0;
	}
	
	//查询好友是否存在
	@Override
	public boolean isEmptyFriend(AddFriend addFriend) {
		
		return sessionTemplate.selectOne("yucheng.taomei.vo.chat.isEmptyFriend", addFriend)==null;
	}
	
	//获得好友列表
	@Override
	public List<ListFriend> getFriendList(int users_id) {
		return sessionTemplate.selectList("yucheng.taomei.vo.chat.getFriendList", users_id);
	}
	
	//获得和某个用户的消息记录
	@Override
	public String getMessage(int users_chid1, int users_chid2) {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("users_chid1", users_chid1);
		map.put("users_chid2", users_chid2);
		return sessionTemplate.selectOne("yucheng.taomei.vo.chat.getMessage", map);
	}
	
	//更新消息记录
	@Override
	public boolean updateMessage(SaveMessage saveMessage) {
		
		boolean flag=false;
		flag = sessionTemplate.update("yucheng.taomei.vo.chat.updateMessage1", saveMessage)>0;
		if(flag==false){
			flag = sessionTemplate.update("yucheng.taomei.vo.chat.updateMessage2", saveMessage)>0;
		}
		return flag;
	}
	
	//获得最近消息列表
	@Override
	public List<NearMessage> getNearFriendList(int users_id) {
		return sessionTemplate.selectList("yucheng.taomei.vo.chat.getNearFriendList", users_id);
	}
	
	//将未读改为已读
	@Override
	public boolean updateMessageState(SaveMessage saveMessage) {
		boolean flag=false;
		flag = sessionTemplate.update("yucheng.taomei.vo.chat.updateMessageState1", saveMessage)>0;
		if(flag==false){
			flag = sessionTemplate.update("yucheng.taomei.vo.chat.updateMessageState2", saveMessage)>0;
		}
		return flag;
	}
	
	

}
