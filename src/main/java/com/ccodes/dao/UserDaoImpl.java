package com.ccodes.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.ccodes.entity.Notes;
import com.ccodes.entity.User;

@Transactional
@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public int saveUser(User user) {
		int i = (Integer) hibernateTemplate.save(user);
		return i;
	}

	@Override
	public User login(String email, String password) {
		String hql = "from User where email=:em and password=:pwd";
		Query<User> query = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql, User.class);
		// Query q=s.createQuery(sql);
		query.setParameter("em", email);
		query.setParameter("pwd", password);
		return query.uniqueResult();

	}
	// TODO Auto-generated method stub
	// return user;

	@Override
	public int saveNotes(Notes notes) {
		int i = (Integer) hibernateTemplate.save(notes);
		return i;
	}

	@Override
	public List<Notes> getNotesByUser(User user) {
		String hql = "from Notes where user=:us";
		List<Notes> list = hibernateTemplate.execute(s -> {
			Query<Notes> q = s.createQuery(hql, Notes.class); // Specify the generic type <Notes> for Query
			q.setParameter("us", user);
			return q.getResultList();
		});
		return list;
	}

	@Override
	public Notes getNotesById(int id) {
		Notes n = hibernateTemplate.get(Notes.class, id);
		return n;
	}

	@Override
	public void deleteNotes(int id) {
		Notes n = hibernateTemplate.get(Notes.class, id);
		hibernateTemplate.delete(n);
	}

	@Override
	public void updateNotes(Notes n) {
		hibernateTemplate.update(n);
	}

	@Override
	public boolean existsByEmail(String email) {
		String hql = "select count(1) from User where email=:em";
		Long count = hibernateTemplate.execute(session -> {
			Query<Long> query = session.createQuery(hql, Long.class);
			query.setParameter("em", email);
			return query.uniqueResult();
		});
		return count > 0;
	}

//	@Override
//	public List<Notes> searchNotesByUser(User user, String keyword) {
//		String hql = "from Notes where user=:us and (title like :kw or content like :kw)";
//		List<Notes> list = hibernateTemplate.execute(s -> {
	// Query<Notes> q = s.createQuery(hql, Notes.class);
	// q.setParameter("us", user);
	// q.setParameter("kw", "%" + keyword + "%");
	// List<Notes> results = q.getResultList();
	// System.out.println("Search results: " + results); // Debug statement
	// return results;
//		});
//		return list;
//	}  

	@Override
	public List<Notes> searchNotesByUser(User user, String keyword) {
		String hql = "from Notes where user=:us and (title like :kw or description like :kw)";
		List<Notes> list = hibernateTemplate.execute(s -> {
			Query<Notes> q = s.createQuery(hql, Notes.class);
			q.setParameter("us", user);
			q.setParameter("kw", "%" + keyword + "%");
			return q.getResultList();
		});
		return list;
	}

}
