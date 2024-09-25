package com.servlet;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDao;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userid"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phonNo = req.getParameter("phonNo");
        String about = req.getParameter("about");

        HttpSession session = req.getSession();

        // Validate name
        if (name == null || name.isEmpty()) {
            session.setAttribute("failedMsg", "Name is required");
            resp.sendRedirect("add_contact.jsp");
            return;
        }

        // Validate email using regex
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pat = Pattern.compile(emailRegex);
        if (email == null || !pat.matcher(email).matches()) {
            session.setAttribute("failedMsg", "Invalid email format");
            resp.sendRedirect("add_contact.jsp");
            return;
        }

        // Validate phone number (example: must be 10 digits)
        String phoneRegex = "\\d{10}";
        if (phonNo == null || !phonNo.matches(phoneRegex)) {
            session.setAttribute("failedMsg", "Phone number must be 10 digits");
            resp.sendRedirect("add_contact.jsp");
            return;
        }

        // Validate about (example: must not be empty)
        if (about == null || about.isEmpty()) {
            session.setAttribute("failedMsg", "About field is required");
            resp.sendRedirect("add_contact.jsp");
            return;
        }

        // If all validations pass
        Contact c = new Contact(name, email, phonNo, about, userId);
        ContactDao dao = new ContactDao(DbConnect.getConn());
        boolean f = dao.saveContact(c);

        if (f) {
            session.setAttribute("succMsg", "Your contact has been saved");
            resp.sendRedirect("add_contact.jsp");
        } else {
            session.setAttribute("failedMsg", "Something went wrong on the server");
            resp.sendRedirect("add_contact.jsp");
        }
    }
}
