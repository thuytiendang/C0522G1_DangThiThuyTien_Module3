package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findByAll();

    void add(Customer customer);

    void delete(int id);

    void update(Customer customer);
}
