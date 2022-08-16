package yucheng.taomei.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONArray;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.impl.ChatDaoImpl;
import yucheng.taomei.factory.UTILFactory;
import yucheng.taomei.vo.chat.AddFriend;
import yucheng.taomei.vo.chat.ListFriend;
import yucheng.taomei.vo.chat.NearMessage;
import yucheng.taomei.vo.chat.SaveMessage;
import yucheng.taomei.vo.chat.UpdateMessageState;
import yucheng.taomei.websocket.ChatSocket;

@Component("chatService")
public class ChatService {
	@Autowired
	@Qualifier("chatDaoImpl")
	private ChatDaoImpl impl;

	// 获得最近消息列表
	@SuppressWarnings("unchecked")
	public List<NearMessage> getNearFriendList(int users_id) {
		List<NearMessage> list = impl.getNearFriendList(users_id);
		String chatText;
		for (Iterator<NearMessage> iterator = list.iterator(); iterator.hasNext();) {
			NearMessage nearMessage = iterator.next();
			chatText = nearMessage.getChatText();
			if(chatText==null){
				iterator.remove();
			}
			int unReadCount=0;
			if (chatText != null) {
				List<SaveMessage> saveList = (List<SaveMessage>) JSONArray.toCollection(JSONArray.fromObject(chatText),SaveMessage.class);
				nearMessage.setChatText(saveList.get(saveList.size() - 1).getChatText());
				for (SaveMessage saveMessage : saveList) {
					if(saveMessage.getTo_id()==users_id){
						if(saveMessage.getState().equals("未读")){
							unReadCount++;
						}
					}
				}
				nearMessage.setUnReadCount(unReadCount);
				nearMessage.setChatTime(UTILFactory.getEmailTime(nearMessage.getChatTime()));
			}
		}
		return list;
	}

	// 更新消息记录的状态
	@CacheEvict(value="userCache",key="#updateMessageState.cacheType+#updateMessageState.users_chid2")
	public boolean updateMessageState(UpdateMessageState updateMessageState) {
		List<SaveMessage> list = getMessage(
				updateMessageState.getUsers_chid1(),
				updateMessageState.getUsers_chid2(),"getMessage");
		int users_id = updateMessageState.getTarget_id();
		int to_id;
		for (SaveMessage saveMessage : list) {
			to_id = saveMessage.getTo_id();
			if (to_id == users_id) {
				saveMessage.setState("已读");
			}
		}
		String chatText = JSONArray.fromObject(list).toString();
		SaveMessage saveMessage = new SaveMessage();
		saveMessage.setFrom_id(updateMessageState.getUsers_chid1());
		saveMessage.setTo_id(updateMessageState.getUsers_chid2());
		saveMessage.setChatText(chatText);
		return impl.updateMessageState(saveMessage);
	}

	// 更新消息记录
	@CacheEvict(value="userCache",key="#saveMessage.cacheType+#saveMessage.to_id")
	public boolean updateMessage(SaveMessage saveMessage) {
		saveMessage.setMessageTime(UTILFactory.getSimpleTime());
		List<SaveMessage> list = getMessage(saveMessage.getFrom_id(),
				saveMessage.getTo_id(),"getMessage");
		if (list.get(0) == null) {
			list = new ArrayList<SaveMessage>();
		}
		list.add(saveMessage);
		String chatText = JSONArray.fromObject(list).toString();
		saveMessage.setChatText(chatText);
		return impl.updateMessage(saveMessage);
	}

	// 获得和某个用户的消息记录
	public List<SaveMessage> getMessage(int users_chid1, int users_chid2,String cacheType) {
		String text = impl.getMessage(users_chid1, users_chid2);
		@SuppressWarnings("unchecked")
		List<SaveMessage> list = (List<SaveMessage>) JSONArray.toCollection(
				JSONArray.fromObject(text), SaveMessage.class);
		return list;
	}
	@Cacheable(value="userCache",key="#cacheType+#users_chid1")
	public String getMessageText(int users_chid1, int users_chid2,String cacheType) {
		return impl.getMessage(users_chid1, users_chid2);
	}
	// 添加好友
	public boolean addFriend(AddFriend addFriend) {
		boolean flag = false;
		if (impl.isEmptyFriend(addFriend)) {
			flag = impl.addFriend(addFriend);
		}
		return flag;
	}

	// 获得好友列表
	public List<ListFriend> getFriendList(int users_id,String cacheType) {
		
		List<ListFriend> list = impl.getFriendList(users_id);
		List<ListFriend> down = new ArrayList<ListFriend>();
		List<ListFriend> online = new ArrayList<ListFriend>();
		String friendId;
		for (ListFriend element : list) {
			friendId = String.valueOf(element.getUsers_id());
			if (ChatSocket.chatSession.containsKey(friendId)) {
				element.setState("在线");
				online.add(element);
			} else {
				element.setState("离线");
				down.add(element);
			}
		}
		online.addAll(down);
		return online;
	}

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		impl.setSessionTemplate(sessionTemplate);
	}
}
