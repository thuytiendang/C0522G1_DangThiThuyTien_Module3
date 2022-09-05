package repository.facility;

import model.customer.Customer;
import model.employee.Employee;
import model.facility.Facility;
import model.facility.RentType;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> showListFacility();

    void addNewFacility(Facility facility);

    void deleteFacility(int id);

    void updateFacility(Facility facility);

    Facility findById(int id);

    List<Facility> search(String facilityName, String facilityTypeName);

}
