package service.facility.impl;

import model.facility.Facility;
import repository.facility.IFacilityRepository;
import repository.facility.impl.FacilityRepository;
import service.facility.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IFacilityRepository iFacilityRepository = new FacilityRepository();

    @Override
    public List<Facility> showListFacility() {
        return iFacilityRepository.showListFacility();
    }

    @Override
    public boolean addNewFacility(Facility facility) {
        iFacilityRepository.addNewFacility(facility);
        return false;
    }

    @Override
    public void deleteFacility(int id) {
        iFacilityRepository.deleteFacility(id);
    }

    @Override
    public void updateFacility(Facility facility) {
        iFacilityRepository.updateFacility(facility);
    }

    @Override
    public Facility findById(int id) {
        return iFacilityRepository.findById(id);
    }

    @Override
    public List<Facility> search(String facilityName, String facilityTypeName) {
        return iFacilityRepository.search(facilityName, facilityTypeName);
    }
}
