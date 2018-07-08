package com.example.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;

import com.example.model.Course;
import com.example.model.Department;
import com.example.model.Teacher;
import com.example.utility.HibernateUtil;

public class TeacherDao {
	public boolean createTeacher(Teacher t) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.persist(t);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();

		} finally {
			session.close();
		}
		return res;
	}
	
	public List<Teacher> getListOfAllTeachers() {
		List<Teacher> list = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query<Teacher> query = session.createQuery("from Teacher ", Teacher.class);
			list = query.getResultList();
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return list;
	}
	public List<Course> getListOfCoursesForTeacher(long id) {
		List<Course> list = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createNativeQuery("Select * From Course c, Teacher_Course CT where c.courseId = CT.courses_courseId And CT.teachers_userId=:teacherid").addEntity(Course.class);
			query.setParameter("teacherid", id);
			 list =  query.getResultList();
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return list;
	}
	public List<Department> getListOfDepartmentForTeacher(long id) {
		List<Department> list = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createNativeQuery("Select * From Department d, Teacher_Department TD where d.departmentId = TD.departments_departmentId And TD.teachers_userId=:teacherid").addEntity(Department.class);
			query.setParameter("teacherid", id);
			 list =  query.getResultList();
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return list;
	}
	public boolean DeleteDepartmentFromDepartmentListForTeacher(long departmentId,long teacherId ) {
		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createNativeQuery("DELETE FROM Teacher_Department WHERE teachers_userId=:teacherid and departments_departmentId=:departmentid");
			query.setParameter("teacherid",teacherId);
			query.setParameter("departmentid",departmentId);
			query.executeUpdate();
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return res;

		
	}
	public Teacher getTeacherById(long id) {
		Teacher t= null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			t = session.get(Teacher.class, id);
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return t;
	}
	public boolean updateTeacher(Teacher t) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.update(t);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return res;
	}
	public boolean deleteTeacher(Teacher t) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.delete(t);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}

		return res;
	}

}
