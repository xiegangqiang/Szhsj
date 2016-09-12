package com.xysoft.tag;

import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;

import com.xysoft.entity.ImageMes;
import com.xysoft.tag.param.ImageMesParam;
import com.xysoft.tag.service.ImageMesTagService;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@SuppressWarnings({"unchecked", "rawtypes"})
public class ImageMesTag implements TemplateDirectiveModel {
	@Resource
	private ImageMesTagService imageMesTagService;

	@Override
	public void execute(Environment env, Map param, TemplateModel[] model,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		try {
			ImageMesParam params = new ImageMesParam(param);
			ImageMes res = this.imageMesTagService.getImageMes(params.getImagemes(), params.getTag());
			env.setVariable("res", DEFAULT_WRAPPER.wrap(res));
			body.render(env.getOut());
		} catch (Exception e) {
			e.printStackTrace();
			env.getOut().write("标签使用错误...");
		}
	}

}
