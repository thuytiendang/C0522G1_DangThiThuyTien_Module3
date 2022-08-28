package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void add(User user);

    User selectUser(int id);

    List<User> findByAll();

    boolean delete(int id);

    boolean update(User user);

    List<User> findByCountry(String country);

    List<User> sortByName();
}
