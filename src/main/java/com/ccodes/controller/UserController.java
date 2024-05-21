package com.ccodes.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ccodes.dao.UserDao;
import com.ccodes.entity.Notes;
import com.ccodes.entity.User;

@Controller
@RequestMapping("/user/")
public class UserController {
	@Autowired
	private UserDao userDao;

	@RequestMapping("/addNotes")
	public String addnote() {
		return "add_notes";
	}

	@RequestMapping("/viewNotes")
	public String viewnotes(HttpSession session, Model m) {
		User us = (User) session.getAttribute("userObj");
		List<Notes> notes = userDao.getNotesByUser(us);
		m.addAttribute("list", notes);
		return "view_notes";
	}
	
	
	@RequestMapping("/viewNoteDetails")
	public String viewNoteDetails(@RequestParam("id") int id, Model model) {
	    Notes note = userDao.getNotesById(id);
	    model.addAttribute("note", note);
	    return "note_details";  // Redirect to a new JSP page to show details
	}


	@RequestMapping("/editNotes")
	public String editnotes(@RequestParam("id") int id, Model m) {
		Notes n = userDao.getNotesById(id);
		m.addAttribute("notes", n);
		return "edit_notes";
	}

	@RequestMapping(path = "/updateNotes", method = RequestMethod.POST)
	public String updateNotes(@ModelAttribute Notes n, HttpSession session) {
		User us = (User) session.getAttribute("userObj");
		n.setUser(us);
		n.setDate(LocalDateTime.now().toString());
		System.out.println(n);

		userDao.updateNotes(n);
		session.setAttribute("msg", "Notes Update Sucessfully");
		return "redirect:/user/viewNotes";

	}

	@RequestMapping(path = "/file_upload")
	public String loadFileUploadPage() {
		return "file_upload";
	}

	@RequestMapping("/logout")
	public String login(HttpSession session) {
		session.removeAttribute("userObj");
		session.setAttribute("msg", "Logut sucessfully");
		return "login";
	}

	@RequestMapping(path = "/saveNotes", method = RequestMethod.POST)
	public String saveNotes(@ModelAttribute Notes n, HttpSession session) {
		User us = (User) session.getAttribute("userObj");
		n.setDate(LocalDateTime.now().toString());
		n.setUser(us);
		userDao.saveNotes(n);
		session.setAttribute("msg", "Notes added Sucessfully");
		return "redirect:/user/addNotes";
	}

	@RequestMapping("/deleteNotes")
	public String deleteNotes(@RequestParam("id") int id, HttpSession session) {
		userDao.deleteNotes(id);
		session.setAttribute("msg", "Notes deleted Sucessfully");
		return "redirect:/user/viewNotes";
	}

	@RequestMapping(path = "/fileupload", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("img") CommonsMultipartFile file, HttpServletRequest req, Model m) {
		System.out.println(file.getName());
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		byte[] bytes = file.getBytes();
		String path = req.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
				+ File.separator + "img" + File.separator + file.getOriginalFilename();
		System.out.println(path);
		try {
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(bytes);
			fos.close();
			System.out.println("File uploaded");
		} catch (Exception e) {
			e.printStackTrace();
		}
		m.addAttribute("imgname", file.getOriginalFilename());
		return "file_success";
	}
}
