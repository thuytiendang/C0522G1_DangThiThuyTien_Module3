package service.customer.impl;

import model.customer.Customer;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> showListCustomer() {
        return iCustomerRepository.showListCustomer();
    }

    @Override
    public boolean addNewCustomer(Customer customer) {
        iCustomerRepository.addNewCustomer(customer);
        return false;
    }

    @Override
    public void deleteCustomer(int id) {
        iCustomerRepository.deleteCustomer(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        iCustomerRepository.updateCustomer(customer);
    }

    @Override
    public Customer findById(int id) {
        return iCustomerRepository.findById(id);
    }

    @Override
    public List<Customer> search(String nameS, String addressS, String phoneS) {
        return iCustomerRepository.search(nameS,addressS,phoneS);
    }


}
