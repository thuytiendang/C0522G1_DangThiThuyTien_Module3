package service.facility;

import model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> showListFacility();

    boolean addNewFacility(Facility facility);

    void deleteFacility(int id);

    void updateFacility(Facility facility);

    Facility findById(int id);

    List<Facility> search(String facilityName, String facilityTypeName);
}
