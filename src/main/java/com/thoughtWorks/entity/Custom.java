package com.thoughtWorks.entity;

public class Custom {
    private Integer cId;
    private String cName;
    private String cPassword;
    private String cCode;
    private String cOccupation;
    private String cPhone;
    private String cEmail;
    private String cCity;
    private String cIp;
    private String adminName;
    private String parentAccount;
    private String groupUserPrefix;

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getParentAccount() {
        return parentAccount;
    }

    public void setParentAccount(String parentAccount) {
        this.parentAccount = parentAccount;
    }

    public String getGroupUserPrefix() {
        return groupUserPrefix;
    }

    public void setGroupUserPrefix(String groupUserPrefix) {
        this.groupUserPrefix = groupUserPrefix;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcPassword() {
        return cPassword;
    }

    public void setcPassword(String cPassword) {
        this.cPassword = cPassword;
    }

    public String getcCode() {
        return cCode;
    }

    public void setcCode(String cCode) {
        this.cCode = cCode;
    }

    public String getcOccupation() {
        return cOccupation;
    }

    public void setcOccupation(String cOccupation) {
        this.cOccupation = cOccupation;
    }

    public String getcPhone() {
        return cPhone;
    }

    public void setcPhone(String cPhone) {
        this.cPhone = cPhone;
    }

    public String getcEmail() {
        return cEmail;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail;
    }

    public String getcCity() {
        return cCity;
    }

    public void setcCity(String cCity) {
        this.cCity = cCity;
    }

    public String getcIp() {
        return cIp;
    }

    public void setcIp(String cIp) {
        this.cIp = cIp;
    }

    @Override
    public String toString() {
        return "Custom{" +
                "cId=" + cId +
                ", cName='" + cName + '\'' +
                ", cPassword='" + cPassword + '\'' +
                ", cCode='" + cCode + '\'' +
                ", cOccupation='" + cOccupation + '\'' +
                ", cPhone='" + cPhone + '\'' +
                ", cEmail='" + cEmail + '\'' +
                ", cCity='" + cCity + '\'' +
                ", cIp='" + cIp + '\'' +
                ", adminName='" + adminName + '\'' +
                ", parentAccount='" + parentAccount + '\'' +
                ", groupUserPrefix='" + groupUserPrefix + '\'' +
                '}';
    }
}
