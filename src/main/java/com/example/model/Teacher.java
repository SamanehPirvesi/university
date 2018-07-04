package com.example.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;

@Entity
@DiscriminatorValue("Teacher")
public class Teacher extends User {
	@NotNull(message = "salary cannot be null")
	private double salary;
	@ManyToMany
	private Set<Course> courses = new HashSet<>();
	@ManyToMany
	private Set<Department> departments = new HashSet<>();

	public Teacher() {

	}

	public Teacher(String userName, String password,String name, String surName, String type, Date birthday, double salary) {
		super(userName, password,name,surName, type, birthday);
		this.salary = salary;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}

	public Set<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(Set<Department> departments) {
		this.departments = departments;
	}

	public void addDepartmet(Department d) {
		departments.add(d);
	}

public void addCourses(Course c){
		courses.add(c);
	}
}
