package yucheng.taomei.action.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.ChatService;
import yucheng.taomei.vo.chat.ListFriend;
import yucheng.taomei.vo.chat.NearMessage;
import yucheng.taomei.vo.user.UnionUser;

import com.opensymphony.xwork2.Action;

@Component("chatAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class ChatAction implements Action{
	@Autowired
	@Qualifier("chatService")
	private ChatService chatService;
	private int users_id;
	private HttpSession session;
	public ChatAction() {
		session= ServletActionContext.getRequest().getSession();
		UnionUser unionUser = (UnionUser) session.getAttribute("unionUser");
		users_id = unionUser.getBaseInfoUser().getUsers_id();
	}
	@Override
	public String execute() throws Exception {
		List<ListFriend> friendList = chatService.getFriendList(users_id,"friendList");
		List<NearMessage> nearList=chatService.getNearFriendList(users_id);
		session.setAttribute("friendList", friendList);
		session.setAttribute("nearList", nearList);
		return Action.SUCCESS;
	}
	
}
