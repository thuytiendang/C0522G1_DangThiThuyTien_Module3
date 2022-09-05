package service.employee.impl;

import model.employee.Employee;
import repository.employee.IEmployeeRepository;
import repository.employee.impl.EmployeeRepository;
import service.employee.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository iEmployeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> showListEmployee() {
        return iEmployeeRepository.showListEmployee();
    }

    @Override
    public boolean addNewEmployee(Employee employee) {
        iEmployeeRepository.addNewEmployee(employee);
        return false;
    }

    @Override
    public void deleteEmployee(int id) {
        iEmployeeRepository.deleteEmployee(id);
    }

    @Override
    public void updateEmployee(Employee employee) {
        iEmployeeRepository.updateEmployee(employee);
    }

    @Override
    public Employee findById(int id) {
        return iEmployeeRepository.findById(id);
    }

    @Override
    public List<Employee> search(String nameS, String addressS, String phoneS) {
        return iEmployeeRepository.search(nameS, addressS, phoneS);
    }
}
