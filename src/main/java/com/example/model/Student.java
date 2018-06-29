package com.example.model;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("Student")
public class Student extends User {
	
	@ManyToOne
	private Course course;
	@ManyToOne
	private Department department;

	public Student() {
		
	}

	public Student( String userName, String password,String name, String surName, String type, Date birthday) {
		super(userName, password,name , surName, type, birthday);
		
	}

	
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	
}
