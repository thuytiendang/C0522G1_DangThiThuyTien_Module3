package service.contract;

import model.contract.ContractDetail;

import java.util.List;

public interface IContractDetailService {
    List<ContractDetail> showListContractDetail();

    boolean create(ContractDetail contractDetail);

    List<ContractDetail> showAttachFacility(int id);
}
