package yucheng.taomei.dao;

import java.util.List;

import yucheng.taomei.vo.club.AboutTalk;
import yucheng.taomei.vo.club.DiscussTalk;
import yucheng.taomei.vo.club.InsertTalk;
import yucheng.taomei.vo.club.NewListTalk;
import yucheng.taomei.vo.club.OneTalk;
import yucheng.taomei.vo.club.SearchTalk;

public interface IClubDao {
	//发表话题
	public boolean insertTalk(InsertTalk insertTalk);
	
	//获得最新话题列表
	public List<NewListTalk> getNewTalkList(int page);
	
	//获得最热列表
	public List<NewListTalk> getHotTalkList(int page);
	
	//获得最新话题数量
	public int getTalkCount();
	
	//获得一条话题
	public OneTalk getOneTalk(int talk_id);
	
	//添加评论;
	public boolean updateDiscuss(String discuss,int talk_id);
	
	//获得评论人的信息
	public DiscussTalk getDiscussTalk(int users_id);
	
	//增加话题的点击量
	public boolean updateTalkSeeCount(int talk_id);
	
	//获得相关的话题
	public List<AboutTalk> getAboutTalk(String tag);
	
	//搜索话题
	public List<AboutTalk> getSearchTalk(SearchTalk searchTalk);
}
