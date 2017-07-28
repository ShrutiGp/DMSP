package models.users;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import database.ConnectionFactory;
import models.*;

import java.util.*;

import java.sql.*;

public class Operator implements OperatorDao{
    Connection conn = ConnectionFactory.getConnection();
    DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
    Calendar now = Calendar.getInstance();
    String time="";


    public int add_vstock(String model_no, int n, String loginuser)
    {
                Vehicle v1 = new Vehicle();
                int result = v1.add_vehicle_stock(model_no, n, loginuser);
                return result;
        }

    public int remove_vstock(String model_no, int n, String loginuser)
    {
        Vehicle v2 = new Vehicle();
        int result = v2.remove_vehicle_stock(model_no, n, loginuser);
        return result;
    }

    public int add_sstock(String model_no, int n, String loginuser)
    {
        SparePart v3 = new SparePart();
        int result = v3.add_spare_stock(model_no, n, loginuser);
        return result;
    }

    public int remove_sstock(String model_no, int n, String loginuser)
    {
        SparePart v4 = new SparePart();
        int result = v4.remove_spare_stock(model_no, n, loginuser);
        return result;
    }



}