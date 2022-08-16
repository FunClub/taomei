package yucheng.taomei.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONArray;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.impl.ClubDaoImpl;
import yucheng.taomei.vo.club.AboutTalk;
import yucheng.taomei.vo.club.AllNewListTalk;
import yucheng.taomei.vo.club.DiscussTalk;
import yucheng.taomei.vo.club.InsertDiscussTalk;
import yucheng.taomei.vo.club.InsertTalk;
import yucheng.taomei.vo.club.NewListTalk;
import yucheng.taomei.vo.club.OneTalk;
import yucheng.taomei.vo.club.SearchTalk;
@Component("clubService")
public class ClubService {
	@Autowired
	@Qualifier("clubDaoImpl")
	private ClubDaoImpl impl;
	
	//获得最新话题列表
	@SuppressWarnings("unchecked")
	public AllNewListTalk getAllNewListTalk(int page){
		List<NewListTalk> list =impl.getNewTalkList(page);
		for (NewListTalk newListTalk : list) {
			String s=newListTalk.getTalkImg();
			List<String> imgs = (List<String>)JSONArray.toCollection(JSONArray.fromObject(s));
			newListTalk.setTalkImgList(imgs);
		}
		int count = impl.getTalkCount();
		AllNewListTalk allNewListTalk = new AllNewListTalk();
		allNewListTalk.setNewListTalkCount(count);
		allNewListTalk.setNewTalkList(list);
		return allNewListTalk;
	}
	public List<NewListTalk> getPointNewTalk(int page){
		List<NewListTalk> list =impl.getNewTalkList(page);
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public AllNewListTalk getHotTalkList(int page){
		List<NewListTalk> list =impl.getHotTalkList(page);
		for (NewListTalk newListTalk : list) {
			String s=newListTalk.getTalkImg();
			List<String> imgs = (List<String>)JSONArray.toCollection(JSONArray.fromObject(s));
			newListTalk.setTalkImgList(imgs);
		}
		int count = impl.getTalkCount();
		AllNewListTalk allNewListTalk = new AllNewListTalk();
		allNewListTalk.setNewListTalkCount(count);
		allNewListTalk.setNewTalkList(list);
		return allNewListTalk;
	}
	public List<NewListTalk> getPointHotTalk(int page){
		List<NewListTalk> list =impl.getHotTalkList(page);
		return list;
	}
	
	
	
	//发表话题
	public boolean insertTalk(InsertTalk insertTalk) {	
		return impl.insertTalk(insertTalk);
	}
	
	//获得一条话题
	@SuppressWarnings("unchecked")
	public OneTalk getOneTalk(int talk_id) {
		impl.updateTalkSeeCount(talk_id);
		OneTalk  talk = impl.getOneTalk(talk_id);
		talk.setImgs((List<String>)JSONArray.toCollection(JSONArray.fromObject(talk.getTalkImg())));
		List<String> tags = (List<String>)JSONArray.toCollection(JSONArray.fromObject(talk.getTalkTag()));
		talk.setTags(tags);
		List<DiscussTalk> talks = new ArrayList<DiscussTalk>();
		if(talk.getTalkDiscuss()!=null){
			List<InsertDiscussTalk> insert = (List<InsertDiscussTalk>)JSONArray.toCollection(JSONArray.fromObject(talk.getTalkDiscuss()), InsertDiscussTalk.class);
			for (InsertDiscussTalk insertDiscussTalk : insert) {
				DiscussTalk discussTalk = impl.getDiscussTalk(insertDiscussTalk.getUsers_id());
				discussTalk.setDisscuss(insertDiscussTalk.getDiscuss());
				discussTalk.setDiscussTime(insertDiscussTalk.getDiscussTime());
				talks.add(discussTalk);
			}
		}
		talk.setDiscussTalkJSON(JSONArray.fromObject(talks).toString());
		talk.setDiscuss(talks);
		List<AboutTalk> abouts = new ArrayList<AboutTalk>();
		for (String tag : tags) {
			List<AboutTalk> a1 = impl.getAboutTalk(tag);
			if(a1!=null){
				abouts.addAll(a1);
			}
		}
		HashMap<Integer,AboutTalk> aboutMap = new HashMap<Integer,AboutTalk>();
		for (AboutTalk aboutTalk : abouts) {
			aboutMap.put(aboutTalk.getTalk_id(), aboutTalk);
		}
		abouts.clear();
		aboutMap.remove(talk_id);
		Iterator<AboutTalk> it = aboutMap.values().iterator();
		while(it.hasNext()){
			abouts.add(it.next());
		}
		talk.setAbouts(abouts);
		return talk;
	}
	
	//更新评论
	public boolean updateDiscuss(String discuss, int talk_id) {
		return impl.updateDiscuss(discuss, talk_id);
	}
	
	//搜索相关
	public List<AboutTalk> getSearchTalk(SearchTalk searchTalk) {

		return impl.getSearchTalk(searchTalk);
	}
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		impl.setSessionTemplate(sessionTemplate);
	}
}
