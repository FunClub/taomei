package yucheng.taomei.dwr;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.directwebremoting.annotations.Param;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.directwebremoting.annotations.ScriptScope;
import org.directwebremoting.spring.SpringCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.ChatService;
import yucheng.taomei.service.ClubService;
import yucheng.taomei.service.EmailService;
import yucheng.taomei.service.UserService;
import yucheng.taomei.vo.club.NewListTalk;
import yucheng.taomei.vo.club.SearchTalk;
import yucheng.taomei.vo.email.ListEmail;
import yucheng.taomei.vo.user.AllSearchInfoUser;
import yucheng.taomei.vo.user.QualSearchUser;

@Component("searchDWR")
@RemoteProxy(
		creator = SpringCreator.class,
		creatorParams = @Param(name = "beanName", value = "searchDWR"),
		name = "SearchDWR", 
		scope = ScriptScope.APPLICATION)

public class SearchDWR {
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	@Autowired
	@Qualifier("emailService")
	private EmailService emailService;
	@Autowired
	@Qualifier("chatService")
	private ChatService chatService;
	
	@Autowired
	@Qualifier("clubService")
	private ClubService clubService;
	
	//搜索话题
	@RemoteMethod
	public String searchTalk(String searchTalk){
		SearchTalk talk=(SearchTalk)JSONObject.toBean(JSONObject.fromObject(searchTalk), SearchTalk.class);
		String tag = talk.getTag();
		@SuppressWarnings("unchecked")
		List<String> tags = (List<String>)JSONArray.toCollection(JSONArray.fromObject(tag));
		talk.setTags(tags);
		return JSONArray.fromObject(clubService.getSearchTalk(talk)).toString();
	}
	
	//获得最热话题
	@RemoteMethod
	public String getPointHotTalk(int page){
		List<NewListTalk> list = clubService.getPointHotTalk(page);
		return JSONArray.fromObject(list).toString();
	}
	
	@RemoteMethod
	public String getPointNewTalk(int page){
		List<NewListTalk> list = clubService.getPointNewTalk(page);
		return JSONArray.fromObject(list).toString();
	}
	
	// 获得和某个用户的消息记录
	@RemoteMethod
	public String getMessage(int users_chid1, int users_chid2) {
		return chatService.getMessageText(users_chid1, users_chid2,"getMessage");
	}
	
	//获得用户的内心独白
	@RemoteMethod
	public String getHeart(int users_id){
		return userService.getHeart(users_id);
	}
	//获得查询出来的user
	@RemoteMethod
	public String getSearchInfoUser(String qualInfo){
		QualSearchUser qualSearchUser = (QualSearchUser)JSONObject.toBean(JSONObject.fromObject(qualInfo), QualSearchUser.class);
		AllSearchInfoUser users=userService.getSearchInfoUser(qualSearchUser);
		return JSONObject.fromObject(users).toString();
	}
	//获得指定页的私信列表
	@RemoteMethod
	public String getPointListEmail(int users_id, int page){
		List<ListEmail> list=emailService.getPointListEmail(users_id, page);
		String s = JSONArray.fromObject(list).toString();
		return s;
	}
	//获得私信未读数量
	@RemoteMethod
	public int getUnReadCount(int users_id){
		return emailService.getUnReadCount(users_id);
	}
	
}
