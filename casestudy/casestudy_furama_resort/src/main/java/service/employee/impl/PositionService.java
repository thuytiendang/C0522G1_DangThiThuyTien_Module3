package service.employee.impl;

import model.employee.Position;
import repository.employee.IPositionRepository;
import repository.employee.impl.PositionRepository;
import service.employee.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    private IPositionRepository iPositionRepository = new PositionRepository();
    @Override
    public List<Position> showListPosition() {
        return iPositionRepository.showListPosition();
    }
}
