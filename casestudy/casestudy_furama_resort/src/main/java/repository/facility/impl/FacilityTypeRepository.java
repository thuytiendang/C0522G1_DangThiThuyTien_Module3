package repository.facility.impl;

import model.facility.FacilityType;
import model.facility.RentType;
import repository.BaseRepository;
import repository.facility.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    private static final String FIND_ALL = "select * from facility_type;";
    @Override
    public List<FacilityType> showListFacilityType() {
        List<FacilityType> facilityTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int facilityTypeId = resultSet.getInt("facility_type_id");
                String facilityTypeName = resultSet.getString("facility_type_name");
                facilityTypes.add(new FacilityType(facilityTypeId, facilityTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityTypes;

    }
}
