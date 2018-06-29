package com.example.service;

import com.example.dao.StudentDao;

public class StudentService {
	StudentDao sdao=new StudentDao();
	public boolean updateStudentCourseById(long StudentId , long CourseId) {
	return sdao.updateStudentCourseById(StudentId, CourseId);	
	}

}
