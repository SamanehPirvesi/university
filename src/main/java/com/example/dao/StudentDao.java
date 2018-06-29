package com.example.dao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.example.utility.HibernateUtil;


public class StudentDao {
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
}