package service.contract.impl;

import model.contract.ContractDetail;
import repository.contract.IContractDetailRepository;
import repository.contract.impl.ContractDetailRepository;
import service.contract.IContractDetailService;

import java.util.List;

public class ContractDetailService implements IContractDetailService {
    private IContractDetailRepository iContractDetailRepository = new ContractDetailRepository();

    @Override
    public List<ContractDetail> showListContractDetail() {
        return iContractDetailRepository.showListContractDetail();
    }

    @Override
    public boolean create(ContractDetail contractDetail) {
        return iContractDetailRepository.create(contractDetail);
    }

    @Override
    public List<ContractDetail> showAttachFacility(int id) {
        return iContractDetailRepository.showAttachFacility(id);
    }
}
