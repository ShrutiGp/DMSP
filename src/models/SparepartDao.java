package models;

/**
 * Created by guptash on 7/26/2017.
 */
public interface SparepartDao {
    public int add_sparepart( String model_no, String name, String brand, double price, int units, int vehicle_id, double tax, String loginuser);
    public int remove_sparepart(String model_no, String loginuser);
    public int add_spare_stock(String model_no, int n, String loginuser);
    public int remove_spare_stock(String model_no,int n, String loginuser);

}
