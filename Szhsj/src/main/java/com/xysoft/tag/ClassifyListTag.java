package com.xysoft.tag;

import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.xysoft.entity.Classify;
import com.xysoft.tag.param.ClassifyListParam;
import com.xysoft.tag.service.ClassifyTagService;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@SuppressWarnings({"unchecked", "rawtypes"})
public class ClassifyListTag implements TemplateDirectiveModel {
	@Resource
	private ClassifyTagService classifyTagService;

	@Override
	public void execute(Environment env, Map param, TemplateModel[] model,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		try {
			ClassifyListParam params = new ClassifyListParam(param);
			List<Classify> res = this.classifyTagService.getClassifys(params.getWx());
			env.setVariable("res", DEFAULT_WRAPPER.wrap(res));
			body.render(env.getOut());
		} catch (Exception e) {
			e.printStackTrace();
			env.getOut().write("标签使用错误...");
		}
	}

}
