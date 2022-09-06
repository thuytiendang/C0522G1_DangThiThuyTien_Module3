package service.customer;

import model.customer.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> showListCustomer();

    Map<String, String> addNewCustomer(Customer customer);

    void deleteCustomer(int id);

    void updateCustomer(Customer customer);

    Customer findById(int id);

    List<Customer> search(String nameS, String addressS, String phoneS);
}
