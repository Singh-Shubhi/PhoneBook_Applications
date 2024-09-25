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
import com.dao.UserDao;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        
        // Validate name
        if (name == null || name.isEmpty()) {
            session.setAttribute("errorMsg", "Name is required");
            response.sendRedirect("register.jsp");
            return;
        }

        // Validate email using regex
        String emailRegex = "^[a-zA-Z0-9_+&-]+(?:\\.[a-zA-Z0-9_+&-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pat = Pattern.compile(emailRegex);
        if (email == null || !pat.matcher(email).matches()) {
            session.setAttribute("errorMsg", "Invalid email format");
            response.sendRedirect("register.jsp");
            return;
        }

        // Validate password (e.g., at least 6 characters)
        if (password == null || password.length() < 6) {
            session.setAttribute("errorMsg", "Password must be at least 6 characters long");
            response.sendRedirect("register.jsp");
            return;
        }

        // If all validations pass
        User u = new User(name, email, password);
        UserDao dao = new UserDao(DbConnect.getConn());
        boolean f = dao.userRegister(u);
            
        if (f) {
            session.setAttribute("sucssMsg", "User Registered Successfully");
            response.sendRedirect("register.jsp");
        } else {
            session.setAttribute("errorMsg", "Something went wrong on the server");
            response.sendRedirect("register.jsp");
        }
    }
}