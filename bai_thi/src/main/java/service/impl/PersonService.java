package service.impl;

import model.Person;
import repository.IPersonRepository;
import repository.impl.PersonRepository;
import service.IPersonService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PersonService implements IPersonService {
    private IPersonRepository iPersonRepository = new PersonRepository();

    @Override
    public List<Person> showList() {
        return iPersonRepository.showList();
    }

    @Override
    public Map<String, String> addNew(Person person) {
        Map<String, String> map = new HashMap<>();

        return map;
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
