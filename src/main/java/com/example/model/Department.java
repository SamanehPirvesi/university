package com.example.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class Department {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long departmentId;
	@NotNull(message = "Department name cannot be null")
	@NotBlank()
	private String departmentName;
	@OneToMany(mappedBy="department",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	List<Course> courses = new ArrayList<>();
	@OneToMany(mappedBy="department",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	 List<Student> students = new ArrayList<>();
	@ManyToMany(mappedBy="departments",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	 List<Teacher> teachers = new ArrayList<>();
	@ManyToOne
	University university;

	public Department() {

	}

	public Department(String departmentName) {

		this.departmentName = departmentName;
	}

	public long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(long departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public List<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}
	

	public University getUniversity() {
		return university;
	}

	public void setUniversity(University university) {
		this.university = university;
	}

	public void addCourse(Course c) {
		courses.add(c);
	}

	public void addStudent(Student s) {
		students.add(s);
	}

	public void addTeacher(Teacher t) {
		teachers.add(t);
	}
}
