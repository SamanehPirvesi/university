package com.example.service;

import java.util.List;

import com.example.dao.CourseDao;
import com.example.model.Course;
import com.example.model.Lesson;

public class CourseService {
	CourseDao cdao = new CourseDao();

	public boolean createCourse(Course c) {
		return cdao.createCourse(c);
	}

	public Course getCourseById(long id) {
		return cdao.getCourseById(id);
	}

	public boolean updateCourse(Course c) {
		return cdao.updateCourse(c);
	}

	public boolean deleteCourse(Course c) {
		return cdao.deleteCourse(c);
	}

	public List<Lesson> getListOfLessonForCourse(long id) {
		return cdao.getListOfLessonForCourse(id);
	}
	public List<Course> getListOfAllCourses(){
		return cdao.getAllCourses();
	}
	public Course getCoursementByName(String courseName) {
		return cdao.getCoursementByName(courseName);

	}
}
