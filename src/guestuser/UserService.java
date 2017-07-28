package guestuser;
;


public class UserService {


    private int serviceid;


    private int reg_no;


    private String vmodel_no;
    private String type;

    private String sdate;


    private String status;


    private String loginuser;


    public UserService() {}
    public UserService(int reg_no, String vmodel_no, String type, String sdate, String status, String loginuser) {
        this.reg_no = reg_no;
        this.vmodel_no = vmodel_no;
        this.type = type;
        this.sdate = sdate;
        this.status = status;
        this.loginuser = loginuser;

    }
    public int getServiceid() {
        return serviceid;
    }

    public void setServiceid(int serviceid) {
        this.serviceid = serviceid;
    }
    public int getReg_no() {
        return reg_no;
    }

    public void setReg_no(int reg_no) {
        this.reg_no = reg_no;
    }
    public String getVmodel_no() {
        return vmodel_no;
    }

    public void setVmodel_no(String vmodel_no) {
        this.vmodel_no = vmodel_no;
    }

    public String getType() {
        return type;
    }

    public void setType(String paytype) {
        this.type = type;
    }
    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public String getLoginuser() {
        return loginuser;
    }

    public void setLoginuser(String loginuser) {
        this.loginuser = loginuser;
    }




}