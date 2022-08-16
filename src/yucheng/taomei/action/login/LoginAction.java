package yucheng.taomei.action.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.UserService;
import yucheng.taomei.vo.user.NewStarUser;
import yucheng.taomei.vo.user.RecommendUser;
import yucheng.taomei.vo.user.UnionUser;

import com.opensymphony.xwork2.Action;

@Component("loginAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class LoginAction implements Action{
	private HttpSession session;
	private String account;
	private String passWords;
	private PrintWriter out;
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	public LoginAction() throws IOException {
		session = ServletActionContext.getRequest().getSession();
		out  = ServletActionContext.getResponse().getWriter();	
	}	
	@Override
	public String execute(){
		if(userService.isTrueUser(account, passWords)){
			UnionUser unionUser = userService.getUnionUser(account);
			List<RecommendUser> recoUsers = userService.getRecommendUser(unionUser.getQualificationInfoUser());
			String sex = unionUser.getBaseInfoUser().getSex();
			sex = sex.equals("男")?"女":"男";
			List<NewStarUser> starUser = userService.getNewStarUser(sex);
			JSONArray array = JSONArray.fromObject(unionUser);
			session.setAttribute("unionUserStr", array.toString());
			session.setAttribute("unionUser", unionUser);
			session.setAttribute("starUser", starUser);
			session.setAttribute("recoUser", recoUsers);
			session.setMaxInactiveInterval(0);
			out.print("1");
		}else{
			out.print("2");
		}
		return null;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassWords() {
		return passWords;
	}
	public void setPassWords(String passWords) {
		this.passWords = passWords;
	}
}
