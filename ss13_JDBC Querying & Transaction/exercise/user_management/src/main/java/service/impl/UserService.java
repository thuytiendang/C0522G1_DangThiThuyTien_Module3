package service.impl;

import model.User;
import repository.IUserRepository;
import repository.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();

    @Override
    public boolean add(User user) {
        iUserRepository.add(user);
        return false;
    }

    @Override
    public User selectUser(int id) {
        return iUserRepository.selectUser(id);
    }

    @Override
    public List<User> findByAll() {
        return iUserRepository.findByAll();
    }

    @Override
    public boolean delete(int id) {
        return iUserRepository.delete(id);
    }

    @Override
    public boolean update(User user) {
        return iUserRepository.update(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return iUserRepository.findByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return iUserRepository.sortByName();
    }
}
