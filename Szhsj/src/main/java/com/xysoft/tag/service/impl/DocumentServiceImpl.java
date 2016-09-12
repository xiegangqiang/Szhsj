package com.xysoft.tag.service.impl;

import net.sf.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.xysoft.szhsj.pojo.Document;
import com.xysoft.szhsj.webservice.BenBusService;
import com.xysoft.szhsj.webservice.BenBusService_Service;
import com.xysoft.tag.service.DocumentService;

@SuppressWarnings({"static-access"})
@Component
public class DocumentServiceImpl implements DocumentService{

	@Transactional(readOnly = true)
	public Document getDocument(String businessCode, String id) {
		BenBusService_Service benBusService_Service = new BenBusService_Service();
		BenBusService benBusService = benBusService_Service.getBenBusServicePort();
		String result = benBusService.getData(businessCode, "{\"SQDZJ\":\"" + id + "\"}");
		JSONObject jsonObject = JSONObject.fromObject(result);
		Document document = (Document) jsonObject.toBean(jsonObject, Document.class);
		return document;
	}

}
