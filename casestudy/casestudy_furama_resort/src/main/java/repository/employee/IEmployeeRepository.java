package repository.employee;

import model.customer.Customer;
import model.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> showListEmployee();

    void addNewEmployee(Employee employee);

    void deleteEmployee(int id);

    void updateEmployee(Employee employee);

    Employee findById(int id);

    List<Employee> search(String nameS, String addressS, String phoneS);
}
