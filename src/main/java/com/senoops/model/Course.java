package com.senoops.model;

public class Course {
    private Integer courseid;

    private String coursename;

    private String coursedetail;

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename == null ? null : coursename.trim();
    }

    public String getCoursedetail() {
        return coursedetail;
    }

    public void setCoursedetail(String coursedetail) {
        this.coursedetail = coursedetail == null ? null : coursedetail.trim();
    }
    @Override
	public String toString() {
		return "course [courseid:" + courseid + ",name:" + coursename + ",detail:" +coursedetail + "]";
	}
}