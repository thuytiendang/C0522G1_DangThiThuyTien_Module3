package repository.employee.impl;

import model.customer.Customer;
import model.employee.Employee;
import repository.BaseRepository;
import repository.employee.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String SELECT_ALL = "select * from employee where is_delete = 0;";
    private static final String FIND_BY_ID = "select * from employee where employee_id = ? and is_delete = 0;";
    private static final String CREATE_EMPLOYEE = "insert into employee(employee_name, employee_birthday, employee_id_card, " +
            "employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id," +
            " division_id) values(?,?,?,?,?,?,?,?,?,?);";
    private static final String DELETE_EMPLOYEE = "update employee set is_delete = 1 where employee_id = ? and is_delete = 0;";
    private static final String UPDATE_EMPLOYEE = "update employee set employee_name = ?, employee_birthday = ?, " +
            "employee_id_card = ?, employee_salary = ?, employee_phone = ?, employee_email = ?, employee_address = ?, " +
            "position_id = ?, education_degree_id = ?, division_id = ? where employee_id = ? and is_delete = 0;";
    private static final String SEARCH = "select * from employee where employee_name like ? and employee_address like ?" +
            " and employee_phone like ? and is_delete = 0;";

    @Override
    public List<Employee> showListEmployee() {
        List<Employee> employees = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = Double.parseDouble(resultSet.getString("employee_salary"));
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                employees.add(new Employee(id, name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    @Override
    public void addNewEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_EMPLOYEE);
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    @Override
    public void deleteEmployee(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE);
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setInt(11, employee.getEmployeeId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Employee findById(int id) {
        Employee employee = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int employeeId = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = Double.parseDouble(resultSet.getString("employee_salary"));
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                employee = new Employee(employeeId, name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Employee> search(String nameS, String addressS, String phoneS) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + nameS + "%");
            preparedStatement.setString(2, "%" + addressS + "%");
            preparedStatement.setString(3, "%" + phoneS + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = Double.parseDouble(resultSet.getString("employee_salary"));
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                employeeList.add(new Employee(id, name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }
}

