package repository.customer.impl;

import model.customer.Customer;
import repository.customer.ICustomerRepository;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL = "select * from customer where is_delete = 0;";
    private static final String FIND_BY_ID = "select * from customer where customer_id=? and is_delete = 0;";
    private static final String CREATE_CUSTOMER = "insert into customer(customer_name,customer_birthday,customer_gender, " +
            "customer_id_card, customer_phone, customer_email, customer_address, customer_type_id) values(?,?,?,?,?,?,?,?);";
    private static final String DELETE_CUSTOMER = "update customer set is_delete = 1 where customer_id=? and is_delete = 0;";
    private static final String UPDATE_CUSTOMER = "update customer set customer_name = ?, customer_birthday = ?, " +
            "customer_gender = ?, customer_id_card= ?,customer_phone=?,customer_email = ?, customer_address=?, " +
            "customer_type_id =? where customer_id = ? and is_delete = 0;";
    private static final String SEARCH = "select * from customer where customer_name like ? and customer_address like ?" +
            " and customer_phone like ? and is_delete = 0;";

    @Override
    public List<Customer> showListCustomer() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                customers.add(new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public void addNewCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_CUSTOMER);
            preparedStatement.setString(1, customer.getCustomerName());
            preparedStatement.setString(2, customer.getCustomerBirthday());
            preparedStatement.setInt(3, customer.getCustomerGender());
            preparedStatement.setString(4, customer.getCustomerIdCard());
            preparedStatement.setString(5, customer.getCustomerPhone());
            preparedStatement.setString(6, customer.getCustomerEmail());
            preparedStatement.setString(7, customer.getCustomerAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setString(1, customer.getCustomerName());
            preparedStatement.setString(2, customer.getCustomerBirthday());
            preparedStatement.setInt(3, customer.getCustomerGender());
            preparedStatement.setString(4, customer.getCustomerIdCard());
            preparedStatement.setString(5, customer.getCustomerPhone());
            preparedStatement.setString(6, customer.getCustomerEmail());
            preparedStatement.setString(7, customer.getCustomerAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());
            preparedStatement.setInt(9, customer.getCustomerId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customerId = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                customer = new Customer(customerId, name, birthday, gender, idCard, phone, email, address, customerTypeId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public List<Customer> search(String nameS, String addressS, String phoneS) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + nameS + "%");
            preparedStatement.setString(2, "%" + addressS + "%");
            preparedStatement.setString(3, "%" + phoneS + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
          while (resultSet.next()){
                int customerId = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                customerList.add(new Customer(customerId, name, birthday, gender, idCard, phone, email, address, customerTypeId)) ;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

}
