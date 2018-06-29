package com.example.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.example.utility.HibernateUtil;

public class TeacherDao {
	public boolean updateTeacherSalaryById(long teacherId , double salary) {
		boolean res = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();

			Query query=session.createQuery("UPDATE Teacher SET salary=:salary WHERE userId=:idnumber");
			query.setParameter("salary",salary);
			query.setParameter("idnumber", teacherId);
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
