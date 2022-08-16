package yucheng.taomei.config.beanscan;

import javax.sql.DataSource;

import org.apache.ibatis.datasource.pooled.PooledDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
/**
 * SQL Server閰嶇疆绫�
 * */
@Configuration
public class DataBaseConfig {
	@Bean
	public PooledDataSource pooledDataSource(){
		PooledDataSource dataSource= new PooledDataSource();
		dataSource.setDriver("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		dataSource.setUrl("jdbc:sqlserver://localhost:1433;DatabaseName=taomei");
		dataSource.setUsername("sa");
		dataSource.setPassword("123456");
		return dataSource;
	}
	@Bean
	public SqlSessionFactoryBean sessionFactoryBean(DataSource dataSource){
		SqlSessionFactoryBean sessionFactory =new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		sessionFactory.setTypeAliasesPackage("yucheng.taomei.vo");
		Resource resource[] ={
			new ClassPathResource("yucheng/taomei/config/mybatis/usersMapper.xml"),
			new ClassPathResource("yucheng/taomei/config/mybatis/emailMapper.xml"),
			new ClassPathResource("yucheng/taomei/config/mybatis/noteMapper.xml"),
			new ClassPathResource("yucheng/taomei/config/mybatis/chatMapper.xml"),
			new ClassPathResource("yucheng/taomei/config/mybatis/clubMapper.xml")
		};
		sessionFactory.setMapperLocations(resource);
		return sessionFactory;
	}
	@Bean(name="sqlSessionTemplate")
	@Scope(scopeName="prototype")
	public SqlSessionTemplate sqlSessionTemplate (SqlSessionFactory sessionFactory){
		SqlSessionTemplate sqlSessionTemplate= new SqlSessionTemplate(sessionFactory);
		return sqlSessionTemplate;
	}
}
