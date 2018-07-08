package com.example.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@DiscriminatorValue("Student")
public class Student extends User {

	@ManyToOne
	private Course course;
	@ManyToOne
	private Department department;
	@ManyToMany
//	( fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Lesson> lessons = new HashSet<>();

	public Student() {
		super();
	}

	public Student(String userName, String password, String name, String surName, String type, Date birthday) {
		super(userName, password, name, surName, type, birthday);

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

	public Set<Lesson> getLessons() {
		return lessons;
	}

	public void setLessons(Set<Lesson> lessons) {
		this.lessons = lessons;
	}
	public void Addlessons(Lesson n){
		lessons.add(n);
	}

}
