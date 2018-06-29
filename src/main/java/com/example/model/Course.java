package com.example.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
public class Course {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long courseId;
	@NotNull(message = "course name cannot be null")
	@NotBlank()
	private String courseName;
	@NotNull(message = "credit cannot be null")
	@NotBlank()
	private int credit;
	@OneToMany(mappedBy = "course", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Student> students = new ArrayList<>();
	@ManyToMany(mappedBy = "courses", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<Teacher> teachers = new HashSet<>();
	@ManyToMany(mappedBy = "courses", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Lesson> lessons = new ArrayList<>();
	@ManyToOne
	private Department department;

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Course() {

	}

	public Course(String courseName, int credit) {
		this.courseName = courseName;
		this.credit = credit;
	}

	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public List<Lesson> getLessons() {
		return lessons;
	}

	public void setLessons(List<Lesson> lessons) {
		this.lessons = lessons;
	}

	public Set<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}

	public void addStudent(Student s) {
		students.add(s);
	}

	public void addLessons(Lesson l) {
		lessons.add(l);
	}

	public void addTeacher(Teacher t) {
		teachers.add(t);
	}

}
