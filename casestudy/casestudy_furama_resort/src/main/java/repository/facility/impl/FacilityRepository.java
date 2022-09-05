package repository.facility.impl;

import model.customer.Customer;
import model.employee.Employee;
import model.facility.Facility;
import repository.BaseRepository;
import repository.facility.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static final String SELECT_ALL = "select * from facility where is_delete = 0;";
    private static final String FIND_BY_ID = "select * from facility where facility_id=? and is_delete = 0;";
    private static final String CREATE_FACILITY = "insert into facility(facility_name, facility_area, facility_cost, " +
            "max_people, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, " +
            "rent_type_id, facility_type_id) values(?,?,?,?,?,?,?,?,?,?,?);";
    private static final String DELETE_FACILITY = "update facility set is_delete = 1 where facility_id = ? and is_delete = 0;";
    private static final String UPDATE_FACILITY = "update facility set facility_name = ?, facility_area = ?, " +
            "facility_cost = ?, max_people = ?,standard_room = ?,description_other_convenience = ?, pool_area = ?, " +
            "number_of_floors = ?, facility_free = ?, rent_type_id = ?, facility_type_id = ? where facility_id = ? and is_delete = 0;";
    private static final String SEARCH = "select * from facility f\n" +
            "join facility_type ft on f.facility_type_id = ft.facility_type_id\n" +
            "where f.is_delete = 0 and f.facility_name like ? and ft.facility_type_name like ?;";

    @Override
    public List<Facility> showListFacility() {
        List<Facility> facilities = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("facility_id");
                String name = resultSet.getString("facility_name");
                int area = resultSet.getInt("facility_area");
                double cost = resultSet.getDouble("facility_cost");
                int maxPeople = resultSet.getInt("max_people");
                String standardRoom = resultSet.getString("standard_room");
                String otherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int floor = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                int rentTypeId = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("facility_type_id");
                facilities.add(new Facility(id, name, area, cost, maxPeople, standardRoom, otherConvenience, poolArea, floor, facilityFree,
                        rentTypeId, facilityTypeId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilities;
    }

    @Override
    public void addNewFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_FACILITY);
            preparedStatement.setString(1, facility.getFacilityName());
            preparedStatement.setInt(2, facility.getFacilityArea());
            preparedStatement.setDouble(3, facility.getFacilityCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getNumberOfFloors());
            preparedStatement.setString(9, facility.getFacilityFree());
            preparedStatement.setInt(10, facility.getRentTypeId());
            preparedStatement.setInt(11, facility.getFacilityTypeId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FACILITY);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FACILITY);
            preparedStatement.setString(1, facility.getFacilityName());
            preparedStatement.setInt(2, facility.getFacilityArea());
            preparedStatement.setDouble(3, facility.getFacilityCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getNumberOfFloors());
            preparedStatement.setString(9, facility.getFacilityFree());
            preparedStatement.setInt(10, facility.getRentTypeId());
            preparedStatement.setInt(11, facility.getFacilityTypeId());
            preparedStatement.setInt(12, facility.getFacilityId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Facility findById(int id) {
        Facility facility = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int facilityId = resultSet.getInt("facility_id");
                String name = resultSet.getString("facility_name");
                int area = resultSet.getInt("facility_area");
                double cost = resultSet.getDouble("facility_cost");
                int maxPeople = resultSet.getInt("max_people");
                String standardRoom = resultSet.getString("standard_room");
                String otherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int floor = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                int rentTypeId = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("facility_type_id");
                facility = new Facility(facilityId, name, area, cost, maxPeople, standardRoom, otherConvenience, poolArea, floor, facilityFree,
                        rentTypeId, facilityTypeId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }

    @Override
    public List<Facility> search(String facilityName, String facilityTypeName) {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + facilityName + "%");
            preparedStatement.setString(2, "%" + facilityTypeName + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int facilityId = resultSet.getInt("facility_id");
                String name = resultSet.getString("facility_name");
                int area = resultSet.getInt("facility_area");
                double cost = resultSet.getDouble("facility_cost");
                int maxPeople = resultSet.getInt("max_people");
                String standardRoom = resultSet.getString("standard_room");
                String otherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int floor = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                int rentTypeId = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("facility_type_id");
                facilityList.add(new Facility(facilityId, name, area, cost, maxPeople, standardRoom, otherConvenience, poolArea, floor, facilityFree,
                        rentTypeId, facilityTypeId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }
}
