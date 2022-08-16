package yucheng.taomei.dwr;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.annotations.Param;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.directwebremoting.annotations.ScriptScope;
import org.directwebremoting.spring.SpringCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import yucheng.taomei.factory.UTILFactory;
import yucheng.taomei.factory.UserFactory;
import yucheng.taomei.service.ChatService;
import yucheng.taomei.service.ClubService;
import yucheng.taomei.service.EmailService;
import yucheng.taomei.service.NoteService;
import yucheng.taomei.service.UserService;
import yucheng.taomei.vo.chat.AddFriend;
import yucheng.taomei.vo.chat.SaveMessage;
import yucheng.taomei.vo.chat.UpdateMessageState;
import yucheng.taomei.vo.club.InsertDiscussTalk;
import yucheng.taomei.vo.club.InsertTalk;
import yucheng.taomei.vo.email.ContentEmail;
import yucheng.taomei.vo.email.InsertEmail;
import yucheng.taomei.vo.email.UpdateEmail;
import yucheng.taomei.vo.note.InsertAttention;
import yucheng.taomei.vo.note.InsertVisitor;
import yucheng.taomei.vo.user.BaseInfoUser;
import yucheng.taomei.vo.user.DetailedInfoUser;
import yucheng.taomei.vo.user.OtherInfoUser;
import yucheng.taomei.vo.user.Photo;
import yucheng.taomei.vo.user.QualificationInfoUser;
import yucheng.taomei.vo.user.UnionUser;

/**
 * 用于更新数据库信息的Dwr
 * */
@Component("updateDWR")
@RemoteProxy(creator = SpringCreator.class, creatorParams = @Param(name = "beanName", value = "updateDWR"), name = "UpdateDWR", scope = ScriptScope.APPLICATION)
public class UpdateDWR {
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@Autowired
	@Qualifier("emailService")
	private EmailService emailService;
	
	@Autowired
	@Qualifier("noteService")
	private NoteService noteService;


	@Autowired
	@Qualifier("chatService")
	private ChatService chatService;
	
	@Autowired
	@Qualifier("clubService")
	private ClubService clubService;
	
	//发表评论
	@SuppressWarnings("unchecked")
	@RemoteMethod
	public boolean updateDiscuss(String discuss){
		List<InsertDiscussTalk> list = (List<InsertDiscussTalk>)JSONArray.toCollection(JSONArray.fromObject(discuss), InsertDiscussTalk.class);
		InsertDiscussTalk lastDiscuss = list.get(list.size()-1);
		lastDiscuss.setDiscussTime(UTILFactory.getSimpleTime());
		int talk_id = lastDiscuss.getTalk_id();
		String dis = JSONArray.fromObject(list).toString();
		return clubService.updateDiscuss(dis, talk_id);
	}
	//发表话题
	@RemoteMethod
	public boolean insertTalk(String insertTalks){
		InsertTalk insertTalk = (InsertTalk)JSONObject.toBean(JSONObject.fromObject(insertTalks), InsertTalk.class);
		insertTalk.setTalkTime(UTILFactory.getSimpleTime());
		return clubService.insertTalk(insertTalk);
	}
	
	//上传图片
	@RemoteMethod
	public String upLoadImg(InputStream in, String fileName) throws IOException{
		return sendImg(in, fileName);
	}
	
	//删除图片
	@RemoteMethod
	public boolean deleteImg(String imgPath){
		HttpSession session = WebContextFactory.get().getSession();
		boolean flag = false;
		flag=new File("E:/MyEclipseWorkSpace/taomei/WebRoot/" + imgPath).delete();
		flag=new File(session.getServletContext().getRealPath("") + "/" + imgPath).delete();
		return flag;
	}
	
	//发送图片
	@RemoteMethod
	public String sendImg(InputStream in, String fileName) throws IOException{
		HttpSession session = WebContextFactory.get().getSession();
		// 生成随机文件名
		fileName = UTILFactory.getFileTime() + in.hashCode()
				+ FilenameUtils.getName(fileName);

		// 设定文件路径
		String DirPath = "E:/MyEclipseWorkSpace/taomei/WebRoot/images/upload/"
				+ fileName;
		String servletPath = session.getServletContext().getRealPath(
				"images/upload")
				+ "/" + fileName;
		String imgPath = "images/upload/" + fileName;
		// 文件复制
		FileUtils.copyInputStreamToFile(in, new File(servletPath));
		InputStream ins = new FileInputStream(servletPath);
		FileUtils.copyInputStreamToFile(ins, new File(DirPath));
		return imgPath;
	}
	
