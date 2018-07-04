package com.example.service;

import java.util.List;

import com.example.dao.LessonDao;
import com.example.model.Course;
import com.example.model.Lesson;

public class LessonService {
	LessonDao ldao = new LessonDao();

	public boolean createLesson(Lesson l) {
		return ldao.createLesson(l);
	}

	public Lesson getLessonById(long id) {
		return ldao.getLessonById(id);
	}

	public boolean updateLesson(Lesson l) {
		return ldao.updateLesson(l);
	}

	public boolean updateUserById(long id, String name) {
		return ldao.updateUserById(id, name);
	}

	public boolean deleteLesson(Lesson l) {
		return ldao.deleteLesson(l);
	}
	public List<Lesson> getAllLessons() {
		return ldao.getAllLessones();
	}
	public Lesson getlessonByName(String name) {
		return ldao.getlessonByName(name);

		
	}
	public List<Course> getListOfCoursesForLesson(long id) {
		return ldao.getListOfCoursesForLesson(id);
	}


}
