package repository.employee.impl;

import model.employee.Division;
import model.employee.EducationDegree;
import repository.BaseRepository;
import repository.employee.IEducationDegreeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegreeRepository {
    private static final String FIND_ALL = "select * from education_degree;";
    @Override
    public List<EducationDegree> showListEducationDegree() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int educationDegreeId = resultSet.getInt("education_degree_id");
                String educationDegreeName = resultSet.getString("education_degree_name");
                educationDegreeList.add(new EducationDegree(educationDegreeId,educationDegreeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return educationDegreeList;
    }
}
