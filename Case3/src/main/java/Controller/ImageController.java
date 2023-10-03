package Controller;

import DAO.DatabaseConnection;
import com.fasterxml.jackson.databind.ObjectMapper;
import service.UploadService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@WebServlet("/uploadImage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50) //50MB
public class ImageController extends HttpServlet {
    public static final String IMAGE_SAVE_DIRECTORY = "D:\\case-study\\Case3\\Case3\\src\\main\\webapp\\img".replace("\\", "/");
    public static final String IMAGE_SAVE_SERVER = "D:\\case-study\\Case3\\Case3\\target\\Case3-1.0-SNAPSHOT\\img".replace("\\", "/");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the uploaded file from the request
            Part filePart = req.getPart("avatar");
            String fileType = req.getParameter("fileType");
            List<String> allowedType = UploadService.allowedImageTypes;
            if (Objects.equals(fileType, "video")) {
                allowedType = UploadService.allowedVideoTypes;
            } // Generate a unique filename for the uploaded image
//            String fileName = UUID.randomUUID() + getExtension(filePart.getSubmittedFileName());

            // Save the image to a temporary file
            File tempFile = saveToTempFile(filePart);
            String fileName = tempFile.getName();
            // Create an instance of UploadService
            UploadService uploadService = new UploadService();

            // Save the temporary file to the server using the UploadService
            uploadService.upload(tempFile, IMAGE_SAVE_DIRECTORY, IMAGE_SAVE_SERVER, allowedType);

            // Delete the temporary file after it has been uploaded
            tempFile.delete();

            // Create a response JSON object with the image URL
            String imageUrl = "/assets/images/" + fileName; // Change "/images/" to the URL path of your image directory

            // Create an ObjectMapper instance
            ObjectMapper objectMapper = new ObjectMapper();

            // Create a Map to store the response data
            Map<String, String> responseData = new HashMap<>();
            responseData.put("imageUrl", imageUrl);

            // Convert the Map to a JSON string
            String jsonResponse = objectMapper.writeValueAsString(responseData);

            // Set the response content type to JSON
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            // Write the JSON response back to the client
            PrintWriter writer = resp.getWriter();
            writer.print(jsonResponse);
            writer.flush();
        } catch (Exception e) {
            // Handle any errors that occur during the image upload process
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        }

    }
    public static File saveToTempFile(Part part) throws IOException {
        String fileName = part.getSubmittedFileName();
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        LocalDateTime now = LocalDateTime.now();
        File tempFile = File.createTempFile("file", fileExtension);

        try (InputStream inputStream = part.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(tempFile)) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
        return tempFile;
    }

    private String getExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf(".");
        return dotIndex == -1 ? "" : fileName.substring(dotIndex);
    }

}
