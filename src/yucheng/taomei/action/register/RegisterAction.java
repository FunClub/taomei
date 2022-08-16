package yucheng.taomei.action.register;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.UserService;
import yucheng.taomei.vo.user.RegisterUser;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

@Component("registerAction")
@Scope(scopeName=ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class RegisterAction implements ModelDriven<RegisterUser>,Action{
	private RegisterUser registerUser;
	private PrintWriter out;
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	public RegisterAction() throws IOException {
		out= ServletActionContext.getResponse().getWriter();
	}
	@Override
	public String execute(){
		if(userService.insertNewUser(registerUser)){
			out.print("success");
		}else{
			out.print("error");
		}
		return null;
	}
	public RegisterUser getRegisterUser() {
		return registerUser;
	}
	public void setRegisterUser(RegisterUser registerUser) {
		this.registerUser = registerUser;
	}
	@Override
	public RegisterUser getModel() {
		return registerUser=new RegisterUser();
	} 
	
	
}