	//更新消息记录的状态
	@RemoteMethod
	public boolean updateMessageState(String messageState){
		UpdateMessageState updateMessageState = (UpdateMessageState)JSONObject.toBean(JSONObject.fromObject(messageState), UpdateMessageState.class);
		return chatService.updateMessageState(updateMessageState);
	}
	//更新消息记录
	@RemoteMethod
	public boolean updateMessage(String message) {
		SaveMessage saveMessage = (SaveMessage)JSONObject.toBean(JSONObject.fromObject(message), SaveMessage.class);
		return chatService.updateMessage(saveMessage);
	}
	
	//添加朋友
	@RemoteMethod
	public boolean addFriend(String addFriends) {
		AddFriend addFriend =(AddFriend)JSONObject.toBean(JSONObject.fromObject(addFriends), AddFriend.class);
		return chatService.addFriend(addFriend);
	}
	//取消关注
	@RemoteMethod
	public boolean cancelAttention(String attention){
		InsertAttention insertAttention = (InsertAttention)JSONObject.toBean(JSONObject.fromObject(attention), InsertAttention.class); 
		return noteService.cancelAttention(insertAttention);
	}
	//关注他人
	@RemoteMethod
	public boolean insertAttention(String attention){
		InsertAttention insertAttention = (InsertAttention)JSONObject.toBean(JSONObject.fromObject(attention), InsertAttention.class); 
		return noteService.insertAttention(insertAttention);
	}
	
	//更新对方的访客信息
	@RemoteMethod
	public boolean updateVisitor(String visiotr){
		InsertVisitor insertVisitor = (InsertVisitor)JSONObject.toBean(JSONObject.fromObject(visiotr), InsertVisitor.class);
		insertVisitor.setVisitorTime(UTILFactory.getSimpleTime());
		return noteService.updateVisitor(insertVisitor);
	}
	
	//删除一条私信
	@RemoteMethod
	public boolean deleteEmail(String email_id){
		@SuppressWarnings("unchecked")
		List<String>  email_ids = (List<String>)JSONArray.toCollection(JSONArray.fromObject(email_id));
		return emailService.deleteEmail(email_ids);
	}
	//更新一条私信的内容
	@RemoteMethod
	public boolean updateContEmails(String updateEmailStr) {
		UpdateEmail updateEmail = (UpdateEmail)JSONObject.toBean(JSONObject.fromObject(updateEmailStr), UpdateEmail.class);
		String contents = updateEmail.getContent();
		@SuppressWarnings("unchecked")
		List<ContentEmail> list = (List<ContentEmail>)JSONArray.toCollection(JSONArray.fromObject(contents), ContentEmail.class);
		String time = UTILFactory.getSimpleTime();
		list.get(list.size()-1).setTime(time);
		updateEmail.setEmailTime(time);
		updateEmail.setContent(JSONArray.fromObject(list).toString());
		return emailService.updateContEmails(updateEmail);
	}
	// 插入一条新的私信
	@RemoteMethod
	public boolean insertEmail(String insertEmailStr) {
		InsertEmail insertEmail = (InsertEmail)JSONObject.toBean(JSONObject.fromObject(insertEmailStr), InsertEmail.class);
		@SuppressWarnings("unchecked")
		List<ContentEmail> contentEmails = (List<ContentEmail>)JSONArray.toCollection(JSONArray.fromObject(insertEmail.getContent()), ContentEmail.class);
		String time = UTILFactory.getSimpleTime();
		contentEmails.get(0).setTime(time);;
		String contentStr = JSONArray.fromObject(contentEmails).toString();
		insertEmail.setContent(contentStr);
		insertEmail.setEmailTime(time);
		boolean flag = emailService.insertEmail(insertEmail);
		return flag;
	}
	// 更新用户手机号
	@RemoteMethod
	public int updateTelphone(int users_id, String telphone) {
		boolean flag = userService.updateTelphone(users_id, telphone);
		int count = 0;
		if (flag) {
			HttpSession session = WebContextFactory.get().getSession();
			UnionUser union = (UnionUser) session.getAttribute("unionUser");
			BaseInfoUser base = union.getBaseInfoUser();
			base.setTelphone(telphone);
			count = UserFactory.preInfoPerfect(union);
			union.setInfoPerfect(count);
			session.setAttribute("unionUserStr", JSONArray.fromObject(union)
					.toString());
		}
		return count;
	}

