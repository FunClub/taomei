package yucheng.taomei.factory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import yucheng.taomei.vo.email.ContentEmail;
import yucheng.taomei.vo.email.ListContentEmail;
import yucheng.taomei.vo.email.ListEmail;
import yucheng.taomei.vo.email.StateEmail;

public class EmailFactory {
	
	//获取未读的私信数量
	public static int getUnReadCount(List<StateEmail> stateList,int users_id){
		int count=0;
		int from_id;
		boolean fromState;
		boolean toState;
		for (StateEmail stateEmail : stateList) {
			from_id = stateEmail.getFrom_emid();
			if(from_id==users_id){
				fromState = stateEmail.isFromState();
				if(fromState==false){
					count++;
				}
			}else{
				toState=stateEmail.isToState();
				if(toState==false){
					count++;
				}
			}
		}
		
		return count;
	}
	//处理从数据库中刚查询出来的私信列表
	public static void setEmailList(List<ListEmail> list,int users_id){
		int from_id;
		boolean fromState;
		boolean toState;
		for (ListEmail listEmail : list) {
			listEmail.setEmailTime(UTILFactory.getEmailTime(listEmail.getEmailTime()));
			from_id = listEmail.getFrom_emid();
			if(from_id==users_id){
				listEmail.settID(listEmail.getTo_emid());
				listEmail.setYou(true);
				fromState = listEmail.isFromState();
				if(fromState){
					listEmail.setState(true);
				}else{
					listEmail.setState(false);
				}
			}else{
				listEmail.settID(listEmail.getFrom_emid());
				listEmail.setYou(false);
				toState = listEmail.isToState();
				if(toState){
					listEmail.setState(true);
				}else{
					listEmail.setState(false);
				}
			}
		}
	}
	
	
	
	
}
