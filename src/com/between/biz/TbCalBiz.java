package com.between.biz;

import java.util.List;

import com.between.dto.TbCalDto;
import com.between.dto.TbGroupDto;
import com.between.dto.TbUserDto;

public interface TbCalBiz {
	
	public List<TbCalDto> getCalList(String calTime, int groupNum);
	public TbCalDto selectOne(int calNum, int groupNum);
	public int insertEvent(TbCalDto dto);
	public int updateEvent(TbCalDto dto);
	public int deleteEvent(int calNum, int groupNum);
	public TbGroupDto findPartner(int groupNum);
	
	public void setTodates(String calTime);
	public String isTwo(String msg);
	public String fontColor(int date, int dayOfWeek);
	public String getCalView(int i, List<TbCalDto> clist);

}
