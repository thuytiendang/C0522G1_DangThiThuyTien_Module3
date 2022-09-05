package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import service.employee.IDivisionService;
import service.employee.IEducationDegreeService;
import service.employee.IEmployeeService;
import service.employee.IPositionService;
import service.employee.impl.DivisionService;
import service.employee.impl.EducationDegreeService;
import service.employee.impl.EmployeeService;
import service.employee.impl.PositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IPositionService iPositionService = new PositionService();
    private IDivisionService iDivisionService = new DivisionService();
    private IEducationDegreeService iEducationDegreeService = new EducationDegreeService();
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
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            default:
                showEmployeeList(request, response);
        }
    }

    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        String msg = request.getParameter("msg");
        List<Employee> employeeList = iEmployeeService.showListEmployee();
        List<Division> divisionList = iDivisionService.showListDivision();
        List<Position> positionList = iPositionService.showListPosition();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.showListEducationDegree();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("msg", msg);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        String address = request.getParameter("searchAddress");
        String phone = request.getParameter("searchPhone");
        List<Employee> employeeList = iEmployeeService.search(name,address,phone);
        List<Division> divisionList = iDivisionService.showListDivision();
        List<Position> positionList = iPositionService.showListPosition();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.showListEducationDegree();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("employeeId"));
        iEmployeeService.deleteEmployee(id);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Division> divisionList = iDivisionService.showListDivision();
        List<Position> positionList = iPositionService.showListPosition();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.showListEducationDegree();
        int id = Integer.parseInt(request.getParameter("employee_id"));
        Employee employee = iEmployeeService.findById(id);
        RequestDispatcher requestDispatcher;
        if (employee == null) {
            requestDispatcher = request.getRequestDispatcher("error_404.jsp");
        } else {
            request.setAttribute("employee", employee);
            request.setAttribute("divisionList", divisionList);
            request.setAttribute("positionList", positionList);
            request.setAttribute("educationDegreeList", educationDegreeList);
            requestDispatcher = request.getRequestDispatcher("view/employee/update.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Division> divisionList = iDivisionService.showListDivision();
        List<Position> positionList = iPositionService.showListPosition();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.showListEducationDegree();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
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
                createEmployee(request, response);
                break;
            case "update":
                updateEmployee(request, response);
                break;
            default:
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId);
        iEmployeeService.updateEmployee(employee);
        try {
            response.sendRedirect("/employee?msg=Update%20employee's%20information%20successfully!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Employee employee = new Employee(employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId);
        boolean check = iEmployeeService.addNewEmployee(employee);
        String mess = "Add new employee successfully!";;
        if (!check) {
            mess = "Can not add new employee!";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }
}
