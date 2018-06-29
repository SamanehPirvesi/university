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
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class Lesson {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long lessonId;
	@NotNull(message = "lesson name cannot be null")
	@NotBlank()
	private String lessonName;
	@NotNull(message = "credit cannot be null")
	@NotBlank()
	private int credit;
	@ManyToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private List<Course> courses=new ArrayList<>();

	public Lesson() {
	}

	public Lesson( String lessonName, int credit) {
		this.lessonName = lessonName;
		this.credit = credit;
	}

	public long getLessonId() {
		return lessonId;
	}

	public void setLessonId(long lessonId) {
		this.lessonId = lessonId;
	}

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	public void addCourses(Course c) {
		courses.add(c);
	}

}
