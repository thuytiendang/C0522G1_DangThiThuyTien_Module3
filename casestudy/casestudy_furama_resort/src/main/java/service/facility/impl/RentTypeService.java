package service.facility.impl;

import model.facility.RentType;
import repository.facility.IRentTypeRepository;
import repository.facility.impl.RentTypeRepository;
import service.facility.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    private IRentTypeRepository iRentTypeRepository = new RentTypeRepository();
    @Override
    public List<RentType> showListRentType() {
        return iRentTypeRepository.showListRentType();
    }
}
