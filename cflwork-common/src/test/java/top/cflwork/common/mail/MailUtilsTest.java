package top.cflwork.common.mail;

import org.junit.Test;
import top.cflwork.enums.ContentTypeEnum;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * 邮件发送器测试类<br />
 * 创建于2017-09-14
 *
 * @author 陈飞龙
 */
public class MailUtilsTest {

    @Test
    public void testSendMail() throws MessagingException {
        Mail mail = new Mail();
        mail.setSubject("subject");
        List<MailAccount> mailAccountList = new ArrayList<>();
        mailAccountList.add(new MailAccount("wgssmarter@126.com"));
        mailAccountList.add(new MailAccount("847315251@qq.com"));
        mail.setRecipients(mailAccountList);
        mail.setContent("hello");
        mail.setContentType(ContentTypeEnum.HTML.getValue());
        List<String> files = new ArrayList<>();
        files.add("src/main/resources/config/mail.properties");
        mail.setFiles(files);
        MailUtils.sendMail("classpath:/config/mail.properties", mail);
    }
}
