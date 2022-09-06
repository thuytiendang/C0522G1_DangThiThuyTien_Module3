package service;

import model.Person;

import java.util.List;
import java.util.Map;

public interface IPersonService {
    List<Person> showList();

    Map<String, String> addNew(Person person);

    void delete(int id);

    void update(Person person);

    Person findById(int id);
}
