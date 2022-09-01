package service.employee.impl;

import model.employee.EducationDegree;
import repository.employee.IEducationDegreeRepository;
import repository.employee.impl.EducationDegreeRepository;
import service.employee.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    private IEducationDegreeRepository iEducationDegreeRepository = new EducationDegreeRepository();

    @Override
    public List<EducationDegree> showListEducationDegree() {
        return iEducationDegreeRepository.showListEducationDegree();
    }
}