	// 更新用户身份证号
	@RemoteMethod
	public int updateID(int users_id, String ID) {
		boolean flag = userService.updateID(users_id, ID);
		int count = 0;
		if (flag) {
			HttpSession session = WebContextFactory.get().getSession();
			UnionUser union = (UnionUser) session.getAttribute("unionUser");
			BaseInfoUser base = union.getBaseInfoUser();
			base.setID(ID);
			count = UserFactory.preInfoPerfect(union);
			union.setInfoPerfect(count);
			session.setAttribute("unionUserStr", JSONArray.fromObject(union)
					.toString());
		}
		return count;
	}

	// 更新用户头像
	@RemoteMethod
	public String updateHead(InputStream in, String fileName, int users_id)
			throws IOException {
		HttpSession session = WebContextFactory.get().getSession();
		// 生成随机文件名
		fileName = UTILFactory.getFileTime() + in.hashCode()
				+ FilenameUtils.getName(fileName);

		// 设定文件路径
		String DirPath = "E:/MyEclipseWorkSpace/taomei/WebRoot/images/upload/"
				+ fileName;
		String servletPath = session.getServletContext().getRealPath(
				"images/upload")
				+ "/" + fileName;
		String imgPath = "images/upload/" + fileName;

		FileUtils.copyInputStreamToFile(in, new File(servletPath));
		boolean flag = userService.updateHead(users_id, imgPath);

		int count = 0;
		String result = null;
		if (flag) {
			UnionUser unionUser = (UnionUser) session.getAttribute("unionUser");
			unionUser.getOtherInfoUser().setHeadPicture(imgPath);
			count = UserFactory.preInfoPerfect(unionUser);
			unionUser.setInfoPerfect(count);
			session.setAttribute("unionUserStr", JSONArray
					.fromObject(unionUser).toString());
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("path", imgPath);
			map.put("count", String.valueOf(count));
			result = JSONArray.fromObject(map).toString();
			InputStream ins = new FileInputStream(servletPath);
			FileUtils.copyInputStreamToFile(ins, new File(DirPath));
		} else {
			new File(DirPath).delete();
		}
		return result;
	}

	// 更新用户相册
	@RemoteMethod
	public String updatePhoto(InputStream in, String fileName, int users_id)
			throws IOException {
		HttpSession session = WebContextFactory.get().getSession();
		// 生成随机文件名
		fileName = UTILFactory.getFileTime() + in.hashCode()
				+ FilenameUtils.getName(fileName);

		// 设定文件路径
		String DirPath = "E:/MyEclipseWorkSpace/taomei/WebRoot//images/upload/"
				+ fileName;
		String servletPath = session.getServletContext().getRealPath(
				"images/upload")
				+ "/" + fileName;
		String imgPath = "images/upload/" + fileName;

		UnionUser unionUser = (UnionUser) session.getAttribute("unionUser");
		OtherInfoUser othe = unionUser.getOtherInfoUser();
		String newPhtoto = null;
		if (othe.getPhoto() == null) {
			Photo photo = new Photo(1);
			photo.getList().add(imgPath);
			newPhtoto = JSONArray.fromObject(photo).toString();
		} else {
			String photoStr = othe.getPhoto().substring(1,
					othe.getPhoto().length() - 1);
			Photo photo = (Photo) JSONObject.toBean(
					JSONObject.fromObject(photoStr), Photo.class);
			photo.getList().add(imgPath);
			newPhtoto = JSONArray.fromObject(photo).toString();
		}
		boolean flag = userService.updatePhoto(users_id, newPhtoto);
		int count = 0;
		String result = null;
		if (flag) {
			othe.setPhoto(newPhtoto);
			count = UserFactory.preInfoPerfect(unionUser);
			unionUser.setInfoPerfect(count);
			session.setAttribute("unionUserStr", JSONArray
					.fromObject(unionUser).toString());
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("path", imgPath);
			map.put("count", String.valueOf(count));
			result = JSONArray.fromObject(map).toString();

			// 文件复制
			FileUtils.copyInputStreamToFile(in, new File(servletPath));
			InputStream ins = new FileInputStream(servletPath);
			FileUtils.copyInputStreamToFile(ins, new File(DirPath));
		}
		return result;
	}

