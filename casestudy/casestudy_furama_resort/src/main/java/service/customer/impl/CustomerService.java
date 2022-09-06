package service.customer.impl;

import common.Validation;
import model.customer.Customer;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> showListCustomer() {
        return iCustomerRepository.showListCustomer();
    }

    @Override
    public Map<String, String> addNewCustomer(Customer customer) {
        Map<String, String> map = new HashMap<>();
        if (customer.getCustomerName().length() == 0) {
            map.put("empty_name", "Tên không đc để trống");
        } else if (!Validation.validateName(customer.getCustomerName())) {
            map.put("invalid_name", "Sai định dạng tên");
        }

        if (customer.getCustomerPhone().length() == 0) {
            map.put("empty_phone", "Số điện thoại không đc để trống");
        } else if (!Validation.validatePhone(customer.getCustomerPhone())) {
            map.put("invalid_phone", "Sai định dạng số điện thoại");
        }

        if (customer.getCustomerIdCard().length() == 0) {
            map.put("empty_IDCard", "Số Căn cước công dân không đc để trống");
        } else if (!Validation.validateIDCard(customer.getCustomerIdCard())) {
            map.put("invalid_IDCard", "Sai định dạng số căn cước công dân");
        }

        if (customer.getCustomerEmail().length() == 0) {
            map.put("empty_email", "Email không đc để trống");
        } else if (!Validation.validateEmail(customer.getCustomerEmail())) {
            map.put("invalid_email", "Sai định dạng Email");
        }

        if (customer.getCustomerBirthday().length() == 0) {
            map.put("empty_birthday", "Ngày sinh không đc để trống");
        }

        if (map.isEmpty()) {
            if (!iCustomerRepository.addNewCustomer(customer)){
                map.put("error","Không thể tạo mới");
            }
        }

        return map;
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
        return iCustomerRepository.search(nameS, addressS, phoneS);
    }


}
