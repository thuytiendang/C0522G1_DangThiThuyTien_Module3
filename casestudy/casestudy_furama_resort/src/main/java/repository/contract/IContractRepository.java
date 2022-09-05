package repository.contract;

import model.contract.Contract;
import model.employee.Employee;

import java.util.List;

public interface IContractRepository {
    List<Contract> showListContract();

    void addNewContract(Contract contract);
}
