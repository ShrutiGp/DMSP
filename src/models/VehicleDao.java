package models;

import java.util.ArrayList;

/**
 * Created by guptash on 7/26/2017.
 */
public interface VehicleDao {
    public int add_vehicle(String model_no, String name, String brand, double price, int units, double tax, double profit, String loginuser);
    public int remove_vehicle(String model_no, String loginuser);
    public int add_vehicle_stock(String model_no, int n, String loginuser);
    public int remove_vehicle_stock(String model_no,int n, String loginuser);
    public ArrayList<VehicleDisplay> getRecords(int pageid, int total);
    public  int userBuyLog(String model_no, String loginuser);

}
