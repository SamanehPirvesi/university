package com.example.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.example.model.Department;
import com.example.model.University;
import com.example.utility.HibernateUtil;

public class UniversityDao {
	public boolean createUniversity(University u) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.persist(u);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();

		} finally {
			session.close();
		}
		return res;
	}

		public University getUniversityById(long id) {
		University u = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			u = session.get(University.class,id);
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return u;
	}

	public boolean updateUniversity(University u) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.update(u);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return res;
	}

	
	public boolean deleteUniversity(University u) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.delete(u);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}

		return res;
	}
	public List<Department> getListOfDepartmentForCourse(long id) {
		List<Department> list = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query<Department> query = session.createQuery("FROM Department where university_universityId=:courseid",Department.class);
			query.setParameter("courseid", id);
			list = query.getResultList();
			tx.commit();
		} catch (Exception ex) {

			tx.rollback();

		} finally {
			session.close();
		}

		return list;

	}


}
