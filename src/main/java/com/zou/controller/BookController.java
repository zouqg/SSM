package com.zou.controller;

import com.zou.pojo.Books;
import com.zou.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelExtensionsKt;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;


    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list",list);
        return "allBook";
    }

    @RequestMapping("/AddPaper")
    public String toAddPaper(){
        return "addBook";
    }

    // 添加书籍请求
    @RequestMapping("/addBook")
    public String addBook(Books books){
        System.out.println(books);
        bookService.addBook(books);
        return "redirect:/book/allBook";  //重定向到我们的@RequestMapping("/allBook")
    }

    // 跳转到修改页面
    @RequestMapping("/update")
    public String toUpdateBook(int id, Model model){
        Books book = bookService.queryBookById(id);
        model.addAttribute("QBook",book);
        return "updateBook";
    }

    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        System.out.println(books);
        bookService.updateBook(books);
        return "redirect:/book/allBook";  //重定向到我们的@RequestMapping("/allBook") 自带查询功能
    }

    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){
        System.out.println(id);
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }

    @RequestMapping("/queryBook")
    public String queryBook(String queryBookName,Model model){
        Books books = bookService.queryBookByName(queryBookName);
        List<Books> list = new ArrayList<>();
        list.add(books);
        if(books==null){
            list = bookService.queryAllBook();
            model.addAttribute("error","未查到");
        }
        model.addAttribute("list",list);
        return "allBook";
    }

}
