package com.example.service;

import java.util.List;

import com.example.dao.StudentDao;
import com.example.model.Lesson;
import com.example.model.Student;

public class StudentService {
	StudentDao sdao = new StudentDao();

	public boolean createStudent(Student s) {
		return sdao.createStudent(s);
	}

	public boolean updateStudentCourseById(long StudentId, long CourseId) {
		return sdao.updateStudentCourseById(StudentId, CourseId);
	}
	public List<Student> getListOfAllStudents() {
		return sdao.getListOfAllStudents();
	}
	public Student getStudentById(long id) {
		return sdao.getStudentById(id);
	}
	public boolean updateStudent(Student s) {
		return sdao.updateStudent(s)	;
	}
	public boolean deleteStudent(Student s) {
		return sdao.deleteStudent(s);
	}
	public List<Lesson> getListOfLessonForStudent(long id) {
		return sdao.getListOfLessonForStudent(id);
	
	}
}
