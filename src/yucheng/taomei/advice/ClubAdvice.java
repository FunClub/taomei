package yucheng.taomei.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.ClubService;

@Aspect
@Component("clubAdvice")
public class ClubAdvice implements ApplicationContextAware{
	private ApplicationContext context;
	
	/**
	 * 在调用ClubService【业务方法】创建一个新的SqlSessionTemplateg给impl
	 * @throws Throwable 
	 * */
	@Around("execution(* yucheng.taomei.service.ClubService.*(..)) ! within(yucheng.taomei.service.ClubService.setSessionTemplate(..))")
	public Object setSqlSessionAndClose(ProceedingJoinPoint point) throws Throwable{
		ClubService service = (ClubService)point.getTarget();
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
