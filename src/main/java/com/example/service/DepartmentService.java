package com.example.service;

import java.util.List;

import com.example.dao.DepartmentDao;
import com.example.model.Course;
import com.example.model.Department;
import com.example.model.Student;
import com.example.model.Teacher;

public class DepartmentService {
	DepartmentDao dDao = new DepartmentDao();

	public boolean createDepartment(Department d) {
		return dDao.createDepartment(d);
	}

	public Department getDepartmentById(long id) {
		return dDao.getDepartmentById(id);
	}

	public boolean updateDepartment(Department d) {
		return dDao.updateDepartment(d);
	}

	public boolean deleteDepartment(Department d) {
		return dDao.deleteDepartment(d);
	}

	public List<Course> getListOfCourseForDepartment(long id) {
		return dDao.getListOfCourseForDepartment(id);
	}

	public List<Student> getListOfStudentForDepartment(long id) {
		return dDao.getListOfStudentForDepartment(id);
	}

	public List<Teacher> getListOfTeacherForDepartment(long id) {
		return dDao.getListOfTeacherForDepartment(id);
	}
	public List<Department> getListAllDepartments() {
		return dDao.getAllDepartments();
	
	}
	public Department getDeaprtmentByName(String departmentName) {
		return dDao.getDeaprtmentByName(departmentName);
	}

}
