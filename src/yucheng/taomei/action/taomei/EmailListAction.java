package yucheng.taomei.action.taomei;

import java.util.List;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.EmailService;
import yucheng.taomei.service.NoteService;
import yucheng.taomei.vo.email.AllListEmail;
import yucheng.taomei.vo.note.ShowAttention;
import yucheng.taomei.vo.note.ShowVisitor;
import yucheng.taomei.vo.user.UnionUser;

import com.opensymphony.xwork2.Action;

/*查询私信列表*/
@Component("emailListAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class EmailListAction implements Action{
	@Autowired
	@Qualifier("emailService")
	private EmailService emailService;
	@Autowired
	@Qualifier("noteService")
	private NoteService noteService;
	private HttpSession session;
	private int users_id;
	
	public EmailListAction() {
		session = ServletActionContext.getRequest().getSession();
		UnionUser unionUser = (UnionUser) session.getAttribute("unionUser");
		users_id=  unionUser.getBaseInfoUser().getUsers_id();
	}
	@Override
	public String execute() throws Exception {
		AllListEmail listEmail=emailService.getAllListEmail(users_id,0);
		List<ShowVisitor> visitorList = noteService.getShowVisitor(users_id);
		List<ShowAttention> attentionList =noteService.getAttention(users_id);
		session.setAttribute("visitorList", JSONArray.fromObject(visitorList).toString());
		session.setAttribute("attentionList", JSONArray.fromObject(attentionList).toString());
		session.setAttribute("allListEmail", listEmail);
		return Action.SUCCESS;
	}

}
