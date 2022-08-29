package model;

public class FacilityType {
    private int facilityTypeId;
    private String facilityTypeName;

    public FacilityType() {
    }

    public FacilityType(int facilityTypeId, String facilityTypeName) {
        this.facilityTypeId = facilityTypeId;
        this.facilityTypeName = facilityTypeName;
    }

    public int getFacilityTypeId() {
        return facilityTypeId;
    }

    public void setFacilityTypeId(int facilityTypeId) {
        this.facilityTypeId = facilityTypeId;
    }

    public String getFacilityTypeName() {
        return facilityTypeName;
    }

    public void setFacilityTypeName(String facilityTypeName) {
        this.facilityTypeName = facilityTypeName;
    }
}
