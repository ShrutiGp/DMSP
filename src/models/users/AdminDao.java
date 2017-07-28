package models.users;

/**
 * Created by guptash on 7/26/2017.
 */
public interface AdminDao {
    public int add_operator(String username, String password, String loginuser);
    public  int remove_operator(String username, String loginuser);
    public int add_v(String model_no, String name, String brand, double price, int units, double tax, double profit, String loginuser);
    public int add_s(String model_no, String name, String brand, double price, int units, int vehicle_id, double tax, String loginuser);
    public int remove_s(String model_no, String loginuser);
}
