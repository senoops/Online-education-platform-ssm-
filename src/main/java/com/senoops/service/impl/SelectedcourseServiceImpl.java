package com.senoops.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.senoops.dao.SelectedcourseMapper;
import com.senoops.model.Course;
import com.senoops.model.Selectedcourse;
import com.senoops.model.User;
import com.senoops.service.SelectedcourseService;

@Service
public class SelectedcourseServiceImpl implements  SelectedcourseService {

	@Autowired
	private SelectedcourseMapper selectedcourseMapper;

	@Override
	public int save(Selectedcourse record) {
		int count = selectedcourseMapper.insert(record);// TODO Auto-generated method stub
		return count;
	}

	@Override
	public List<Selectedcourse> selectcourseById(Integer userid) {
		
		// TODO Auto-generated method stub
		return selectedcourseMapper.selectcourseById(userid);
	}

	@Override
	public int insertSelective(Selectedcourse record) {
		selectedcourseMapper.insertSelective(record);// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean delete(Selectedcourse record) {
		
		
	
		try {
			selectedcourseMapper.delete(record);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean selectedcourseIsExist(Selectedcourse record) {
		Selectedcourse selecetedcourse=selectedcourseMapper.selectSelective(record);
		
		if(selecetedcourse == null){
			return false;
		}else{
			return true;
		}
		
	}

	

	


}
