package yucheng.taomei.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import yucheng.taomei.service.NoteService;

@Aspect
@Component("noteAdvice")
public class NoteAdvice implements ApplicationContextAware{
	private ApplicationContext context;
	
	/**
	 * 在调用NoteService【业务方法】创建一个新的SqlSessionTemplateg给impl
	 * @throws Throwable 
	 * */
	@Around("execution(* yucheng.taomei.service.NoteService.*(..)) ! within(yucheng.taomei.service.NoteService.setSessionTemplate(..))")
	public Object setSqlSessionAndClose(ProceedingJoinPoint point) throws Throwable{
		NoteService service = (NoteService)point.getTarget();
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
