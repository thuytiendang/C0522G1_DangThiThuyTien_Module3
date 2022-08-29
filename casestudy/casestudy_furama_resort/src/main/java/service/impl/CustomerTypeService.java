package service.impl;

import model.CustomerType;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerTypeRepository;
import service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    private ICustomerTypeRepository iCustomerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> findByAll() {
        return iCustomerTypeRepository.findByAll();
    }
}
