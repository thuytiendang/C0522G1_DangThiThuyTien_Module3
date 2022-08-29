package model;

public class RentType {
    private int rentTypeId;
    private String rentTypeName;

    public RentType() {
    }

    public RentType(int rentTypeId, String rentTypeName) {
        this.rentTypeId = rentTypeId;
        this.rentTypeName = rentTypeName;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public String getRentTypeName() {
        return rentTypeName;
    }

    public void setRentTypeName(String rentTypeName) {
        this.rentTypeName = rentTypeName;
    }
}
