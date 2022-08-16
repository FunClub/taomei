package yucheng.taomei.factory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import yucheng.taomei.vo.email.ContentEmail;
import net.sf.json.JSONObject;



public class UTILFactory {
	
	//获得未读私信的数量
	//public static int = 
	

	// 获得私信距现在多久的时间
	public static String getEmailTime(String email) {
		Date emailTime = null;
		Date nowTime = null;
		try {
			emailTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.parse(email);
			nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.parse(getSimpleTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int second = (int) ((nowTime.getTime() - emailTime.getTime()) / 1000);
		int minutes = second / 60;
		int hours = minutes / 60;
		int days = hours / 24;
		int months = days / 30;
		int years = days / 365;
		if (minutes == 0) {
			return second + "秒";
		} else if (hours == 0) {
			return minutes + "分钟";
		} else if (days == 0) {
			return hours + "小时";
		} else if (months == 0) {
			return days + "天";
		} else if (years == 0) {
			return months + "个月";
		} else {
			return years + "年";
		}

	}

	public static String getSimpleTime() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date);
	}
	public static String getHMTime() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		return format.format(date);
	}
	public static String getYMDTime() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		return format.format(date);
	}

	public static String getFileTime() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		return format.format(date);
	}
	public static void main(String[] args) {
		
	}
}
