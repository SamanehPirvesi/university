package com.example.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.example.model.Course;
import com.example.model.Lesson;
import com.example.model.Teacher;
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
		public Course getCoursementByName(String courseName) {
			Course c = null;
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			try {
				tx = session.getTransaction();
				tx.begin();
				Query<Course> query = session.createQuery("from Course where courseName=:name", Course.class);
				query.setParameter("name", courseName);
				c = (Course) query.uniqueResult();
				tx.commit();
			} catch (Exception ex) {
				tx.rollback();
			} finally {
				session.close();
			}
			return c;
		}
		public List<Lesson> getListOfLissonForCourse(long id) {
			List<Lesson> list = null;
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createNativeQuery("Select * From Lesson l, Lesson_Course lc where l.lessonId = lc.lessons_lessonId And lc.courses_courseId=:courseid").addEntity(Lesson.class);
				query.setParameter("courseid",id);
				list = query.getResultList();
				tx.commit();
			} catch (Exception ex) {

				tx.rollback();

			} finally {
				session.close();
			}

			return list;

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
	
	public List<Course> getAllCourses() {
		List<Course> list = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("FROM Course");
		
			list =query.getResultList();
			tx.commit();
		} catch (Exception ex) {

			tx.rollback();

		} finally {
			session.close();
		}

		return list;

	}

}
