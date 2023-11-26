package com.student.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.student.model.Person;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

		String userID = req.getParameter("userID");
		String password = req.getParameter("password");
		
		List<Person> people = new ArrayList<>();
		people.add(new Person("s1", "rafly", "Dep 1", 35, 0));
		people.add(new Person("s2", "erik", "Dep 1", 70, 0));
		people.add(new Person("s3", "dadang", "Dep 1", 60, 0));
		people.add(new Person("s4", "mikael", "Dep 1", 90, 0));
		people.add(new Person("s5", "zendaya", "Dep 2", 30, 0));
		people.add(new Person("s6", "lulu", "Dep 3", 32, 0));
		people.add(new Person("s7", "eki", "Dep 3", 70, 0));
		people.add(new Person("s8", "deni", "Dep 3", 20, 0));
		
		Person userExists = null;
		
		for (Person person : people) {
			if (userID.equals(person.getId())) {
				userExists = person;
			} 
		}
		
		if (userExists != null) {
			HttpSession session = req.getSession();
			session.setAttribute("data", userExists.getId());
			res.sendRedirect("dashboard.jsp");
		} else {
			res.sendRedirect("login.jsp");
		}


	}
}
