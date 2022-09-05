package service.contract.impl;

import model.contract.Contract;
import repository.contract.IContractRepository;
import repository.contract.impl.ContractRepository;
import service.contract.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    private IContractRepository iContractRepository = new ContractRepository();

    @Override
    public List<Contract> showListContract() {
        return iContractRepository.showListContract();
    }

    @Override
    public boolean addNewContract(Contract contract) {
        iContractRepository.addNewContract(contract);
        return false;
    }
}
