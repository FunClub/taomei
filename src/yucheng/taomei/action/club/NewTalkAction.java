package yucheng.taomei.action.club;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.Action;

import yucheng.taomei.service.ClubService;
import yucheng.taomei.vo.club.AllNewListTalk;

@Component("newTalkAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class NewTalkAction {
	@Autowired
	@Qualifier("clubService")
	private ClubService clubService;
	private HttpSession session;
	public NewTalkAction() {
		session = ServletActionContext.getRequest().getSession();
	}
	
	public String execute(){
		AllNewListTalk allNewListTalk = clubService.getAllNewListTalk(0);
		AllNewListTalk allHotListTalk = clubService.getHotTalkList(0);
		session.setAttribute("allNewListTalk", allNewListTalk);
		session.setAttribute("allHotListTalk", allHotListTalk);
		return Action.SUCCESS;
	}
}
