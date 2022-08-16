package yucheng.taomei.dao;

import java.util.List;

import yucheng.taomei.vo.chat.AddFriend;
import yucheng.taomei.vo.chat.ListFriend;
import yucheng.taomei.vo.chat.NearMessage;
import yucheng.taomei.vo.chat.SaveMessage;

/*畅聊Dao*/
public interface IChatDao {
	
	//添加好友
	public boolean addFriend(AddFriend addFriend);
	
	//查询好友是否存在
	public boolean isEmptyFriend(AddFriend addFriend);
	
	//获得好友列表
	public List<ListFriend> getFriendList(int users_id);
	
	//获得最近消息列表
	public List<NearMessage> getNearFriendList(int users_id);
	
	//获得和某个用户的消息记录
	public String getMessage(int users_chid1,int users_chid2);
	
	//更新消息记录(添加)
	public boolean updateMessage(SaveMessage saveMessage);
	
	//更新消息状态，把未读改为已读
	public boolean updateMessageState(SaveMessage saveMessage);
	
	
}
