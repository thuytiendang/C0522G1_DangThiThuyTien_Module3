package repository.facility.impl;

import model.customer.CustomerType;
import model.facility.RentType;
import repository.BaseRepository;
import repository.facility.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private static final String FIND_ALL = "select * from rent_type;";
    @Override
    public List<RentType> showListRentType() {
        List<RentType> rentTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int rentTypeId = resultSet.getInt("rent_type_id");
                String rentTypeName = resultSet.getString("rent_type_name");
                rentTypes.add(new RentType(rentTypeId, rentTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypes;
    }
}
