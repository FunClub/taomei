package yucheng.taomei.dao;

import java.util.List;

import yucheng.taomei.vo.note.InsertAttention;
import yucheng.taomei.vo.note.InsertVisitor;
import yucheng.taomei.vo.note.ShowAttention;
import yucheng.taomei.vo.note.ShowVisitor;

//管理用户记录，比如最近访客，我的关注等
public interface INoteDao {
	
	//添加一条新的访客记录
	public boolean insertVisitor(InsertVisitor insertVisitor);
	
	//查询访客是否存在
	public boolean hasVisitor(InsertVisitor insertVisitor);
	
	//更新一条访客信息
	public boolean updateVisitor(InsertVisitor insertVisitor);
	
	//查询我的访客记录
	public List<ShowVisitor> getShowVisitor(int users_id);
	
	//添加一条新的关注记录
	public boolean insertAttention(InsertAttention insertAttention);
	
	//判断关注记录是否存在
	public boolean hasAttention(InsertAttention insertAttention);
	
	//取消关注
	public boolean cancelAttention(InsertAttention insertAttention);
	
	//查询我的关注记录
	public List<ShowAttention> getAttention(int users_id);
}
