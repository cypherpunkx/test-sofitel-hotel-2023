package com.student.app;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

		HttpSession session = req.getSession();
		session.removeAttribute("data");
		session.invalidate();
		res.sendRedirect("login.jsp");
	}
}
