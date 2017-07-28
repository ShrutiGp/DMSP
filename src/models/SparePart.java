package models;

import java.io.IOException;
import java.sql.*;

import database.ConnectionFactory;
import models.users.Admin;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class SparePart implements SparepartDao {
    Connection connection = ConnectionFactory.getConnection();
    DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
    Calendar now = Calendar.getInstance();
    String time="";

    public int add_sparepart( String model_no, String name, String brand, double price, int units, int vehicle_id, double tax, String loginuser) {

        PreparedStatement stmt = null;
        try {
            String sql;
            stmt = connection.prepareStatement("insert into spareparts(model_no, name, brand, price, units,vehicle_id, updated_at, tax) values(?,?,?,?,?,?,?,?)");
            time = df.format(now.getTime());
            stmt.setString(1, model_no);
            stmt.setString(2, name);
            stmt.setString(3, brand);
            stmt.setDouble(4, price);
            stmt.setInt(5, units);
            stmt.setInt(6, vehicle_id);
            stmt.setString(7, time);
            stmt.setDouble(8, tax);

            int cnt = stmt.executeUpdate();
            stmt.close();
            if (cnt > 0) {
                PreparedStatement ps = connection.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");
                ps.setString(1, loginuser);
                ps.setString(2, time);
                ps.setString(3, "Sparepart Added");
                ps.executeUpdate();
                ps.close();
                return 1;
            }
            stmt.close();

        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();

        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
            }// nothing we can do
        }//end try

        return -1;

    }//end main

    public int remove_sparepart(String model_no, String loginuser) {
        PreparedStatement stmt = null;
        try {
        String sql = "delete from spareparts where model_no = ?";
        stmt = connection.prepareStatement(sql);
        time = df.format(now.getTime());
        stmt.setString(1,model_no);
        int rows_affected = stmt.executeUpdate();
        stmt.close();
        if (rows_affected > 0) {
            PreparedStatement ps = connection.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");
            ps.setString(1, loginuser);
            ps.setString(2, time);
            ps.setString(3, "Sparepart Removed");
            ps.executeUpdate();
            ps.close();
            return 1;
        } } catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int add_spare_stock(String model_no, int n, String loginuser){
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("select * from spareparts");
            while(rs.next()) {
                if(rs.getString(2).equals(model_no)){
                    int t = rs.getInt(6) + n;
                    String sql = "update spareparts set units=? where model_no = ?";
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    stmt.setInt(1, t);
                    stmt.setString(2, model_no);
                    int rows_affected = stmt.executeUpdate();
                    time = df.format(now.getTime());
                    stmt.close();
                    if(rows_affected > 0) {
                        PreparedStatement ps = connection.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");
                        ps.setString(1, loginuser);
                        ps.setString(2, time);
                        ps.setString(3, "Sparepart Stock Added");
                        ps.executeUpdate();
                        ps.close();
                        st.close();
                        return 1;
                    }
                }
            }
        } catch (SQLException sqle) {
            System.err.println(sqle);
        }

        return -1;
    }

    public int remove_spare_stock(String model_no,int n, String loginuser){

        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("select * from spareparts");
            while(rs.next()) {
                if(rs.getString(2).equals(model_no)){
                    int t = rs.getInt(6) - n;
                    String sql = "update spareparts set units=? where model_no = ?";
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    stmt.setInt(1, t);
                    stmt.setString(2, model_no);
                    int rows_affected = stmt.executeUpdate();
                    time = df.format(now.getTime());
                    if(rows_affected > 0) {
                        PreparedStatement ps = connection.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");
                        ps.setString(1, loginuser);
                        ps.setString(2, time);
                        ps.setString(3, "Sparepart Stock Removed");
                        ps.executeUpdate();
                        ps.close();
                        st.close();
                        return 1;
                    }
                }
            }
        } catch (SQLException sqle) {
            System.err.println(sqle);
        }
        return -1;
    }


}