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
import yucheng.taomei.vo.club.OneTalk;

@Component("showOneTalkAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class ShowOneTalkAction implements Action{
	@Autowired
	@Qualifier("clubService")
	private ClubService clubService;
	private HttpSession session;
	private int talk_id;
	public ShowOneTalkAction() {
		session= ServletActionContext.getRequest().getSession();
	}
	

	@Override
	public String execute() throws Exception {
		OneTalk talk = clubService.getOneTalk(talk_id);
		session.setAttribute("talk", talk);
		return SUCCESS;
	}


	public int getTalk_id() {
		return talk_id;
	}


	public void setTalk_id(int talk_id) {
		this.talk_id = talk_id;
	}
	
}
