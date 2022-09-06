package repository.impl;

import model.Person;
import repository.BaseRepository;
import repository.IPersonRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonRepository implements IPersonRepository {
    private static final String FIND_ALL = "select * from person;";

    @Override
    public List<Person> showList() {
        List<Person> personList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                System.out.println(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return personList;
    }

    @Override
    public boolean addNew(Person person) {
        return false;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(Person person) {

    }

    @Override
    public Person findById(int id) {
        return null;
    }
}
