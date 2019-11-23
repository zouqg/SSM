import com.zou.dao.BookMapper;
import com.zou.pojo.Books;
import com.zou.service.BookService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MyTest {

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BookService bookService = (BookService) context.getBean("BookServiceImpl");
        List books = (List) bookService.queryAllBook();
        for (Object book : books) {
            System.out.println(book);
        }
    }

    @Test
    public void test(){
       ApplicationContext context = new ClassPathXmlApplicationContext("spring-dao.xml");
        BookService bean = context.getBean(BookService.class);
        System.out.println(bean.queryAllBook());

    }
}
