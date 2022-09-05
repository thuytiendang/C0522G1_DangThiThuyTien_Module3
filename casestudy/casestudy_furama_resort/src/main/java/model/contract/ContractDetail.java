package model.contract;

public class ContractDetail {
    private int contractDetailId;
    private int quantity;
    private int contractId;
    private int contractFacilityId;

    public ContractDetail() {
    }

    public ContractDetail(int contractDetailId, int quantity, int contractId, int contractFacilityId) {
        this.contractDetailId = contractDetailId;
        this.quantity = quantity;
        this.contractId = contractId;
        this.contractFacilityId = contractFacilityId;
    }

    public int getContractDetailId() {
        return contractDetailId;
    }

    public void setContractDetailId(int contractDetailId) {
        this.contractDetailId = contractDetailId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getContractFacilityId() {
        return contractFacilityId;
    }

    public void setContractFacilityId(int contractFacilityId) {
        this.contractFacilityId = contractFacilityId;
    }
}
