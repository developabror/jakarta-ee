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

@WebServlet("/edit")
public class EditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        System.out.println(id);

        System.out.println(req.getParameter("test"));
        Optional<User> first = users.stream().filter(user -> user.getId().equals(id)).findFirst();
        req.setAttribute("user",first.get());
        req.getRequestDispatcher("/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        if (email.equals("admin@gmail.com")){
            req.setAttribute("users",users);
            req.getRequestDispatcher("/users.jsp").forward(req, resp);
        }
        String password = req.getParameter("password");
        Optional<User> first = users.stream().filter(user -> user.getId().equals(id)).findFirst();
        User user = first.get();
        user.setEmail(email);
        user.setName(name);
        user.setPassword(password);
        req.setAttribute("user",user);
        req.getRequestDispatcher("/users.jsp").forward(req, resp);
    }
}
