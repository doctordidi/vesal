package com.thoughtWorks.util.email;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class SendEmailUtil {

    public static  String send(String email) {
        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.163.com");  //smtp服务器地址，可以使用别的
        p.put("mail.smtp.auth", "true");
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("(您的163邮箱)","(您的邮箱密码)");
            }
        };
        //获得一个带有authenticator的session实例
        Session sendMailSession = Session.getDefaultInstance(p,authenticator);
        Message mailMessage = new MimeMessage(sendMailSession);

        //产生4位验证码
        Random r = new Random();
        StringBuffer captcha1 = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            captcha1.append(r.nextInt(9)+"");
        }
        String captcha = new String(captcha1);

        try {
            System.out.println("I'm sending...");
            Address from = new InternetAddress("mlw6198@163.com");
            //设置发出方
            mailMessage.setFrom(from);
            Address to = new InternetAddress(email);//设置接收人员
            mailMessage.setRecipient(Message.RecipientType.TO, to);
            mailMessage.setSubject("验证码");//设置邮件标题
            mailMessage.setText(captcha); //设置邮件内容
            // 发送邮件
            Transport.send(mailMessage);
            return captcha;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        SendEmailUtil.send("977986310@qq.com");
    }

}
