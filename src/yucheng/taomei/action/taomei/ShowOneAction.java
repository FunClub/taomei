package yucheng.taomei.action.taomei;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.UserService;
import yucheng.taomei.vo.user.AllInfoUser;

import com.opensymphony.xwork2.Action;

@Component("showOneAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class ShowOneAction implements Action{
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	private int users_id;
	private HttpSession session;
	
	public ShowOneAction() {
		session = ServletActionContext.getRequest().getSession();
	}

	@Override
	public String execute() throws Exception {
		AllInfoUser allInfoUser = userService.getAllInfoUser(users_id);
		session.setAttribute("allInfoUser", allInfoUser);
		session.setAttribute("allInfoStr", JSONArray.fromObject(allInfoUser).toString());
		return Action.SUCCESS;
	}

	public int getUsers_id() {
		return users_id;
	}

	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	
	
}
