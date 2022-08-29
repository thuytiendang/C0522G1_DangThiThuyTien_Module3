package service;

import model.User;

import java.util.List;

public interface IUserService {
    boolean add(User user);

    User selectUser(int id);

    List<User> findByAll();

    boolean delete(int id);

    boolean update(User user);

    List<User> findByCountry(String country);

    List<User> sortByName();
}
