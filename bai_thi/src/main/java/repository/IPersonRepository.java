package repository;

import model.Person;

import java.util.List;

public interface IPersonRepository {
    List<Person> showList();

    boolean addNew(Person person);

    void delete(int id);

    void update(Person person);

    Person findById(int id);

//    List<Person> search(String nameS, String addressS, String phoneS);
}
