//package service;
//
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.nio.file.Files;
//import java.util.Arrays;
//import java.util.List;
//
//public class UploadService {
//    public static final List<String> allowedImageTypes = Arrays.asList(
//            "jpg", "jpeg", "png", "gif", "bmp", "webp", "svg", "avif",
//            "tiff", "ico", "raw", "psd", "ai", "eps", "apng", "jp2", "heif", "hdr", "dng", "svgz", "cdr"
//    );
//
//    public static final List<String> allowedVideoTypes = Arrays.asList("mp4", "avi", "mkv", "mov", "wmv", "flv", "webm", "m4v", "mpeg", "mpg", "3gp");
//
//    public void upload(File file, String savePath, String saveServerPath, List<String> allowedFileTypes) throws IOException {
//        String fileName = file.getName();
//        String fileType = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
//
//        if (!allowedFileTypes.contains(fileType)) {
//            throw new IllegalArgumentException("File type not allowed!");
//        }
//
//        File saveDirectory = new File(savePath);
//        File saveDirectoryServer = new File(saveServerPath);
//
//        if (!saveDirectory.exists()) {
//            saveDirectory.mkdirs();
//        }
//        if (!saveDirectoryServer.exists()) {
//            saveDirectoryServer.mkdirs();
//        }
//
//        String saveFilePathDirect = savePath + File.separator + fileName;
//        String saveFilePathServer = saveServerPath + File.separator + fileName;
//
//        byte[] buffer = new byte[1024];
//        int bytesRead;
//        try (InputStream inputStream = Files.newInputStream(file.toPath());
//             FileOutputStream outputStream = new FileOutputStream(saveFilePathServer)) {
//            while ((bytesRead = inputStream.read(buffer)) != -1) {
//                outputStream.write(buffer, 0, bytesRead);
//            }
//        } catch (IOException e) {
//            System.out.println(e.getMessage());
//        }
//        try (InputStream inputStream = Files.newInputStream(file.toPath());
//             FileOutputStream outputStream = new FileOutputStream(saveFilePathDirect)) {
//            while ((bytesRead = inputStream.read(buffer)) != -1) {
//                outputStream.write(buffer, 0, bytesRead);
//            }
//        } catch (IOException e) {
//            System.out.println(e.getMessage());
//        }
//    }
//
//}
