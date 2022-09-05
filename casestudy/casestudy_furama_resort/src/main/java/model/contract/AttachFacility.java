package model.contract;

public class AttachFacility {
    private int attachFacilityId;
    private String attachFacilityName;
    private double attachFacilityCost;
    private String attachFacilityUnit;
    private String attachFacilityStatus;

    public AttachFacility() {
    }

    public AttachFacility(int attachFacilityId, String attachFacilityName, double attachFacilityCost,
                          String attachFacilityUnit, String attachFacilityStatus) {
        this.attachFacilityId = attachFacilityId;
        this.attachFacilityName = attachFacilityName;
        this.attachFacilityCost = attachFacilityCost;
        this.attachFacilityUnit = attachFacilityUnit;
        this.attachFacilityStatus = attachFacilityStatus;
    }

    public int getAttachFacilityId() {
        return attachFacilityId;
    }

    public void setAttachFacilityId(int attachFacilityId) {
        this.attachFacilityId = attachFacilityId;
    }

    public String getAttachFacilityName() {
        return attachFacilityName;
    }

    public void setAttachFacilityName(String attachFacilityName) {
        this.attachFacilityName = attachFacilityName;
    }

    public double getAttachFacilityCost() {
        return attachFacilityCost;
    }

    public void setAttachFacilityCost(double attachFacilityCost) {
        this.attachFacilityCost = attachFacilityCost;
    }

    public String getAttachFacilityUnit() {
        return attachFacilityUnit;
    }

    public void setAttachFacilityUnit(String attachFacilityUnit) {
        this.attachFacilityUnit = attachFacilityUnit;
    }

    public String getAttachFacilityStatus() {
        return attachFacilityStatus;
    }

    public void setAttachFacilityStatus(String attachFacilityStatus) {
        this.attachFacilityStatus = attachFacilityStatus;
    }
}
