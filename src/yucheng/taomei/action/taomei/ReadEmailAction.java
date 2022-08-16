package yucheng.taomei.action.taomei;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.EmailService;
import yucheng.taomei.vo.email.ShowOneEmail;

import com.opensymphony.xwork2.Action;
@Component("readEmailAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class ReadEmailAction implements Action{
	@Autowired
	@Qualifier("emailService")
	private EmailService emailService;
	private HttpSession session;
	private int email_id;
	private int users_id;
	public ReadEmailAction() {
		session = ServletActionContext.getRequest().getSession();
	}
	@Override
	public String execute() throws Exception {
		emailService.updateEmailState(email_id, users_id);
		ShowOneEmail oneEmail = emailService.getOneEmail(email_id, users_id);
		session.setAttribute("oneEmail", oneEmail);
		session.setAttribute("oneEmailStr", oneEmail.getContent());
		return Action.SUCCESS;
	}
	
	
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	public int getEmail_id() {
		return email_id;
	}
	public void setEmail_id(int email_id) {
		this.email_id = email_id;
	}
}
