package com.example.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.example.model.Course;
import com.example.model.Lesson;
import com.example.utility.HibernateUtil;

public class CourseDao {
	public boolean createCourse(Course c) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.persist(c);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();

		} finally {
			session.close();
		}
		return res;
	}

		public Course getCourseById(long id) {
		Course c = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			c = session.get(Course.class,id);
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return c;
	}

	public boolean updateCourse(Course c) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.update(c);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return res;
	}

	
	public boolean deleteCourse(Course c) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.delete(c);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}

		return res;
	}
	public List<Lesson> getListOfLessonForCourse(long id) {
		List<Lesson> list = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query<Lesson> query = session.createQuery("FROM Lesson where Course_courseId=:courseid",Lesson.class);
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
