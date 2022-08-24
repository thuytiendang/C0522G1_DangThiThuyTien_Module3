package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controller.CustomerListServlet", value = "/CustomerList")
public class CustomerListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> customer = new ArrayList<>();
        customer.add(new Customer("Huỳnh Trung Thuyên","16/08/1994","Huế","https://andy.codegym.vn/storage/images/avatars/315576ef640f054d61b664a9087f8346.jpeg"));
        customer.add(new Customer("Huỳnh Trung Thuyên","16/08/1994","Huế","https://andy.codegym.vn/storage/images/avatars/315576ef640f054d61b664a9087f8346.jpeg"));
        customer.add(new Customer("Huỳnh Trung Thuyên","16/08/1994","Huế","https://andy.codegym.vn/storage/images/avatars/315576ef640f054d61b664a9087f8346.jpeg"));
        customer.add(new Customer("Huỳnh Trung Thuyên","16/08/1994","Huế","https://andy.codegym.vn/storage/images/avatars/315576ef640f054d61b664a9087f8346.jpeg"));
        customer.add(new Customer("Huỳnh Trung Thuyên","16/08/1994","Huế","https://andy.codegym.vn/storage/images/avatars/315576ef640f054d61b664a9087f8346.jpeg"));
        customer.add(new Customer("Huỳnh Trung Thuyên","16/08/1994","Huế","https://andy.codegym.vn/storage/images/avatars/315576ef640f054d61b664a9087f8346.jpeg"));

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("customer", customer);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
