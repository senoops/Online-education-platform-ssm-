package com.senoops.service;

import java.util.List;

import com.senoops.model.Selectedcourse;


public interface SelectedcourseService {
	   int save(Selectedcourse record);
	    List<Selectedcourse> selectcourseById(Integer userid);
	   boolean delete(Selectedcourse record);
	   boolean selectedcourseIsExist(Selectedcourse record);
	    int insertSelective(Selectedcourse record);
}
