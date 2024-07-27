package uz.app.testapp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.testapp.entity.Attachment;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import static uz.app.testapp.controller.UploadController.attachments;

@WebServlet("/download")
public class DownloadController extends HttpServlet {
    String path = UploadController.path;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
//        resp.setContentType("application/octet-stream");
        Optional<Attachment> first = attachments.stream().filter(attachment -> attachment.getId().contains(id)).findFirst();
        Attachment attachment = first.get();
        resp.setHeader("Content-Disposition","attachment;fileName=\""+attachment.getAttachmentName()+attachment.getPrefix()+"\"");
        String way = path + "/" + id + attachment.getPrefix();
        ServletOutputStream outputStream = resp.getOutputStream();
        Files.copy(Paths.get(way),outputStream);
    }
}
