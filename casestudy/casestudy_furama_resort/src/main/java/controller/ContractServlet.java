package controller;

import model.contract.AttachFacility;
import model.contract.Contract;
import model.contract.ContractDetail;
import model.customer.Customer;
import model.employee.Employee;
import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.contract.IAttachFacilityService;
import service.contract.IContractDetailService;
import service.contract.IContractService;
import service.contract.impl.AttachFacilityService;
import service.contract.impl.ContractDetailService;
import service.contract.impl.ContractService;
import service.customer.ICustomerService;
import service.customer.impl.CustomerService;
import service.employee.IEmployeeService;
import service.employee.impl.EmployeeService;
import service.facility.IFacilityService;
import service.facility.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    private IAttachFacilityService iAttachFacilityService = new AttachFacilityService();
    private IContractDetailService iContractDetailService = new ContractDetailService();
    private IContractService iContractService = new ContractService();
    private IFacilityService iFacilityService = new FacilityService();
    private ICustomerService iCustomerService = new CustomerService();
    private IEmployeeService iEmployeeService = new EmployeeService();

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
            case "show":
                showAttachFacility(request, response);
                break;
            case "add":
                addContractDetail(request, response);
            default:
                showContractList(request, response);
        }
    }

    private void addContractDetail(HttpServletRequest request, HttpServletResponse response) {

    }


    private void showAttachFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        List<ContractDetail> contractDetailList = iContractDetailService.showAttachFacility(id);
        List<AttachFacility> attachFacilityList = iAttachFacilityService.showListAttachFacility();

        request.setAttribute("contractDetailList", contractDetailList);
        request.setAttribute("attachFacilityList", attachFacilityList);
        iContractDetailService.showAttachFacility(id);

        try {
            response.sendRedirect("/contract");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<AttachFacility> attachFacilityList = iAttachFacilityService.showListAttachFacility();
        List<ContractDetail> contractDetailList = iContractDetailService.showListContractDetail();
        List<Facility> facilityList = iFacilityService.showListFacility();
        List<Customer> customerList = iCustomerService.showListCustomer();
        List<Employee> employeeList = iEmployeeService.showListEmployee();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/contract/create.jsp");
        request.setAttribute("attachFacilityList", attachFacilityList);
        request.setAttribute("contractDetailList", contractDetailList);
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("customerList", customerList);
        request.setAttribute("employeeList", employeeList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showContractList(HttpServletRequest request, HttpServletResponse response) {
        String msg = request.getParameter("msg");
        List<Contract> contractList = iContractService.showListContract();
        List<AttachFacility> attachFacilityList = iAttachFacilityService.showListAttachFacility();
        List<ContractDetail> contractDetailList = iContractDetailService.showListContractDetail();
        List<Facility> facilityList = iFacilityService.showListFacility();
        List<Customer> customerList = iCustomerService.showListCustomer();
        List<Employee> employeeList = iEmployeeService.showListEmployee();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/contract/list.jsp");
        request.setAttribute("contractList", contractList);
        request.setAttribute("attachFacilityList", attachFacilityList);
        request.setAttribute("contractDetailList", contractDetailList);
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("customerList", customerList);
        request.setAttribute("employeeList", employeeList);
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
                createContract(request, response);
                break;
            default:
        }
    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int facilityId = Integer.parseInt(request.getParameter("facilityId"));
        double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
        boolean check = iContractService.addNewContract(new Contract(startDate, endDate, deposit, employeeId, customerId,facilityId, totalMoney));
        String mess = "Add new contract successfully!";
        if (check) {
            mess = "Can not add new contract!";
        }

        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }
}
