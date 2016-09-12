package com.xysoft.weixin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.xysoft.common.ElementConst;
import com.xysoft.dao.AttentionDao;
import com.xysoft.dao.ClassifyDao;
import com.xysoft.dao.HomeDao;
import com.xysoft.dao.ImageMesDao;
import com.xysoft.dao.SzhsjDao;
import com.xysoft.dao.TextMesDao;
import com.xysoft.dao.WxDao;
import com.xysoft.dao.WxUserDao;
import com.xysoft.entity.Attention;
import com.xysoft.entity.Classify;
import com.xysoft.entity.Home;
import com.xysoft.entity.ImageMes;
import com.xysoft.entity.TextMes;
import com.xysoft.entity.Wx;
import com.xysoft.entity.WxUser;
import com.xysoft.szhsj.pojo.RespMsg;
import com.xysoft.util.NullUtils;
import com.xysoft.weixin.pojo.AccessToken;
import com.xysoft.weixin.resp.Article;
import com.xysoft.weixin.resp.NewsMessage;
import com.xysoft.weixin.resp.TextMessage;
import com.xysoft.weixin.util.MessageUtil;
import com.xysoft.weixin.util.WeixinCacheUtil;
import com.xysoft.weixin.util.WeixinUtil;

@Component
public class WeiXinServiceImpl implements WeiXinService {
	@Resource
	private WxDao wxDao;
	@Resource
	private WxUserDao wxUserDao;
	@Resource
	private ClassifyDao classifyDao;
	@Resource
	private ImageMesDao imageMesDao;
	@Resource
	private TextMesDao textMesDao;
	@Resource
	private AttentionDao attentionDao;
	@Resource
	private HomeDao homeDao;
	@Resource
	private SzhsjDao szhsjDao;

	@Transactional
	public String returnRespMessage(String fromUserName, String toUserName,
			String msgType, Map<String, String> requestMap) {
		String respContent = "";
		
		//事件KEY值，与自定义菜单接口中KEY值对应
		String eventKey = requestMap.get("EventKey"); 
		// 事件类型  
        String eventType = requestMap.get("Event");  
        if (eventType == null) {
        	eventType = MessageUtil.REQ_MESSAGE_TYPE_EVENT;
        	msgType = MessageUtil.REQ_MESSAGE_TYPE_EVENT;
        }
        if(eventType.equals("VIEW")) {
        	return respContent;
        }
        if (eventKey == null) {
        	eventKey = requestMap.get("Content");  
        }
        Wx wx = this.wxDao.getWxByMarkcode(toUserName);
		// 关注  
        if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {  
        	if(wx != null &&NullUtils.isNotEmpty(wx.getAppId()) && NullUtils.isNotEmpty(wx.getAppSecret())) {
        		AccessToken accessToken = WeixinCacheUtil.getAccessToken(wx.getId(), wx.getAppId(), wx.getAppSecret());
        		if(accessToken != null) {
        			WxUser wxUser = WeixinUtil.getWxUser(accessToken.getToken(), fromUserName);
        			WxUser user = this.wxUserDao.getWxUserByOpenId(fromUserName);
        			if(user == null) {
        				user  = new WxUser();
        			}
        			BeanUtils.copyProperties(wxUser, user, new String[] {"id", "createDate", "wx"});
        			user.setWx(wx.getId());
        			String subscribe_time = null;
    				if(NullUtils.isNotEmpty(wxUser.getSubscribe_time())){
    					subscribe_time = String.format("%tF %<tT", Long.valueOf(wxUser.getSubscribe_time())*1000L);
    				}
    				user.setSubscribe_time(subscribe_time);
        			this.wxUserDao.saveOrUpdate(user);
        		}
        	}
        	
        	Attention attention = this.attentionDao.getAttention(wx.getId());
        	if (attention.getIsmarkcode()) {
        		eventType = MessageUtil.REQ_MESSAGE_TYPE_EVENT;
            	msgType = MessageUtil.REQ_MESSAGE_TYPE_EVENT;
            	eventKey = attention.getMarkcode();
        	} else {
        		TextMessage textMessage = new TextMessage();  
    	    	textMessage.setToUserName(fromUserName);  
    	    	textMessage.setFromUserName(toUserName);  
    	    	textMessage.setCreateTime(new Date().getTime());  
    	    	textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);  
    	    	textMessage.setFuncFlag(0);  
    	    	textMessage.setContent(attention.getContent()); 
    	    	respContent = MessageUtil.textMessageToXml(textMessage);
    	    	return respContent;
        	}
        }  
        // 取消关注  
        else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {  
        	WxUser wxUser = this.wxUserDao.getWxUserByOpenId(fromUserName);
        	if(wxUser != null) {
        		wxUser.setSubscribe("0");
        		this.wxUserDao.saveOrUpdate(wxUser);
        	}
            return "";
        }  
		
