package models.users;


import database.ConnectionFactory;
import models.SparePart;
import models.User;
import models.Vehicle;
import models.*;

import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class Admin implements AdminDao {
    int id,units,sunits,vehicle_id;
    String model,smodel,name,sname,brand,sbrand;
    double price,sprice,tax,stax,profit;



    public int add_operator(String username, String password, String loginuser) {

        Connection con = ConnectionFactory.getConnection();
        //Statement st0 = con.createStatement();
        PreparedStatement st1 = null;
                try {
                    st1 = con.prepareStatement("select * from users where username = ? and password= ?");

                    st1.setString(1, username);
                    st1.setString(2, password);
                    ResultSet res = st1.executeQuery();
                    //ResultSet rs = st0.executeQuery("select * from users where username = "+user_name);
                    //System.out.println(rs);
                    if (!res.next()) {

                        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
                        Date now = Calendar.getInstance().getTime();
                        String reportDate = df.format(now);
                        PreparedStatement st = con.prepareStatement("insert into users(username,password,privelege,updated_at) values(?,?,?,?)");
                        //st.setInt(1,1);
                        st.setString(1, username);
                        st.setString(2, password);
                        st.setInt(3, 1);
                        st.setString(4, reportDate);
                        int result = st.executeUpdate();
                        st.close();
                        if (result > 0) {
                            PreparedStatement ps = con.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");
                            ps.setString(1, loginuser);
                            ps.setString(2, reportDate);
                            ps.setString(3, username + "operator added");
                            ps.executeUpdate();
                            ps.close();
                            con.close();
                            return 1;
                        }
                    }
                    con.close();
                }catch(Exception e) {
                    e.printStackTrace();
                }


        return -1;
    }
    public  int remove_operator(String username, String loginuser)  {

        Connection con = ConnectionFactory.getConnection();
        PreparedStatement st1 = null;
        try {
            st1 = con.prepareStatement("select * from users where username = ?");
            st1.setString(1, username);
            ResultSet res = st1.executeQuery();
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Date now = Calendar.getInstance().getTime();
            String reportDate1 = df.format(now);
            if (res.next()) {
                PreparedStatement st = con.prepareStatement("delete from users where username = ?");
                st.setString(1, username);
                int result = st.executeUpdate();
                st.close();
                if (result > 0) {
                    PreparedStatement ps1 = con.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");

                    ps1.setString(1, loginuser);
                    ps1.setString(2, reportDate1);
                    ps1.setString(3, username + "operator removed");
                    ps1.executeUpdate();
                    ps1.close();
                    con.close();

                    return 1;
                }
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
            }

        return -1;
    }
    public int add_v(String model_no, String name, String brand, double price, int units, double tax, double profit, String loginuser)
    {
        Vehicle v1 = new Vehicle();
        int result = v1.add_vehicle(model_no, name, brand, price, units, tax, profit, loginuser);
        return result;
    }
    public int remove_v(String model_no, String loginuser) {
        Vehicle v2 = new Vehicle();
        int result = v2.remove_vehicle(model_no, loginuser);
        return result;

    }
    public int add_s(String model_no, String name, String brand, double price, int units, int vehicle_id, double tax, String loginuser)
    {
        SparePart s1 = new SparePart();
        int result = s1.add_sparepart( model_no, name, brand, price, units, vehicle_id, tax, loginuser);
        return result;
    }
    public int remove_s(String model_no, String loginuser) {
        SparePart s2 = new SparePart();
        int result = s2.remove_sparepart(model_no, loginuser);
        return result;

    }

}
