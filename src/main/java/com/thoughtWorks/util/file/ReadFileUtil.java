package com.thoughtWorks.util.file;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReadFileUtil {


    Map<String, Object> fileType = new HashMap<>();
    List<String> assetbundleStr = new ArrayList<>();
    List<String> xmlStr = new ArrayList<>();


    /**
     * 读取一个文件夹下所有文件及子文件夹下的所有文件
     *
     * @param filePath
     */
    public Map<String, Object> readallfile(String filePath) {

        String oldFilePath = filePath;
        File f = null;
        f = new File(filePath);
        // 得到f文件夹下面的所有文件。
        File[] files = f.listFiles();
        List<File> list = new ArrayList<File>();
        for (File file : files) {
            if (file.isDirectory()) {
                //如何当前路劲是文件夹，则循环读取这个文件夹下的所有文件
                readallfile(file.getAbsolutePath());
            } else {
                list.add(file);
            }
        }
        for (File file : files) {
            //获取文件后缀名
            String suffix = file.getAbsolutePath().substring(file.getAbsolutePath().lastIndexOf(".") + 1);

            if (suffix.equals("assetbundle")) {
                String parent = new File(new File(new File(file.getParent()).getParent()).getParent()).getParent();
                assetbundleStr.add(getStringObjectMap(parent, file, "assetbundleFile"));
            }
            if (suffix.equals("png") || suffix.equals("jpg")) {
                fileType.put("imgStr", file.getAbsolutePath());
            }
            if (suffix.equals("gif")) {
                fileType.put("gifStr", file.getAbsolutePath());
            }
            if (suffix.equals("xml")) {
                String parent = new File(new File(new File(file.getParent()).getParent()).getParent()).getParent();
                xmlStr.add(getStringObjectMap(parent, file, "xmlFile"));
                fileType.put("xml", file.getAbsolutePath());
            }
            if (suffix.equals("txt")) {
                fileType.put("txt", file.getAbsolutePath());
            }
        }
        fileType.put("assetbundleStr", assetbundleStr);

        return fileType;
    }

    //移动文件
    private String getStringObjectMap(String oldFilePath, File file, String fileType) {
        File assetbundleFile = new File(oldFilePath + "/" + fileType);
        if (!assetbundleFile.exists()) {
            assetbundleFile.mkdir();
        }
        File fileItem = new File(file.getAbsolutePath());
        fileItem.renameTo(new File(assetbundleFile + "/" + fileItem.getName()));
        file.delete();
        return assetbundleFile + "/" + fileItem.getName();
    }

    /**
     * 读取一个文件夹下的所有文件夹和文件
     *
     * @param filePath
     */
    public void ReadFile(String filePath) {
        File f = null;
        f = new File(filePath);
        // 得到f文件夹下面的所有文件。
        File[] files = f.listFiles();
        List<File> list = new ArrayList<File>();

        for (File file : files) {
            list.add(file);
        }

        List<String> assetbundleStr = new ArrayList<>();
        List<String> imgStr = new ArrayList<>();
        List<String> gifStr = new ArrayList<>();
        for (File file : files) {

        }

    }

    /**
     * 读取文件里的内容
     * 功能：Java读取txt文件的内容 步骤：1：先获得文件句柄 2：获得文件句柄当做是输入一个字节码流，需要对这个输入流进行读取
     * 3：读取到输入流后，需要读取生成字节流 4：一行一行的输出。readline()。 备注：需要考虑的是异常情况
     *
     * @param filePath 文件路径[到达文件:如： D:\aa.txt]
     * @return 将这个文件按照每一行切割成数组存放到list中。
     */
    public static List<String> readTxtFileIntoStringArrList(String filePath) {
        List<String> list = new ArrayList<String>();
        try {
            String encoding = "GBK";
            File file = new File(filePath);
            // 判断文件是否存在
            if (file.isFile() && file.exists()) {
                InputStreamReader read = new InputStreamReader(
                        // 考虑到编码格式
                        new FileInputStream(file), encoding);
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;

                while ((lineTxt = bufferedReader.readLine()) != null) {
                    list.add(lineTxt);
                }
                bufferedReader.close();
                read.close();
            } else {
                System.out.println("找不到指定的文件");
            }
        } catch (Exception e) {
            System.out.println("读取文件内容出错");
            e.printStackTrace();
        }

        return list;
    }

    /**
     * 读取filePath的文件，将文件中的数据按照行读取到String数组中
     *
     * @param filePath 文件的路径
     * @return 文件中一行一行的数据
     */
    public static String[] readToString(String filePath) {
        File file = new File(filePath);
        // 获取文件长度
        Long filelength = file.length();
        byte[] filecontent = new byte[filelength.intValue()];
        try {
            FileInputStream in = new FileInputStream(file);
            in.read(filecontent);
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String[] fileContentArr = new String(filecontent).split("\r\n");

        // 返回文件内容,默认编码
        return fileContentArr;
    }
}
