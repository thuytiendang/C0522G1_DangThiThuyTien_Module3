package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> findByAll() {
        return iCustomerRepository.findByAll();
    }

    @Override
    public void add(Customer customer) {
        iCustomerRepository.add(customer);
    }

    @Override
    public void delete(int id) {
        iCustomerRepository.delete(id);
    }

    @Override
    public void update(Customer customer) {
        iCustomerRepository.update(customer);
    }
}
