package service.employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> showListEmployee();

    boolean addNewEmployee(Employee employee);

    void deleteEmployee(int id);

    void updateEmployee(Employee employee);

    Employee findById(int id);

    List<Employee> search(String nameS, String addressS, String phoneS);
}
