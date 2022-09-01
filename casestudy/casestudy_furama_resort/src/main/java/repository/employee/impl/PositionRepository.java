package repository.employee.impl;

import model.employee.Division;
import model.employee.Position;
import repository.BaseRepository;
import repository.employee.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private static final String FIND_ALL = "select * from `position`;";

    @Override
    public List<Position> showListPosition() {
        List<Position> positionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int positionId = resultSet.getInt("position_id");
                String positionName = resultSet.getString("position_name");
                positionList.add(new Position(positionId, positionName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positionList;
    }
}

