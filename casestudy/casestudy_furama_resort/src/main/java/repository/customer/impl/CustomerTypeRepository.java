package repository.customer.impl;

import model.customer.CustomerType;
import repository.customer.ICustomerTypeRepository;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private static final String FIND_ALL = "select * from customer_type;";

    @Override
    public List<CustomerType> showListTypeCustomer() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customerTypeId = resultSet.getInt("customer_type_id");
                String customerTypeName = resultSet.getString("customer_type_name");
                customerTypes.add(new CustomerType(customerTypeId, customerTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypes;
    }

}
