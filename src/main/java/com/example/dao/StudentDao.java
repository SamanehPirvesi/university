package com.example.dao;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.example.model.Course;
import com.example.model.Lesson;
import com.example.model.Student;
import com.example.utility.HibernateUtil;

public class StudentDao {
	public boolean createStudent(Student s) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.persist(s);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();

		} finally {
			session.close();
		}
		return res;
	}
	public boolean updateStudentCourseById(long StudentId , long CourseId) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();

			Query query=session.createQuery("UPDATE Student SET Course_courseId=:courseId WHERE userId=:studentId");
			query.setParameter("courseId",CourseId);
			query.setParameter("studentId", StudentId);
		query.executeUpdate();
			res = true;
		} catch (Exception ex) {

			tx.rollback();

		} finally {
			session.close();
		}

		return res;

	}
	public List<Student> getListOfAllStudents() {
		List<Student> list = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query<Student> query = session.createQuery("from Student ", Student.class);
			list = query.getResultList();
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return list;
	}
	public Student getStudentById(long id) {
		Student s = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			s = session.get(Student.class, id);
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return s;
	}
	public boolean updateStudent(Student s) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.update(s);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return res;
	}
	public boolean deleteStudent(Student s) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.delete(s);
			tx.commit();
			res = true;
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}

		return res;
	}
	public boolean deletLessonFromLessonListForStudent(long lessonId , long studentId) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createNativeQuery("Delete From Student_Lesson where lessons_lessonId=:lessonid And students_userId=:studentid");
			query.setParameter("studentid",studentId);
			query.setParameter("lessonid",lessonId);
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
	public List<Lesson> getListOfLessonForStudent(long id) {
		List<Lesson> list = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createNativeQuery("Select * From Lesson l, Student_Lesson st where l.lessonId = st.lessons_lessonId And st.students_userId=:studentid").addEntity(Lesson.class);
			query.setParameter("studentid", id);
			 list =  query.getResultList();
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return list;
	}
}