package yucheng.taomei.dao.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.IClubDao;
import yucheng.taomei.vo.club.AboutTalk;
import yucheng.taomei.vo.club.DiscussTalk;
import yucheng.taomei.vo.club.InsertTalk;
import yucheng.taomei.vo.club.NewListTalk;
import yucheng.taomei.vo.club.OneTalk;
import yucheng.taomei.vo.club.SearchTalk;

@Component("clubDaoImpl")
public class ClubDaoImpl implements IClubDao{
	private SqlSessionTemplate sessionTemplate;
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	//发表话题
	@Override
	public boolean insertTalk(InsertTalk insertTalk) {	
		return sessionTemplate.insert("yucheng.taomei.vo.club.insertTalk", insertTalk)>0;
	}
	
	//获得最新话题列表
	@Override
	public List<NewListTalk> getNewTalkList(int page) {
		List<NewListTalk> list = sessionTemplate.selectList("yucheng.taomei.vo.club.getNewTalkList", page);
		return list;
	}
	
	//获得最热话题列表
	@Override
	public List<NewListTalk> getHotTalkList(int page) {
		List<NewListTalk> list = sessionTemplate.selectList("yucheng.taomei.vo.club.getHotTalkList", page);
		return list;
	}
	
	//获得最新话题数量
	@Override
	public int getTalkCount() {
		return sessionTemplate.selectOne("yucheng.taomei.vo.club.getTalkCount");
	}
	
	//获得一条话题
	@Override
	public OneTalk getOneTalk(int talk_id) {
		return sessionTemplate.selectOne("yucheng.taomei.vo.club.getOneTalk", talk_id);
	}
	
	//更新评论
	@Override
	public boolean updateDiscuss(String discuss, int talk_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("talkDiscuss", discuss);map.put("talk_id", talk_id);
		return sessionTemplate.update("yucheng.taomei.vo.club.updateDiscuss", map)>0;
	}
	
	//获得评论人的信息
	@Override
	public DiscussTalk getDiscussTalk(int users_id) {
		return sessionTemplate.selectOne("yucheng.taomei.vo.club.getDiscussTalk", users_id);
	}
	
	//增加话题点击量
	@Override
	public boolean updateTalkSeeCount(int talk_id) {
		return sessionTemplate.update("yucheng.taomei.vo.club.updateTalkSeeCount", talk_id)>0;
	}
	
	//获得相关的话题
	@Override
	public List<AboutTalk> getAboutTalk(String tag) {		
		return sessionTemplate.selectList("yucheng.taomei.vo.club.getAboutTalk", tag);
	}
	
	//搜索相关
	@Override
	public List<AboutTalk> getSearchTalk(SearchTalk searchTalk) {
		List<String> tags = searchTalk.getTags();
		String talkTitle = searchTalk.getKey();
		HashMap<String, String> map = new HashMap<String, String>();
		List<AboutTalk> abouts = new ArrayList<AboutTalk>();
		map.put("talkTitle", talkTitle);
		if(tags.size()>0){
			for (String talkTag : tags) {
				 map.put("talkTag", talkTag);
				 List<AboutTalk> list=sessionTemplate.selectList("yucheng.taomei.vo.club.getSearchTalk", map);
				 abouts.addAll(list);
			}
			HashMap<Integer,AboutTalk> talkMap = new HashMap<Integer, AboutTalk>();
			for (AboutTalk aboutTalk : abouts) {
				talkMap.put(aboutTalk.getTalk_id(), aboutTalk);
			}
			Iterator<AboutTalk> it = talkMap.values().iterator();
			abouts.clear();
			while(it.hasNext()){
				abouts.add(it.next());
			}
		}else{
			abouts=sessionTemplate.selectList("yucheng.taomei.vo.club.getSearchTalk", map);
		}
		
		return abouts;
	}

	

}
