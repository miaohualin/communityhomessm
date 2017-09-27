package neu.action;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;
/**
 * Created by 黄宇航 on 2017/9/23.
 */
public class RegisterAction {

    private static final char[] CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8',
            '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M',
            'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    private static final String username = "kk29299@163.com";//发件人的邮箱地址
    private static final String password = "kk28288.";//发件人的邮箱密码
    private static Properties props = null;
    private static Address sender = null;
    private static Session mailConnection = null;
    volatile private static RegisterAction instance = null;

    private RegisterAction(){}

    public static RegisterAction getInstance(){
        if (instance == null){
            try {
                Thread.sleep(50);

                synchronized (RegisterAction.class){
                    if (instance == null){
                        instance = new RegisterAction();
                        connet();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;
    }

    private static void connet() {
        props = new Properties();
        props.put("mail.smtp.host", "smtp.163.com");
        props.put("mail.smtp.auth", true);
        mailConnection = Session.getDefaultInstance(props, null);

        try {
            sender = new InternetAddress(username);
        } catch (AddressException e) {
            e.printStackTrace();
        }
    }

    public boolean sendEmail(String address,String code) {
        String text = new String("This is your code:" + code + " please input the code in the designated spot.Wish you a happy day.\nSend time" + new Date());

        try {
            Message msg = new MimeMessage(mailConnection);
            Address receiver = new InternetAddress(address);
            Multipart mtp = new MimeMultipart();
            BodyPart mdp = new MimeBodyPart();
            Transport trans = mailConnection.getTransport("smtp");

            msg.setFrom(sender);
            msg.setRecipient(Message.RecipientType.TO, receiver);
            msg.setSubject("Check your code:Register for the cardsystem" + text);


            mdp.setContent(text, "text/plain");
            mtp.addBodyPart(mdp);
            msg.setContent(mtp);
            msg.saveChanges();
            trans.connect("smtp.163.com", username, password);
            trans.sendMessage(msg, msg.getAllRecipients());
            trans.close();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getRandomCode() {
        StringBuilder stra = new StringBuilder("");
        Random random = new Random(new Date().getTime());

        for (int i = 0; i < 4; i++) {
            stra.append(CHARS[random.nextInt(CHARS.length)]);
        }

        return stra.toString();
    }
}
