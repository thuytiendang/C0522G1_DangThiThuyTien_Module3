package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import service.customer.ICustomerService;
import service.customer.ICustomerTypeService;
import service.customer.impl.CustomerService;
import service.customer.impl.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerService();
    private ICustomerTypeService iCustomerTypeService = new CustomerTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            default:
                showCustomerList(request, response);
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        String address = request.getParameter("searchAddress");
        String phone = request.getParameter("searchPhone");
        List<Customer> customerList = iCustomerService.search(name, address, phone);
        List<CustomerType> customerTypeList = iCustomerTypeService.showListCustomer();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = iCustomerTypeService.showListCustomer();
        int id = Integer.parseInt(request.getParameter("customer_id"));
        Customer customer = iCustomerService.findById(id);
        RequestDispatcher requestDispatcher;
        if (customer == null) {
            requestDispatcher = request.getRequestDispatcher("error_404.jsp");
        } else {
            request.setAttribute("customer", customer);
            request.setAttribute("customerTypeList", customerTypeList);
            requestDispatcher = request.getRequestDispatcher("view/customer/update.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("customer_id"));
        iCustomerService.deleteCustomer(id);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = iCustomerTypeService.showListCustomer();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        String msg = request.getParameter("msg");
        List<Customer> customerList = iCustomerService.showListCustomer();
        List<CustomerType> customerTypeList = iCustomerTypeService.showListCustomer();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        request.setAttribute("msg", msg);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "update":
                updateCustomer(request, response);
                break;

            default:
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customer = new Customer(customerId, customerName, customerBirthday, customerGender, customerIdCard,
                customerPhone, customerEmail, customerAddress, customerTypeId);
        iCustomerService.updateCustomer(customer);
        try {
            response.sendRedirect("/customer?msg=Update%20customer's%20information%20successfully!");
        } catch (IOException e) {
            e.printStackTrace();
        }
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/update.jsp");
//        request.setAttribute("mess", "Update customer's information successfully!");
//        try {
//            requestDispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }


    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customer = new Customer(customerName, customerBirthday, customerGender, customerIdCard, customerPhone, customerEmail, customerAddress, customerTypeId);
        boolean check = iCustomerService.addNewCustomer(customer);
        String mess = "Add new customer successfully!";
        if (check) {
            mess = "Can not add new customer!";
        }

        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }
}
