package yucheng.taomei.config.beanscan;

import net.sf.ehcache.CacheManager;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

/**
 *  EhCache配置类
 * */
@Configuration
public class EhCacheConfig {
	@Bean(name="ehCacheCacheManager")
	public EhCacheCacheManager cacheManager(CacheManager cacheManager){
		return new EhCacheCacheManager(cacheManager);
	}
	@Bean(name="ehCacheManagerFactoryBean")
	public EhCacheManagerFactoryBean managerFactoryBean(){
		EhCacheManagerFactoryBean managerFactoryBean = new EhCacheManagerFactoryBean();
		managerFactoryBean.setConfigLocation(new ClassPathResource("ehcache-failsafe.xml"));
		return managerFactoryBean;
	}
}
