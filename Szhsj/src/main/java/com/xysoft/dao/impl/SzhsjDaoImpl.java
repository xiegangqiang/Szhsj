package com.xysoft.dao.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.xysoft.common.ElementConst;
import com.xysoft.dao.SzhsjDao;
import com.xysoft.entity.ImageMes;
import com.xysoft.szhsj.pojo.Accessory;
import com.xysoft.szhsj.pojo.RespMsg;
import com.xysoft.util.NullUtils;
@Component("szhsjdao")
@SuppressWarnings("static-access")
public class SzhsjDaoImpl implements SzhsjDao{
	
	private static Logger log = LoggerFactory.getLogger(SzhsjDaoImpl.class);  

    /** 
     * 发起http请求并获取结果 
     *  
     * @param requestUrl 请求地址 
     * @param requestMethod 请求方式（GET、POST） 
     * @param outputStr 提交的数据 
     * @return json字符串
     */  
    public static String  httpRequest(String requestUrl, String requestMethod, String outputStr) {  
        StringBuffer buffer = new StringBuffer();  
        try {  
  
            URL url = new URL(requestUrl);  
            HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();  
  
            httpUrlConn.setDoOutput(true);  
            httpUrlConn.setDoInput(true);  
            httpUrlConn.setUseCaches(false);  
            httpUrlConn.setRequestProperty("content-type", "application/x-www-form-urlencoded;charset=UTF-8");
            // 设置请求方式（GET/POST）  
            httpUrlConn.setRequestMethod(requestMethod);  
  
            if ("GET".equalsIgnoreCase(requestMethod))  
                httpUrlConn.connect();  
  
            // 当有数据需要提交时  
            if (null != outputStr) {  
                OutputStream outputStream = httpUrlConn.getOutputStream();  
                // 注意编码格式，防止中文乱码  
                outputStream.write(outputStr.getBytes("UTF-8"));  
                outputStream.close();  
            }  
  
            // 将返回的输入流转换成字符串  
            InputStream inputStream = httpUrlConn.getInputStream();  
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");  
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  
  
            String str = null;  
            while ((str = bufferedReader.readLine()) != null) {  
                buffer.append(str);  
            }  
            bufferedReader.close();  
            inputStreamReader.close();  
            // 释放资源  
            inputStream.close();  
            inputStream = null;  
            httpUrlConn.disconnect();  
            
        } catch (ConnectException ce) {  
            log.error("Weixin server connection timed out.");  
        } catch (Exception e) {  
        	e.printStackTrace();
            log.error("https request error:{}", e);  
        }  
        return buffer.toString();  
    } 
    
    private static String subStringResult (String source){
    	String json = null;
    	if(NullUtils.isNotEmpty(source)) {
    		source.replace("\\r", "</br>").replace("\\n", "").replace("\\t", "	");
    		json = source.substring(1, source.length()-1).replace("\\", "").replace("\\\\\\", "");
    	}
		return json;
    }
    
    //根据关键字获取深海提供的一问一答接口返回的内容
	private static String qeryList_url = ElementConst.Szhsj_Interface+"/service/WeChat/Smart/List/query/EVENKEY/size/SIZE";
	
	public List<RespMsg> getQueryList (String eventKey, Integer size) {
		String url = qeryList_url.replace("EVENKEY", eventKey).replace("SIZE", size.toString());  
		String result = httpRequest(url, "GET", null);
		//System.out.println(result.substring(1, result.length()-1).replace("\\", ""));
		JSONArray jsonArray = JSONArray.fromObject(subStringResult(result));
		List<RespMsg> respMsgs = new ArrayList<RespMsg>();
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject =  (JSONObject) jsonArray.get(i);
			RespMsg respmsg = (RespMsg) jsonObject.toBean(jsonObject, RespMsg.class);
			respmsg.setTitle(jsonObject.getString("Title"));
			respmsg.setQuestion(jsonObject.getString("Question"));
			respmsg.setResponse(jsonObject.getString("Response"));
			respMsgs.add(respmsg);
		}
		return respMsgs;
	}
	
	//根据ID获取深海提供的信息内容接口返回的内容
	private static String MSAInfo_url = ElementConst.Szhsj_Interface+"/service/WeChat/MSAInfo/Content/get/ID";
	//根据ID获取深海提供的信息文章接口返回的内容
	private static String ArticleContent_url = ElementConst.Szhsj_Interface+"/service/WeChat/ArticleContent2/get/ID";
	
	public ImageMes getImageMes(Integer tag, String id){
		String url = null;
		String result = null;
		ImageMes imageMes = null;
		switch (tag) {
		case 0:
			url = MSAInfo_url.replace("ID", id);
			result = httpRequest(url, "GET", null);
			if(NullUtils.isNotEmpty(result)){
				imageMes = new ImageMes();
				JSONObject jsonMSAInfo = JSONObject.fromObject(result);
			    imageMes.setId(jsonMSAInfo.getString("InfoId"));
			    imageMes.setName(jsonMSAInfo.getString("InfoTitle"));
			    imageMes.setContent(jsonMSAInfo.getString("Content"));
			    String publishDate = jsonMSAInfo.getString("PublishDate");
			    Long date = Long.valueOf( publishDate.substring(publishDate.indexOf("(")+1, publishDate.indexOf(")")) );
			    imageMes.setCreateDate(new Date(date));
			    imageMes.setDescript(jsonMSAInfo.getString("InfoSource"));
			}
			break;
		case 1:
			url = ArticleContent_url.replace("ID", id);
			result = httpRequest(url, "GET", null);
			if(NullUtils.isNotEmpty(result)) {
				imageMes = new ImageMes();
				JSONObject jsonArticle = JSONObject.fromObject(result);
				imageMes.setId(jsonArticle.getString("ArticleContent"));
				imageMes.setName(jsonArticle.getString("Title"));
				imageMes.setContent(jsonArticle.getString("Content"));
				String datetime = jsonArticle.getString("Datetime");
				Long dates = Long.valueOf( datetime.substring(datetime.indexOf("(")+1, datetime.indexOf(")")) );
				imageMes.setCreateDate(new Date(dates));
				imageMes.setDescript(jsonArticle.getString("Origin"));
			}
			break;
		}
		return imageMes;
	}
	
	//根据上面接口的ID获取附件列表(AccessoryType字段：1表示图片，2和100表示文档附件，10表示视频)
	private static String File_url = ElementConst.Szhsj_Interface+"/service/WeChat/File/List/get/FID";
	
	public List<Accessory> getAccessorys(String fid){
		String url = File_url.replace("FID", fid);
		String result = httpRequest(url, "GET", null);
		JSONArray jsonArray = JSONArray.fromObject(subStringResult(result));
		List<Accessory> files = new ArrayList<Accessory>();
		for (int i = 0; i < jsonArray.size(); i++) {
			Accessory file = new Accessory();
			JSONObject jsonObject =  (JSONObject) jsonArray.get(i);
			file.setAccessoryid(jsonObject.getString("accessoryid"));
			file.setPath(jsonObject.getString("AccessoryPath"));
			file.setFid(jsonObject.getString("fid"));
			file.setName(jsonObject.getString("AccessoryName"));
			file.setSuffix(jsonObject.getString("AccessorySuffix"));
			file.setType(jsonObject.getInt("AccessoryType"));
			files.add(file);
		}
		return files;
	}
	
	
}
