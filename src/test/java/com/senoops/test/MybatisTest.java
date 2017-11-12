package com.senoops.test;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.senoops.dao.CourseMapper;
import com.senoops.dao.SelectedcourseMapper;
import com.senoops.dao.UserDao;
import com.senoops.model.Selectedcourse;





@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MybatisTest {

	@Autowired
	
	private CourseMapper courseMapper;
	@Autowired
	private UserDao user;
	@Autowired
	private SelectedcourseMapper s;
	@Test
	public void testlistall() {
		System.out.println(courseMapper);
		System.out.println(user);
		System.out.println(courseMapper.selectAll());
		Selectedcourse set=new Selectedcourse();
		set.setUserid(5);set.setCourseid(5);
		
		System.out.println(s.insert(set));
		
		
		
	
		
	}



}
