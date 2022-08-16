package yucheng.taomei.action.search;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.UserService;
import yucheng.taomei.vo.user.AllSearchInfoUser;
import yucheng.taomei.vo.user.QualSearchUser;
import yucheng.taomei.vo.user.QualificationInfoUser;
import yucheng.taomei.vo.user.UnionUser;

import com.opensymphony.xwork2.Action;

/*用于条件搜索*/
@Component("searchQualUserAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class SearchQualUserAction implements Action{
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	private HttpSession session;
	public SearchQualUserAction() {
		session = ServletActionContext.getRequest().getSession();
		
	}
	
	@Override
	public String execute() throws Exception {
		UnionUser unionUser = (UnionUser)session.getAttribute("unionUser");
		AllSearchInfoUser searchInfoUser=userService.getSearchInfoUser(getQualUser(unionUser));
		session.setAttribute("searchInfoUser", searchInfoUser);
		session.setAttribute("searchInfoUserStr", JSONObject.fromObject(searchInfoUser).toString());
		return Action.SUCCESS;
	}
	public QualSearchUser getQualUser(UnionUser unionUser){
		QualSearchUser searchUser = new QualSearchUser();
		QualificationInfoUser infoUser = unionUser.getQualificationInfoUser();
		searchUser.setWantLivePlace(infoUser.getWantLivePlace());
		searchUser.setWantHighestAge(infoUser.getWantHighestAge());
		searchUser.setWantLowestAge(infoUser.getWantLowestAge());
		searchUser.setWantSex(infoUser.getSex().equals("男")?"女":"男");
		return searchUser;
	}
	
}
