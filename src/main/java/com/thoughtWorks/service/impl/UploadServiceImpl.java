package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.UploadDao;
import com.thoughtWorks.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Service
public class UploadServiceImpl implements UploadService {

    @Autowired
    UploadDao uploadDao;

    @Override
    public void addZipInfo(Map<String, Object> zipFile) {
        String code = (String) zipFile.get("code");
        //提取关于类型的信息
        Map<String, Object> data = extractFileInformation(zipFile);


        Map<String,Object> zipData = getModelGrade(code, zipFile,data);


        uploadDao.addZipInfo(zipData);
    }

    private Map<String, Object> getModelGrade(String code, Map<String, Object> zipFiles, Map<String, Object> data) {
        Map<String, Object> modelGradeInfo = new HashMap<>();
        zipFiles.put("code", code);
        if (data.get("count0") != "") {
            String oneId = uploadDao.getModelGradeOne((String) data.get("count0"));
            zipFiles.put("oneId", oneId);
        }
        if (data.get("count1") != "") {
            String twoId = uploadDao.getModelGradeTwo((String) data.get("count1"));
            zipFiles.put("twoId", twoId);
        }
        if (data.get("count2") != "") {
            String thrId = uploadDao.getModelGradeThr((String) data.get("count2"));
            zipFiles.put("thrId", thrId);
        }

        return zipFiles;
    }

    private Map<String, Object> extractFileInformation(Map<String, Object> zipFile) {
        Map<String, Object> modelGrade = new HashMap<>();

        String[] types = ((String) zipFile.get("type")).split("\\#");
        if (types.length == 3) {
            for (int i = 0; i < 3; i++) {
                modelGrade.put("count" + i, types[i]);
            }
        } else if (types.length == 2) {
            for (int j = 0; j < 2; j++) {
                modelGrade.put("count" + j, types[j]);
            }
            modelGrade.put("count3", "");
        } else if (types.length == 1) {
            for (int j = 0; j < 1; j++) {
                modelGrade.put("count" + j, types[j]);
            }
            modelGrade.put("count2", "");
            modelGrade.put("count3", "");
        }

        return modelGrade;
    }
}
