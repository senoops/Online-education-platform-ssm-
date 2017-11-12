package com.senoops.dao;

import java.util.List;

import com.senoops.model.Selectedcourse;

public interface SelectedcourseMapper{
    int insert(Selectedcourse record);
    List<Selectedcourse> selectcourseById(Integer userid);
    Selectedcourse selectSelective(Selectedcourse record);
    void delete(Selectedcourse record);
    int insertSelective(Selectedcourse record);
}