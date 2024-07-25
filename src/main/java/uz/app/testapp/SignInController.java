package uz.app.testapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.testapp.entity.User;

import java.io.IOException;
import java.util.Optional;

import static uz.app.testapp.SignUpController.users;

@WebServlet("/sign-in")
public class SignInController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        Optional<User> first = users.stream().filter(user -> user.getEmail().equals(email)).findFirst();
        User user = first.get();

        req.setAttribute("user",user);
        req.getRequestDispatcher("/users.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("exists",false);
        req.getRequestDispatcher("/sign-in.jsp").forward(req, resp);
    }
}
