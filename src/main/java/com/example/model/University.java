package com.example.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class University {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long universityId;
	@NotNull(message = "University name cannot be null")
	@NotBlank()
	private String universityName;
	@OneToMany(mappedBy="university",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private List<Department> departments=new ArrayList<>();
	public University() {
		
	}
	public University(String universityName) {
		
		this.universityName = universityName;
	}
	public long getUniversityId() {
		return universityId;
	}
	public void setUniversityId(long universityId) {
		this.universityId = universityId;
	}
	public String getUniversityName() {
		return universityName;
	}
	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}
	public List<Department> getDepartments() {
		return departments;
	}
	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}
public void addDepartment(Department d) {
	departments.add(d);
}
}
