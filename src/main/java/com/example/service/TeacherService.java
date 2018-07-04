package com.example.service;

import java.util.List;

import com.example.dao.TeacherDao;
import com.example.model.Course;
import com.example.model.Department;
import com.example.model.Teacher;

public class TeacherService {
	TeacherDao tdao = new TeacherDao();

	public boolean createTeacher(Teacher t) {
		return tdao.createTeacher(t);
	}
	public List<Teacher> getListOfAllTeachers() {
		return tdao.getListOfAllTeachers();
	}
	public Teacher getTeacherById(long id) {
		return tdao.getTeacherById(id);
	}
	public boolean updateTeacher(Teacher t) {
		return tdao.updateTeacher(t);
	}
	public boolean deleteTeacher(Teacher t) {
		return tdao.deleteTeacher(t);
	}
	public List<Course> getListOfCoursesForTeacher(long id) {
		return tdao.getListOfCoursesForTeacher(id);
		
	}
	public List<Department> getListOfDepartmentForTeacher(long id) {
		return tdao.getListOfDepartmentForTeacher(id);
	}
}
