package yucheng.taomei.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import yucheng.taomei.dao.impl.NoteDaoImpl;
import yucheng.taomei.factory.UTILFactory;
import yucheng.taomei.vo.note.InsertAttention;
import yucheng.taomei.vo.note.InsertVisitor;
import yucheng.taomei.vo.note.ShowAttention;
import yucheng.taomei.vo.note.ShowVisitor;

@Component("noteService")
public class NoteService {
	@Autowired
	@Qualifier("noteDaoImpl")
	private NoteDaoImpl impl;

	// 更新访客记录
	public boolean updateVisitor(InsertVisitor insertVisitor) {
		boolean flag = false;
		if (impl.hasVisitor(insertVisitor) == false) {
			flag = impl.insertVisitor(insertVisitor);
		} else {
			flag = impl.updateVisitor(insertVisitor);
		}
		return flag;
	}

	// 查询我的访客记录
	public List<ShowVisitor> getShowVisitor(int users_id) {
		List<ShowVisitor> list=impl.getShowVisitor(users_id);
		for (ShowVisitor showVisitor : list) {
			String time=showVisitor.getVisitorTime();
			showVisitor.setVisitorTime(UTILFactory.getEmailTime(time));
		}
		return list;
	}
	
	//添加一条关注记录
	public boolean insertAttention(InsertAttention insertAttention) {
		boolean flag=false;
		if(impl.hasAttention(insertAttention)==false){
			flag=impl.insertAttention(insertAttention);
		}
		return flag;
	}
	
	//取消关注
	public boolean cancelAttention(InsertAttention insertAttention) {
		return impl.cancelAttention(insertAttention);
	}
	
	//查询我的关注记录
	public List<ShowAttention> getAttention(int users_id) {
		
		return impl.getAttention(users_id);
	}
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		impl.setSessionTemplate(sessionTemplate);
	}
}
