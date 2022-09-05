package repository.facility;

import model.customer.CustomerType;
import model.facility.RentType;

import java.util.List;

public interface IRentTypeRepository {
    List<RentType> showListRentType();
}
