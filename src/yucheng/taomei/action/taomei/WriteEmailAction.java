package yucheng.taomei.action.taomei;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.Action;

import yucheng.taomei.service.UserService;
import yucheng.taomei.vo.user.WriteEmailUser;

@Component("writeEmailAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class WriteEmailAction implements Action{
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	private int users_id;
	private HttpServletRequest request;
	public WriteEmailAction() {
		request = ServletActionContext.getRequest();
	}
	@Override
	public String execute() throws Exception {
		WriteEmailUser emailUser=userService.getWriteEmailUser(users_id);
		request.setAttribute("emailUser", emailUser);
		return Action.SUCCESS;
	}
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	
	
}
