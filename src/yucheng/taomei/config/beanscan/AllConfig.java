package yucheng.taomei.config.beanscan;

import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

/**
 * 总配置类，用于定义配置和导入其他配置
 * */
//声明配置类
@Configuration

//支持缓存
@EnableCaching

//切面代理目标为类
@EnableAspectJAutoProxy(proxyTargetClass=true)
//导入其他配置类
@Import({
	EhCacheConfig.class,
	DataBaseConfig.class
})

/*扫描Bean*/
@ComponentScan(basePackages={
		"yucheng.taomei.action",
		"yucheng.taomei.advice",
		"yucheng.taomei.dao.impl",
		"yucheng.taomei.service",
		"yucheng.taomei.dwr",
		"yucheng.taomei.websocket"
})
public class AllConfig {
	
}
