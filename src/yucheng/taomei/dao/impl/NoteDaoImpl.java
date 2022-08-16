package yucheng.taomei.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.INoteDao;
import yucheng.taomei.vo.note.InsertAttention;
import yucheng.taomei.vo.note.InsertVisitor;
import yucheng.taomei.vo.note.ShowAttention;
import yucheng.taomei.vo.note.ShowVisitor;
//管理用户记录，比如最近访客，我的关注等
@Component("noteDaoImpl")
public class NoteDaoImpl implements INoteDao {
	private SqlSessionTemplate sessionTemplate;
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	//添加一条新的访客记录
	@Override
	public boolean insertVisitor(InsertVisitor insertVisitor) {
		return sessionTemplate.insert("yucheng.taomei.vo.note.insertVisitor", insertVisitor)>0;
	}
	
	//查询访客是否存在
	public boolean hasVisitor(InsertVisitor insertVisitor){
		return sessionTemplate.selectOne("yucheng.taomei.vo.note.hasVisitor", insertVisitor)!=null;
	}
	
	//更新一条访客信息
	@Override
	public boolean updateVisitor(InsertVisitor insertVisitor) {
		return sessionTemplate.update("yucheng.taomei.vo.note.updateVisitor", insertVisitor)>0;
	}
	
	//查询我的访客记录
	@Override
	public List<ShowVisitor> getShowVisitor(int users_id) {
		return sessionTemplate.selectList("yucheng.taomei.vo.note.getShowVisitor", users_id);
	}
	
	//添加一条新的关注记录
	@Override
	public boolean insertAttention(InsertAttention insertAttention) {
		return sessionTemplate.insert("yucheng.taomei.vo.note.insertAttention", insertAttention)>0;
	}

	//判断关注记录是否存在
	@Override
	public boolean hasAttention(InsertAttention insertAttention) {
		return sessionTemplate.selectOne("yucheng.taomei.vo.note.hasAttention",insertAttention)!=null;
	}
	
	//取消关注
	@Override
	public boolean cancelAttention(InsertAttention insertAttention) {
		return sessionTemplate.delete("yucheng.taomei.vo.note.cancelAttention",insertAttention)>0;
	}
	
	//查询我的关注记录
	@Override
	public List<ShowAttention> getAttention(int users_id) {
		return sessionTemplate.selectList("yucheng.taomei.vo.note.getAttention", users_id);
	}
	
	
}
