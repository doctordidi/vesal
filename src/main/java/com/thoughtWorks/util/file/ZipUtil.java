package com.thoughtWorks.util.file;

import com.github.junrar.Archive;
import com.github.junrar.exception.RarException;
import com.github.junrar.rarfile.FileHeader;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.*;

/**
 * @author Vincent.wang
 *
 */
public class ZipUtil {

    public static boolean compress(List<File> files, String zipPath, boolean isDel) {
        if (StringUtils.isBlank(zipPath) || CollectionUtils.isEmpty(files)) {
            return false;
        }
        try {
            // ----压缩文件：
            FileOutputStream stream = new FileOutputStream(zipPath);
            CheckedOutputStream checkedStream = new CheckedOutputStream(stream, new CRC32());// 使用指定校验和创建输出流
            ZipOutputStream zipStream = new ZipOutputStream(checkedStream);
            BufferedOutputStream out = new BufferedOutputStream(zipStream);
            zipStream.setComment("共计" + files.size() + "个文件"); // 设置压缩包注释
            zipStream.setMethod(ZipOutputStream.DEFLATED);// 启用压缩
            zipStream.setLevel(Deflater.BEST_COMPRESSION);// 压缩级别为最强压缩，但时间要花得多一点

            ZipEntry zipEntry;
            BufferedInputStream bi = null;
            for (File file : files) {
                bi = new BufferedInputStream(new FileInputStream(file));
                // 开始写入新的ZIP文件条目并将流定位到条目数据的开始处
                zipEntry = new ZipEntry(file.getName());
                zipStream.putNextEntry(zipEntry);
                byte[] buffer = new byte[1024];
                int readCount = bi.read(buffer);

                while (readCount != -1) {
                    out.write(buffer, 0, readCount);
                    readCount = bi.read(buffer);
                }
                // 注，在使用缓冲流写压缩文件时，一个条件完后一定要刷新一把，不
                // 然可能有的内容就会存入到后面条目中去了
                out.flush();
                // 文件读完后关闭
                bi.close();
            }
            out.close();

            if (isDel) {
                for (File file : files) {
                    FileUtils.deleteQuietly(file);
                }
            }

            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 解压缩
     * 
     * @param zipfile
     *            File 需要解压缩的文件
     * @param descDir
     *            String 解压后的目标目录
     */
    @SuppressWarnings({ "rawtypes", "resource" })
    public static void unZipFiles(File zipfile, String descDir) {
        try {
            ZipFile zf = new ZipFile(zipfile);
            ZipEntry entry = null;
            String zipEntryName = null;
            InputStream in = null;
            OutputStream out = null;
            byte[] buf1 = null;
            int len;
            for (Enumeration entries = zf.entries(); entries.hasMoreElements();) {
                entry = ((ZipEntry) entries.nextElement());
                zipEntryName = entry.getName();
                in = zf.getInputStream(entry);
                out = new FileOutputStream(descDir + zipEntryName);
                buf1 = new byte[1024];
                len = 0;
                while ((len = in.read(buf1)) > 0) {
                    out.write(buf1, 0, len);
                }
                in.close();
                out.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param zipOutFile
     *            The file will be generated
     * @param zipInputFile
     *            To compress the file or folder
     * @throws IOException
     */
    public static boolean zipCompressing(File zipOutFile, File zipInputFile)
            throws IOException {
        boolean flag = true;
        ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(
                zipOutFile));
        BufferedOutputStream bos = new BufferedOutputStream(zos);
        flag = zipCompressingStream(zos, zipInputFile, zipOutFile.getAbsolutePath(),
                bos);
        bos.close();
        zos.close();
        return flag;
    }

    /**
     * @param zipFileName
     *            The name of the zip file will be generated
     * @param zipInputFile
     *            To compress the file or folder
     * @throws IOException
     */
    public static boolean  zipCompressing(String zipFileName, String zipInputFile)
            throws IOException {
        return zipCompressing(new File(zipFileName), new File(zipInputFile));
    }

    /**
     *
     * @param out
     *            The implementation of file compression flow
     * @param f
     *            To compress the file or folder
     * @param base
     *            Root node of the compressed file
     * @param bos
     *            The compression stream buffer
     * @throws IOException
     */
    public static boolean zipCompressingStream(ZipOutputStream out, File f,
                                               String base, BufferedOutputStream bos) throws IOException {
        boolean flag = true;
        if (f.isDirectory()) {
            File[] f1 = f.listFiles();
            if (f1.length == 0) {
                out.putNextEntry(new ZipEntry(base + "/"));
            } else {
                for (int i = 0; i < f1.length; i++) {
                    File file = f1[i];
                    flag =   flag && zipCompressingStream(out, file, file.getName(), bos);
                }
            }

        } else {
            out.putNextEntry(new ZipEntry(base));
            FileInputStream in = new FileInputStream(f);
            BufferedInputStream bis = new BufferedInputStream(in);
            int b;

            while ((b = bis.read()) != -1) {
                bos.write(b);
            }
            bos.flush();
            bis.close();
            in.close();
            flag = true;
        }
        return flag;
    }

    /**
     *
     * @param zipFile
     *            To unzip the files
     * @param outputPath
     *            Extract the location
     */
    public static void  zipDecompressing(File zipFile, String outputPath)
            throws IOException {

        ZipInputStream zis = new ZipInputStream(new FileInputStream(zipFile));
        BufferedInputStream bis = new BufferedInputStream(zis);

        File fOut = null;
        ZipEntry entry = null;
        while ((entry = zis.getNextEntry()) != null && !entry.isDirectory()) {

            fOut = new File(outputPath, entry.getName());

            if (!fOut.exists()) {
                (new File(fOut.getParent())).mkdirs();
            }

            FileOutputStream fos = new FileOutputStream(fOut);

            BufferedOutputStream bos = new BufferedOutputStream(fos);
            int b;
            while ((b = bis.read()) != -1) {
                bos.write(b);
            }
            bos.close();
            fos.close();
        }
        bis.close();
        zis.close();

    }



    /**
     * @param rarFileName rar file name
     * @param outFilePath output file path
     * @return success Or Failed
     * @author zhuss
     * @throws Exception
     */
    public static boolean  unrar(String rarFileName, String outFilePath)  throws  Exception{

        boolean flag = false;
        try  {
            Archive archive = new  Archive(new File(rarFileName));
            if(archive == null){
                throw new FileNotFoundException(rarFileName + " NOT FOUND!");
            }
            if(archive.isEncrypted()){
                throw new Exception(rarFileName + " IS ENCRYPTED!");
            }
            List<FileHeader> files =  archive.getFileHeaders();
            for (FileHeader fh : files) {
                if(fh.isEncrypted()){
                    throw new Exception(rarFileName + " IS ENCRYPTED!");
                }
                String fileName = fh.getFileNameW();
                if(fileName != null && fileName.trim().length() > 0){
                    String saveFileName = outFilePath+"\\"+fileName;
                    File saveFile = new File(saveFileName);
                    File parent =  saveFile.getParentFile();
                    if(!parent.exists()){
                        parent.mkdirs();
                    }
                    if(!saveFile.exists()){
                        saveFile.createNewFile();
                    }
                    FileOutputStream fos = new FileOutputStream(saveFile);
                    try {
                        archive.extractFile(fh, fos);
                        fos.flush();
                        fos.close();
                    } catch (RarException e) {
                        if(e.getType().equals(RarException.RarExceptionType.notImplementedYet)){
                        }
                    }finally{
                    }
                }
            }
            flag = true;
        } catch  (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return flag;
    }
}
