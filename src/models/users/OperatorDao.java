package models.users;

/**
 * Created by guptash on 7/26/2017.
 */
public interface OperatorDao {
    public int add_vstock(String model_no, int n, String loginuser);
    public int remove_vstock(String model_no, int n, String loginuser);
    public int add_sstock(String model_no, int n, String loginuser);
    public int remove_sstock(String model_no, int n, String loginuser);
}
