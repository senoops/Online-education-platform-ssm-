package com.senoops.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senoops.dao.CourseMapper;
import com.senoops.model.Course;
import com.senoops.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseMapper courseMapper;

	@Override
	public Course selectByPrimaryKey(Integer courseid) {
		Course course = courseMapper.selectByPrimaryKey(courseid);
		return course;
	}

	@Override
	public int deleteByPrimaryKey(Integer courseid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Course record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Course record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Course record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Course record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Course> selectAll() {
		return courseMapper.selectAll();
	}

}
