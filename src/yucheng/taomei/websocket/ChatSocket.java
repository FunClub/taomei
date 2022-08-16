package yucheng.taomei.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Component;

import yucheng.taomei.factory.UTILFactory;
import yucheng.taomei.vo.message.ChatMessage;

@ServerEndpoint("/chat/{users_id}")
@Component("chatSocket")
public class ChatSocket{
	private String users_id;
	private Session session;
	public static HashMap<String,List<Session>> chatSession = new HashMap<String,List<Session>>();
	
	@OnOpen
	public void open(Session session,@PathParam("users_id") String users_id){
		this.session = session;
		this.users_id = users_id;
		if(chatSession.containsKey(users_id)){
			List<Session> list=chatSession.get(users_id);
			list.add(session);
		}else{
			List<Session> list = new ArrayList<Session>();
			list.add(session);
			chatSession.put(users_id, list);
		}
	}
	
	@OnMessage
	public void message(String message){
		ChatMessage messageObj = (ChatMessage)JSONObject.toBean(JSONObject.fromObject(message), ChatMessage.class);
		String time = UTILFactory.getHMTime();
		messageObj.setTime(time);
		message = JSONObject.fromObject(messageObj).toString();
		String to_id=messageObj.getTo_id();
		List<Session> list=chatSession.get(to_id);
		if(list!=null){
			for (Iterator<Session> iterator = list.iterator(); iterator.hasNext();) {
				Session session = iterator.next();
				try {
					session.getBasicRemote().sendText(message);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	@OnClose
	public void close(){
		try {
			session.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<Session> listSession=chatSession.get(users_id);
		listSession.remove(session);
		if(listSession.size()==0){
			chatSession.remove(users_id);
		}
	}
	@OnError
    public void onError(Throwable t) throws Throwable {
       //System.out.println("websicket:error..........");
    }
	
}
