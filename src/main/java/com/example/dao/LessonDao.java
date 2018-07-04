package com.example.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.example.model.Course;
import com.example.model.Lesson;
import com.example.model.User;
import com.example.utility.HibernateUtil;

public class LessonDao {
	public boolean createLesson(Lesson l) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.persist(l);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();

		} finally {
			session.close();
		}
		return res;
	}

		public Lesson getLessonById(long id) {
		Lesson l = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			l = session.get(Lesson.class,id);
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return l;
	}

		public Lesson getlessonByName(String name) {
			Lesson l = null;
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			try {
				tx = session.getTransaction();
				tx.begin();
				Query<Lesson> query = session.createQuery("from Lesson where lessonName=:lessonname", Lesson.class);
				query.setParameter("lessonname", name);
				l = (Lesson) query.uniqueResult();
				tx.commit();
			} catch (Exception ex) {
				tx.rollback();
			} finally {
				session.close();
			}
			return l;
		}
		public List<Course> getListOfCoursesForLesson(long id) {
			List<Course> list = null;
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createNativeQuery("Select * From Course c, Lesson_Course lT where c.courseId = lT.courses_courseId And lT.lessons_lessonId=:lessonid").addEntity(Course.class);
				query.setParameter("lessonId", id);
				 list =  query.getResultList();
				tx.commit();
			} catch (Exception ex) {
				tx.rollback();
			} finally {
				session.close();
			}
			return list;
		}
	public boolean updateLesson(Lesson l) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.update(l);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return res;
	}

	public boolean updateUserById(long id, String name) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("UPDATE Lesson SET lessonName=:lessonName WHERE lessonId=:lessonId");
			query.setParameter("lessonName", name);
			query.setParameter("lessonId", id);
			query.executeUpdate();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return res;
	}

	public boolean deleteLesson(Lesson l) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.delete(l);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}

		return res;
	}
	public List<Lesson> getAllLessones() {
		List<Lesson> list = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("FROM Lesson");
		
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
