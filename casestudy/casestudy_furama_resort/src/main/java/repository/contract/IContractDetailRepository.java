package repository.contract;

import model.contract.ContractDetail;
import model.employee.Position;

import java.util.List;

public interface IContractDetailRepository {
    List<ContractDetail> showListContractDetail();

    boolean create(ContractDetail contractDetail);

    List<ContractDetail> showAttachFacility(int id);
}
