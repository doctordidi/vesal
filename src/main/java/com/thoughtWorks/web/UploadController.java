package com.thoughtWorks.web;

import com.thoughtWorks.service.UploadService;
import com.thoughtWorks.common.Constants;
import com.thoughtWorks.util.file.FileUtil;
import com.thoughtWorks.util.file.ReadFileUtil;
import com.thoughtWorks.util.file.UnZipFileUtil;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @author Vincent.wang
 */
@Controller
@RequestMapping(value = "/upload/")
public class UploadController {
    @Autowired
    UploadService uploadService;

    private static final Logger log = LoggerFactory.getLogger(UploadController.class);


    @RequestMapping(value = "spring", method = RequestMethod.GET)
    public String spring() {
        return "/upload/spring";
    }

    @RequestMapping(value = "spring", method = RequestMethod.POST)
    public String springupload(@RequestParam("upload_file") MultipartFile[] ajaxuploadfile, HttpServletRequest request, HttpServletResponse response, Model model) {
        ReadFileUtil readFileUtil = new ReadFileUtil();
        response.setContentType("text/plain; charset=UTF-8");
        String originalFilename = null;
        for (MultipartFile file : ajaxuploadfile) {

            if (file.isEmpty()) {
                model.addAttribute("msg", "没有文件！");
                return "moduleOne/moduleOne/moduleOne";
            } else {
                log.warn("# originalFilename=[{}] , name=[{}] , size=[{}] , contentType=[{}] ", originalFilename, file.getName(), file.getSize(), file.getContentType());
                try {

                    originalFilename = file.getOriginalFilename();
                    //file.getOriginalFilename()是得到上传时的文件名
                    String uuid = UUID.randomUUID().toString().replaceAll("-", "");
                    String realPath = request.getServletContext().getRealPath("file") + Constants.PATH + uuid;
                    String unRealPath = request.getServletContext().getRealPath("file") + Constants.UNPATH + uuid;
                    FileUtil.isDirectory(realPath, true, request);

                    //获取文件后缀名
                    String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);

                    //转换为原始文件
                    CommonsMultipartFile cf = (CommonsMultipartFile) file;
                    DiskFileItem fi = (DiskFileItem) cf.getFileItem();
                    File oldFile = fi.getStoreLocation();

                    //解压文件操作
                    UnZipFileUtil.unZipFiles(oldFile, unRealPath);
                    //复制压缩包
//                    FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath, originalFilename));

//                    Thread.currentThread().sleep(2000);//毫秒
                    Map<String, Object> fileInfo = readFileUtil.readallfile(unRealPath);
                    //提取zip里面的信息,并封装到map集合中,并传入Service层
                    Map<String, Object> dataInfo = extractZipInfo(fileInfo);

                    uploadService.addZipInfo(dataInfo);
                } catch (IOException e) {
                    log.error("# upload fail . error message={}", e.getMessage());
                    e.printStackTrace();
                    model.addAttribute("msg", "上传失败！");
                    return "moduleOne/moduleOne/moduleOne";
                }
            }
        }
        model.addAttribute("msg", "上传成功！");
        return "moduleOne/moduleOne/moduleOne";
    }

    private Map<String, Object> extractZipInfo(Map<String, Object> fileInfo) {
        Map<String, Object> zipFileInfo = new HashMap<>();
        zipFileInfo.put("code", UUID.randomUUID().toString().replaceAll("-", ""));
        for (String key : fileInfo.keySet()) {
            if (key.equals("txt")) {
                //读取txt文件的内容
                List txtInfo = ReadFileUtil.readTxtFileIntoStringArrList((String) fileInfo.get(key));
                for (int i = 0; i < txtInfo.size(); i++) {
                    String line = (String) txtInfo.get(i);
                    //分割必须采用英文符号,采用中文会导致分割失败
                    String[] items = line.split("\\:");
                    if (items.length > 1) {
                        zipFileInfo.put(items[0], items[1]);
                    }
                }
            }


            if (key.equals("imgStr")) {
                String imgs = (String) fileInfo.get(key);
                    zipFileInfo.put("imgStr", splitStr(imgs));
            }

            if (key.equals("gifStr")) {
                String gifs = (String) fileInfo.get(key);
                    zipFileInfo.put("gifStr", splitStr(gifs));
            }

            if (key.equals("assetbundleStr")) {
                List<String> assetbundles = (List<String>) fileInfo.get(key);
                if (assetbundles.size() == 1) {
                    zipFileInfo.put("assetbundleStr", splitStr(assetbundles.get(0)));
                } else if (assetbundles.size() > 1) {
                    String gifMore = "";
                    for (int i = 0; i < assetbundles.size(); i++) {
                        gifMore += splitStr(assetbundles.get(i)) + "###";
                    }
                    zipFileInfo.put("assetbundleStr", gifMore);
                }
            }

            if (key.equals("xml")) {
                String path = splitStr((String) fileInfo.get(key));
                zipFileInfo.put("xml", path);
            }
        }

        return zipFileInfo;
    }

    public String splitStr(String str) {
        if (str.length() != -1) {
            str = "\\home" + str.split("home")[1];
        }
        String newPath = str.replaceAll("\\\\", "/");

        return newPath;
    }

    @RequestMapping(value = "/ajax", method = RequestMethod.GET)
    public String ajax() {
        return "/upload/ajax";
    }

    @RequestMapping(value = "/ajax", method = RequestMethod.POST)
    @ResponseBody
    public String ajaxupload(@RequestParam("ajaxuploadfile") MultipartFile[] ajaxuploadfile, HttpServletRequest request, HttpServletResponse response) {
        String realPath = Constants.PATH;
        FileUtil.isDirectory(realPath, true, request);
        response.setContentType("text/plain; charset=d-8");
        String originalFilename = null;
        for (MultipartFile file : ajaxuploadfile) {
            if (file.isEmpty()) {
                return "上传失败";
            } else {
                originalFilename = file.getOriginalFilename();
                log.warn("# originalFilename=[{}] , name=[{}] , size=[{}] , contentType=[{}] ", originalFilename, file.getName(), file.getSize(), file.getContentType());
                try {
                    FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath, originalFilename));
                } catch (IOException e) {
                    log.error("# upload fail . error message={}", e.getMessage());
                    e.printStackTrace();
                    return "上传失败";
                }
            }
        }
        return "上传成功";
    }

}