		if (wx == null) {
			TextMessage textMessage = new TextMessage();  
	    	textMessage.setToUserName(fromUserName);  
	    	textMessage.setFromUserName(toUserName);  
	    	textMessage.setCreateTime(new Date().getTime());  
	    	textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);  
	    	textMessage.setFuncFlag(0);  
	    	textMessage.setContent("微信号相关信息设置不正确，请联系客服！"); 
	    	respContent = MessageUtil.textMessageToXml(textMessage);
	    	return respContent;
		} else {
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				
                //1.匹配首页关键字
				Home home = this.homeDao.getHome(wx.getId());
	        	if (home != null && home.getMarkcode() != null &&home.getMarkcode().equals(eventKey)) {
	        		//创建图文消息  
	            	NewsMessage newsMessage = new NewsMessage();  
	            	newsMessage.setToUserName(fromUserName);  
	            	newsMessage.setFromUserName(toUserName);  
	            	newsMessage.setCreateTime(new Date().getTime());  
	            	newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
	            	newsMessage.setFuncFlag(0); 
	            	List<Article> articleList = new ArrayList<Article>();
	            	
					Article article = new Article();  
	            	article.setTitle(home.getName());  
	            	article.setDescription(home.getDescript());  
	            	if (home.getImg().startsWith("/")) {
	            		article.setPicUrl(ElementConst.Service_Address + home.getImg());  
	            	} else {
	            		article.setPicUrl(home.getImg());  
	            	}
	            	article.setUrl(ElementConst.Service_Address + "/index.jhtml?wx=" + wx.getId() + "&userid=" + fromUserName);  
	            	
	            	articleList.add(article);
					// 设置图文消息个数  
	            	newsMessage.setArticleCount(articleList.size());  
	            	//设置图文消息包含的图文集合  
	            	newsMessage.setArticles(articleList);  
	            	// 将图文消息对象转换成xml字符串  
	            	respContent = MessageUtil.newsMessageToXml(newsMessage);
	            	return respContent;
	        	}
	        	
	        	//2.匹配图文分类关键字
				List<Classify> classifys = this.classifyDao.getClassifyByMarkcode(wx.getId(), eventKey);
				if (classifys.size() > 0) {
					//创建图文消息  
	            	NewsMessage newsMessage = new NewsMessage();  
	            	newsMessage.setToUserName(fromUserName);  
	            	newsMessage.setFromUserName(toUserName);  
	            	newsMessage.setCreateTime(new Date().getTime());  
	            	newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
	            	newsMessage.setFuncFlag(0); 
	            	List<Article> articleList = new ArrayList<Article>();
	            	
					Classify classify = classifys.get(0);
					List<ImageMes> imageMess = this.imageMesDao.getImageMess(wx.getId(), 10, classify.getId()).getDatas();
					Article article = new Article();  
	            	article.setTitle(classify.getName());  
	            	article.setDescription(classify.getDescript());  
	            	if (classify.getImg().startsWith("/")) {
	            		article.setPicUrl(ElementConst.Service_Address + classify.getImg());  
	            	} else {
	            		article.setPicUrl(classify.getImg());  
	            	}
	            	if (NullUtils.isEmpty(classify.getUrl())) {
	            		article.setUrl(ElementConst.Service_Address + "/list.jhtml?classify=" + classify.getId() + "&userid=" + fromUserName);  
	            	} else {
	            		String url = null;
	            		if(classify.getUrl().indexOf("?") > 0) url = classify.getUrl() + "&openId=" + fromUserName;
	            		else url = classify.getUrl() + "?openId=" + fromUserName;
	            		article.setUrl(url);
	            	}
	            	articleList.add(article);
					if (imageMess.size() > 0) {
						for (ImageMes imageMes : imageMess) {
							Article art = new Article();  
							art.setTitle(imageMes.getName());  
							art.setDescription(imageMes.getDescript());  
							if (imageMes.getImg().startsWith("/")) {
								art.setPicUrl(ElementConst.Service_Address + imageMes.getSmallimg());  
			            	} else {
			            		art.setPicUrl(imageMes.getSmallimg());  
			            	}
							if (NullUtils.isEmpty(imageMes.getUrl())) {
								art.setUrl(ElementConst.Service_Address + "/detail.jhtml?imagemes=" + imageMes.getId() + "&userid=" + fromUserName + "&wxMarkcode=" + wx.getMarkcode());  
			            	} else {
			            		String url = null;
			            		if(imageMes.getUrl().indexOf("?") > 0) url = imageMes.getUrl() + "&openId=" + fromUserName;
			            		else url = imageMes.getUrl() + "?openId=" + fromUserName;
			            		art.setUrl(url);
			            	} 
			            	articleList.add(art);
						}
					}
					// 设置图文消息个数  
	            	newsMessage.setArticleCount(articleList.size());  
	            	//设置图文消息包含的图文集合  
	            	newsMessage.setArticles(articleList);  
	            	// 将图文消息对象转换成xml字符串  
	            	respContent = MessageUtil.newsMessageToXml(newsMessage);
	            	return respContent;
				}
				
				//3.匹配多个图文关键字
				List<ImageMes> imageMess = this.imageMesDao.getImageMessByMarkcode(wx.getId(), 10, eventKey).getDatas();
				if (imageMess.size() > 0) {
					//创建图文消息  
	            	NewsMessage newsMessage = new NewsMessage();  
	            	newsMessage.setToUserName(fromUserName);  
	            	newsMessage.setFromUserName(toUserName);  
	            	newsMessage.setCreateTime(new Date().getTime());  
	            	newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
	            	newsMessage.setFuncFlag(0); 
	            	List<Article> articleList = new ArrayList<Article>();
	            	
	            	String imgPath = "";
	            	for (ImageMes imageMes : imageMess) {
	            		Article art = new Article();  
						art.setTitle(imageMes.getName());  
						art.setDescription(imageMes.getDescript());  
						
						if (articleList.size() > 1) {
							imgPath = imageMes.getSmallimg();
						} else {
							imgPath = imageMes.getImg();
						}
						if (imageMes.getImg().startsWith("/")) {
							art.setPicUrl(ElementConst.Service_Address + imgPath);  
		            	} else {
		            		art.setPicUrl(imgPath);  
		            	}
						if (NullUtils.isEmpty(imageMes.getUrl())) {
							art.setUrl(ElementConst.Service_Address + "/detail.jhtml?imagemes=" + imageMes.getId() + "&userid=" + fromUserName + "&wxMarkcode=" + wx.getMarkcode());  
		            	} else {
		            		String url = null;
		            		if(imageMes.getUrl().indexOf("?") > 0) url = imageMes.getUrl() + "&openId=" + fromUserName;
		            		else url = imageMes.getUrl() + "?openId=" + fromUserName;
		            		art.setUrl(url);
		            	} 
		            	articleList.add(art);
	            	}
	            	
	            	// 设置图文消息个数  
	            	newsMessage.setArticleCount(articleList.size());  
	            	//设置图文消息包含的图文集合  
	            	newsMessage.setArticles(articleList);  
	            	// 将图文消息对象转换成xml字符串  
	            	respContent = MessageUtil.newsMessageToXml(newsMessage);
	            	return respContent;
				}
				
				//4.匹配文本回复关键字
				List<TextMes> textMess = this.textMesDao.getTextMess(wx.getId(), eventKey);
				if (textMess.size() > 0) {
					TextMessage textMessage = new TextMessage();  
			    	textMessage.setToUserName(fromUserName);  
			    	textMessage.setFromUserName(toUserName);  
			    	textMessage.setCreateTime(new Date().getTime());  
			    	textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);  
			    	textMessage.setFuncFlag(0);  
			    	textMessage.setContent(textMess.get(0).getContent()); 
			    	respContent = MessageUtil.textMessageToXml(textMessage);
			    	return respContent;
				}
				
				//5.匹配关注回复关键字
				Attention attention = this.attentionDao.getAttentionByMarkcode(wx.getId(), eventKey);
				if(attention != null && attention.getIsmarkcode()){
	        		TextMessage textMessage = new TextMessage();  
	    	    	textMessage.setToUserName(fromUserName);  
	    	    	textMessage.setFromUserName(toUserName);  
	    	    	textMessage.setCreateTime(new Date().getTime());  
	    	    	textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);  
	    	    	textMessage.setFuncFlag(0);  
	    	    	textMessage.setContent(attention.getContent()); 
	    	    	respContent = MessageUtil.textMessageToXml(textMessage);
	    	    	return respContent;
				}
				
				//6.调用深海一问一答接口,没有跟公众号关联
				List<RespMsg> respMsgs = this.szhsjDao.getQueryList(eventKey, 5);
				if(respMsgs.size() > 0) {
					//创建图文消息  
	            	NewsMessage newsMessage = new NewsMessage();  
	            	newsMessage.setToUserName(fromUserName);  
	            	newsMessage.setFromUserName(toUserName);  
	            	newsMessage.setCreateTime(new Date().getTime());  
	            	newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
	            	newsMessage.setFuncFlag(0); 
	            	List<Article> articleList = new ArrayList<Article>();
	            	
	            	Article article = new Article();
	            	article.setTitle("如下述没有您需要的信息，点击进入我要咨询");
	            	article.setPicUrl(ElementConst.Service_Address + "/resource/common/image/2015/12/14/service.jpg");
	            	article.setUrl(ElementConst.Szhsj_Host+"/Interaction/AdvisorySubmit.html?openId=" + fromUserName);
	            	articleList.add(article);
	            	for (RespMsg respMsg : respMsgs) {
	            		Article art = new Article();  
						art.setTitle(respMsg.getTitle());  
						art.setDescription(respMsg.getQuestion()); 
						//
						art.setPicUrl(ElementConst.Service_Address + "/resource/common/image/2015/12/14/logo.png");
						art.setUrl(ElementConst.Szhsj_Host+"/Interaction/AdvisoryInfoDetail.html?Id="+respMsg.getID());
						
						articleList.add(art);
					}
	            	
	            	// 设置图文消息个数  
	            	newsMessage.setArticleCount(articleList.size());  
	            	//设置图文消息包含的图文集合  
	            	newsMessage.setArticles(articleList);  
	            	// 将图文消息对象转换成xml字符串  
	            	respContent = MessageUtil.newsMessageToXml(newsMessage);
	            	return respContent;
				}else {
					//创建图文消息  
	            	NewsMessage newsMessage = new NewsMessage();  
	            	newsMessage.setToUserName(fromUserName);  
	            	newsMessage.setFromUserName(toUserName);  
	            	newsMessage.setCreateTime(new Date().getTime());  
	            	newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
	            	newsMessage.setFuncFlag(0); 
	            	List<Article> articleList = new ArrayList<Article>();
	            	
	            	Article article = new Article();
	            	article.setTitle("非常抱歉，没有找到您要的内容，点击进入我要咨询");
	            	article.setPicUrl(ElementConst.Service_Address + "/resource/common/image/2015/12/14/service.jpg");
	            	article.setUrl(ElementConst.Szhsj_Host+"/Interaction/AdvisorySubmit.html?openId=" + fromUserName);
	            	articleList.add(article);
	            	
	            	// 设置图文消息个数  
	            	newsMessage.setArticleCount(articleList.size());  
	            	//设置图文消息包含的图文集合  
	            	newsMessage.setArticles(articleList);  
	            	// 将图文消息对象转换成xml字符串  
	            	respContent = MessageUtil.newsMessageToXml(newsMessage);
	            	return respContent;
				}
				
			}//结束
			
		}
		 
		return respContent;  
	}

}
