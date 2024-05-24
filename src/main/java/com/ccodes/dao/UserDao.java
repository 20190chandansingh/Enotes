package com.ccodes.dao;

import java.util.List;

import com.ccodes.entity.Notes;
import com.ccodes.entity.User;

public interface UserDao {
	public int saveUser(User user);

	public User login(String email, String password);

	boolean existsByEmail(String email);

	public int saveNotes(Notes notes);

	public List<Notes> getNotesByUser(User user);

	public Notes getNotesById(int id);

	public void deleteNotes(int id);

	public void updateNotes(Notes n);

	public List<Notes> searchNotesByUser(User user, String keyword);

}
