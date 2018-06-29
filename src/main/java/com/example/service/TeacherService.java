package com.example.service;

import com.example.dao.TeacherDao;

public class TeacherService {
	TeacherDao tdao = new TeacherDao();

	public boolean updateTeacherSalaryById(long teacherId, double salary) {
		return tdao.updateTeacherSalaryById(teacherId, salary);
	}
}
