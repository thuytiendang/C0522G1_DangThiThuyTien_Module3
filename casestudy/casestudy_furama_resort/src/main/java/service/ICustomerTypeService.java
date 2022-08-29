package service;

import model.CustomerType;

import java.util.List;

public interface ICustomerTypeService {
    List<CustomerType> findByAll();
}
