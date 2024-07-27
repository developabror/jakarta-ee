package uz.app.testapp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import uz.app.testapp.entity.Attachment;

import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@WebServlet("/upload")
@MultipartConfig(location = "/home/user/Desktop/attachments")
public class UploadController extends HttpServlet {
    public static final String path = "/home/user/Desktop/attachments";
    public static List<Attachment> attachments = new ArrayList<>();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("upload.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Attachment attachment =new Attachment();
        Part file = req.getPart("file");
        System.out.println(file.getSubmittedFileName());
        InputStream inputStream = file.getInputStream();
        String fileName = file.getSubmittedFileName();
        attachment.setAttachmentName(fileName.substring(0,fileName.lastIndexOf(".")));
        attachment.setPrefix(fileName.substring(fileName.lastIndexOf(".")));
        attachment.setAttachmentSize(String.valueOf(file.getSize()));

        Path dest = Paths.get(path+"/"+
                attachment.getId()+attachment.getPrefix());
        Files.copy(inputStream,dest, StandardCopyOption.REPLACE_EXISTING);
        inputStream.close();
        if (attachment.getAttachmentName() != null) {
            attachments.add(attachment);
        }
        req.setAttribute("attachments",attachments);
        System.out.println(attachments);
        resp.sendRedirect("/images");

    }
}
