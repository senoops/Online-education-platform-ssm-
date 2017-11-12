package com.senoops.model;

public class Selectedcourse {
    private Integer courseid;

    private Integer userid;

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
    @Override
	public String toString() {
		return "course [courseid:" + courseid + " userid:" + userid + "]";
	}
}