package uz.app.testapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.testapp.entity.User;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/sign-up")
public class SignUpController extends HttpServlet {
    public static List<User> users = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if (users.stream().anyMatch(user -> user.getEmail().equals(email))) {
            req.setAttribute("xabar", "this email is already in use");
            req.setAttribute("exists",true);
        } else {
            users.add(new User(name, email, password));
            req.setAttribute("exists",false);
        }
            req.setAttribute("users", users);
        req.getRequestDispatcher("/sign-in.jsp").forward(req, resp);
    }
}
