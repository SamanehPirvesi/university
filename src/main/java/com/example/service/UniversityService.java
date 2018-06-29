package com.example.service;

import java.util.List;

import com.example.dao.UniversityDao;
import com.example.model.Department;
import com.example.model.University;

public class UniversityService {
	UniversityDao uniDao = new UniversityDao();

	public boolean createUniversity(University u) {
		return uniDao.createUniversity(u);
	}

	public University getUniversityById(long id) {
		return uniDao.getUniversityById(id);
	}

	public boolean updateUniversity(University u) {
		return uniDao.updateUniversity(u);
	}

	public boolean deleteUniversity(University u) {
		return uniDao.deleteUniversity(u);
	}

	public List<Department> getListOfDepartmentForCourse(long id) {
		return uniDao.getListOfDepartmentForCourse(id);
	}
}
