package com.xysoft.admin.service;

import com.xysoft.support.PageParam;

public interface MemberCardSignService {

	String getMemberCardSigns(PageParam page, String cardNum, String memberid, String start, String end);

}
