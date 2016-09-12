package com.xysoft.tag;

import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

import java.io.IOException;
import java.util.Map;
import javax.annotation.Resource;
import com.xysoft.szhsj.pojo.Document;
import com.xysoft.tag.param.DocumentParam;
import com.xysoft.tag.service.DocumentService;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
@SuppressWarnings({"unchecked", "rawtypes"})
public class DocumentTag implements TemplateDirectiveModel{
	
	@Resource
	private DocumentService documentTagService;

	@Override
	public void execute(Environment env, Map param, TemplateModel[] model,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		try {
			DocumentParam params = new DocumentParam(param);
			Document res = this.documentTagService.getDocument(params.getBusinessCode(), params.getId());
			env.setVariable("res", DEFAULT_WRAPPER.wrap(res));
			body.render(env.getOut());
		} catch (Exception e) {
			e.printStackTrace();
			env.getOut().write("标签使用错误...");
		}
		
	}

	
	

}
