package uz.app.testapp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.testapp.entity.User;

import java.io.IOException;
import java.util.Optional;

import static uz.app.testapp.controller.SignUpController.users;

@WebServlet("/sign-in")
public class SignInController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Optional<User> first = users.stream().filter(user -> user.getEmail().equals(email) && user.getPassword().equals(password)).findFirst();
        User user = first.orElseThrow(() -> new RuntimeException("user not found"));
        if (user.getEmail().equals("admin@gmail.com") && user.getPassword().equals("admin")) {
            req.setAttribute("users", users);
        }
        req.setAttribute("user", user);
        req.getRequestDispatcher("/users.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("exists", false);
        req.getRequestDispatcher("/sign-in.jsp").forward(req, resp);
    }
}
