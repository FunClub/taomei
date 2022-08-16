package yucheng.taomei.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.UserService;

@Aspect
@Component("userAdvice")
public class UserAdvice implements ApplicationContextAware {
	private ApplicationContext context;

	/**
	 * 在调用UserService【业务方法】创建一个新的SqlSessionTemplateg给impl
	 * @throws Throwable 
	 * */
	
	@Around("execution(* yucheng.taomei.service.UserService.*(..)) ! within(yucheng.taomei.service.UserService.setSessionTemplate(..))")
	public Object setSqlSessionAndClose(ProceedingJoinPoint point) throws Throwable{
		UserService service = (UserService)point.getTarget();
		SqlSessionTemplate sessionTemplate	=(SqlSessionTemplate)context.getBean("sqlSessionTemplate");
		service.setSessionTemplate(sessionTemplate);
		return point.proceed();
	}


	@Override
	public void setApplicationContext(ApplicationContext context)
			throws BeansException {
		this.context = context;
	}
}
