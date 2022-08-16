package yucheng.taomei.dwr;

import org.directwebremoting.WebContextFactory;
import org.directwebremoting.annotations.Param;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.directwebremoting.annotations.ScriptScope;
import org.directwebremoting.spring.SpringCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.UserService;

/**
 * 用来验证、判断各种数据的DWR
 * */
@Component("validateDWR")
@RemoteProxy(
		creator = SpringCreator.class,
		creatorParams = @Param(name = "beanName", value = "validateDWR"),
		name = "ValidateDWR", 
		scope = ScriptScope.APPLICATION)

public class ValidateDWR {
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@RemoteMethod// 验证账号是否被注册
	public boolean isAccountRegisted(String account) {
		return userService.isAccountRegisted(account);
	}
	
	
	@RemoteMethod//验证用户输入的验证码是否正确
	public boolean isValidateCode(String validateCode){
		String code = WebContextFactory.get().getHttpServletRequest().getSession().getAttribute("validataCode").toString();
		return validateCode.equals(code);
	}
	
	@RemoteMethod//验证用户的账号和密码是否正确
	public boolean isTrueUser(String account, String passWords) {
		return userService.isTrueUser(account, passWords);
	}
}
