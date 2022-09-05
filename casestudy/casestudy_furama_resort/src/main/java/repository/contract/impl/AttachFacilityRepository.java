package repository.contract.impl;

import model.contract.AttachFacility;
import model.contract.ContractDetail;
import repository.BaseRepository;
import repository.contract.IAttachFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachFacilityRepository implements IAttachFacilityRepository {
    private static final String FIND_ALL = "select * from attach_facility;";
    @Override
    public List<AttachFacility> showListAttachFacility() {
        List<AttachFacility> attachFacilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int attachFacilityId = resultSet.getInt("attach_facility_id");
                String attachFacilityName = resultSet.getString("attach_facility_name");
                double attachFacilityCost = resultSet.getDouble("attach_facility_cost");
                String attachFacilityUnit = resultSet.getString("attach_facility_unit");
                String attachFacilityStatus = resultSet.getString("attach_facility_status");
                attachFacilityList.add(new AttachFacility(attachFacilityId, attachFacilityName, attachFacilityCost, attachFacilityUnit, attachFacilityStatus));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attachFacilityList;
    }
}
