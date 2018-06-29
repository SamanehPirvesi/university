package com.example.service;

import com.example.dao.LessonDao;
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

}