	// 删除相片
	@RemoteMethod
	public int deletePhoto(int users_id, String path) {
		HttpSession session = WebContextFactory.get().getSession();
		UnionUser unionUser = (UnionUser) session.getAttribute("unionUser");
		OtherInfoUser othe = unionUser.getOtherInfoUser();

		String photoStr = othe.getPhoto().substring(1,
				othe.getPhoto().length() - 1);
		Photo photo = (Photo) JSONObject.toBean(
				JSONObject.fromObject(photoStr), Photo.class);
		photo.getList().remove(path);

		String newPhtoto = JSONArray.fromObject(photo).toString();
		boolean flag = userService.updatePhoto(users_id, newPhtoto);
		int count = 0;
		if (flag) {
			othe.setPhoto(newPhtoto);
			count = UserFactory.preInfoPerfect(unionUser);
			unionUser.setInfoPerfect(count);
			session.setAttribute("unionUserStr", JSONArray
					.fromObject(unionUser).toString());
			new File("E:/MyEclipseWorkSpace/taomei/WebRoot/" + path).delete();
			new File(session.getServletContext().getRealPath("") + "/" + path)
					.delete();
		}
		return count;
	}

	// 更新用户资料
	@RemoteMethod
	public int updateInfo(String infoType, String infoStr) {
		boolean flag = false;
		int count = 0;
		UnionUser unionUser = null;
		HttpSession session = WebContextFactory.get().getSession();
		if (infoType.equals("base")) {
			BaseInfoUser info = (BaseInfoUser) JSONObject.toBean(
					JSONObject.fromObject(infoStr), BaseInfoUser.class);
			flag = userService.updateInfo(info, infoType, info.getUsers_id());
			if (flag) {
				unionUser = (UnionUser) session.getAttribute("unionUser");
				unionUser.setBaseInfoUser(info);
				count = UserFactory.preInfoPerfect(unionUser);
				unionUser.setInfoPerfect(count + 1);
				session.setAttribute("unionUserStr",
						JSONArray.fromObject(unionUser).toString());
			}
		} else if (infoType.equals("deta")) {
			DetailedInfoUser info = (DetailedInfoUser) JSONObject.toBean(
					JSONObject.fromObject(infoStr), DetailedInfoUser.class);
			flag = userService.updateInfo(info, infoType, info.getUsers_id());
			if (flag) {
				unionUser = (UnionUser) session.getAttribute("unionUser");
				unionUser.setDetailedInfoUser(info);
				count = UserFactory.preInfoPerfect(unionUser);
				unionUser.setInfoPerfect(count + 1);
				session.setAttribute("unionUserStr",
						JSONArray.fromObject(unionUser).toString());
			}
		} else {
			QualificationInfoUser info = (QualificationInfoUser) JSONObject
					.toBean(JSONObject.fromObject(infoStr),
							QualificationInfoUser.class);
			flag = userService.updateInfo(info, infoType, info.getUsers_id());
			if (flag) {
				unionUser = (UnionUser) session.getAttribute("unionUser");
				unionUser.setQualificationInfoUser(info);
				count = UserFactory.preInfoPerfect(unionUser);
				unionUser.setInfoPerfect(count + 1);
				session.setAttribute("unionUserStr",
						JSONArray.fromObject(unionUser).toString());
			}

		}

		return count + 1;
	}

	// 更新内心独白
	@RemoteMethod
	public int updateIntroduction(int users_id, String introduction) {
		boolean flag = userService.updateIntroduction(users_id, introduction);
		int count = 0;
		if (flag) {
			HttpSession session = WebContextFactory.get().getSession();
			UnionUser unionUser = (UnionUser) session.getAttribute("unionUser");
			unionUser.getDetailedInfoUser().setIntroduction(introduction);
			count = UserFactory.preInfoPerfect(unionUser);
			unionUser.setInfoPerfect(count);
			session.setAttribute("unionUserStr", JSONArray
					.fromObject(unionUser).toString());
		}
		return count;
	}

}
