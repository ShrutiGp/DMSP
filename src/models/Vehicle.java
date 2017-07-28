package models;

/**
 * Created by ghoshri on 7/13/2017.
 */

import database.ConnectionFactory;
import com.sun.org.apache.regexp.internal.RE;
import models.users.Admin;

import javax.persistence.*;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class Vehicle implements VehicleDao{



    DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
    Calendar now = Calendar.getInstance();
    String time="";




    public int add_vehicle(String model_no, String name, String brand, double price, int units, double tax, double profit, String loginuser) {
        Connection connection = ConnectionFactory.getConnection();
        PreparedStatement stmt=null;
        try{
            String sql;
            stmt = connection.prepareStatement( "insert into vehicles(model_no, name, brand, price, units, updated_at, tax, profit) values(?,?,?,?,?,?,?,?)");
            time = df.format(now.getTime());
            stmt.setString(1, model_no);
            stmt.setString(2,name);
            stmt.setString(3,brand);
            stmt.setDouble(4,price);
            stmt.setInt(5,units);
            stmt.setString(6,time);
            stmt.setDouble(7,tax);
            stmt.setDouble(8,profit);
            int cnt = stmt.executeUpdate();
            stmt.close();
            if(cnt>0) {
                PreparedStatement ps = connection.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");
                ps.setString(1, loginuser);
                ps.setString(2, time);
                ps.setString(3, "Vehicle Added");
                ps.executeUpdate();
                ps.close();
                return 1;
            }
        }catch(SQLException se){
            //Handle errors for JDBC
            se.printStackTrace();
        }catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();

        } finally {
            try {
            connection.close();
            }catch(Exception e) {
                e.printStackTrace();
            }

        }

        return -1;
    }//end main

    public int remove_vehicle(String model_no, String loginuser){

          Connection connection1 = ConnectionFactory.getConnection();
        try {
          String sql = "delete from vehicles where model_no = ?";
          PreparedStatement stmt = connection1.prepareStatement(sql);
          stmt.setString(1, model_no);
          time = df.format(now.getTime());

          int rows_affected = stmt.executeUpdate();
          stmt.close();
          if (rows_affected > 0) {
              PreparedStatement ps = connection1.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");
              ps.setString(1, loginuser);
              ps.setString(2, time);
              ps.setString(3, "Vehicle Removed");
              ps.executeUpdate();
              ps.close();
              return 1;
          }
      } catch(Exception e) {
          e.printStackTrace();
      }finally {
            try {
                connection1.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

          return -1;

    }
    public int add_vehicle_stock(String model_no, int n, String loginuser){
        Connection connection = ConnectionFactory.getConnection();

        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("select * from vehicles");
            time = df.format(now.getTime());
            while(rs.next()) {
                if(rs.getString(2).equals(model_no)){
                    int t = rs.getInt(6) + n;
                    String sql = "update vehicles set units=? where model_no = ?";
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    stmt.setInt(1, t);
                    stmt.setString(2, model_no);
                    int rows_affected = stmt.executeUpdate();
                    stmt.close();
                    if(rows_affected > 0) {
                        PreparedStatement ps = connection.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");
                        ps.setString(1, loginuser);
                        ps.setString(2, time);
                        ps.setString(3, "Vehicle Stock Added");
                        ps.executeUpdate();
                        ps.close();
                        st.close();
                        return 1;
                    }
                }
            }
        } catch (Exception sqle) {
            sqle.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
            return -1;
    }

   public int remove_vehicle_stock(String model_no,int n, String loginuser){
        Connection connection = ConnectionFactory.getConnection();
        try {

            Statement st1 = connection.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from vehicles");
            time = df.format(now.getTime());
            while(rs1.next()) {
                if(rs1.getString(2).equals(model_no)){
                    int t = rs1.getInt(6) - n;
                    String sql = "update vehicles set units=? where model_no = ?";
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    stmt.setInt(1, t);
                    stmt.setString(2, model_no);
                    int rows_affected = stmt.executeUpdate();
                    stmt.close();
                    if(rows_affected > 0) {
                        PreparedStatement ps = connection.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");
                        ps.setString(1, loginuser);
                        ps.setString(2, time);
                        ps.setString(3, "Vehicle Stock Sold");
                        ps.executeUpdate();
                        ps.close();
                        st1.close();
                        return 1;
                    }
                }
            }
        } catch (SQLException sqle) {
            System.err.println(sqle);
        }finally {
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1;
    }

    public ArrayList<VehicleDisplay> getRecords(int start, int total){
        Connection connection = ConnectionFactory.getConnection();
        ArrayList<VehicleDisplay> list=new ArrayList<VehicleDisplay>();
        try {
                    String sql = "select * from logs limit "+(start-1)+","+total;
                    PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                VehicleDisplay e=new VehicleDisplay();
                e.setId(rs.getInt(1));
                e.setPerf(rs.getString(2));
                e.setTime(rs.getString(3));
                e.setDesc(rs.getString(4));
                list.add(e);
            }

        }
        catch (SQLException sqle) {
            System.err.println(sqle);
        }finally {
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;

    }
    public  int userBuyLog(String model_no, String loginuser) {
        Connection connection = ConnectionFactory.getConnection();
        PreparedStatement ps = null;
        try {

            time = df.format(now.getTime());
                        ps = connection.prepareStatement("insert into userbuy(vmodel, vdate, name) values(?, ?, ?)");
                        ps.setString(1, model_no);
                        ps.setString(2, time);
                        ps.setString(3, loginuser);
                        int rows_affected = ps.executeUpdate();
                        if(rows_affected > 0){
                            ps.close();
                            return 1;
                        }

                        ps.close();



        } catch (SQLException sqle) {
            System.err.println(sqle);
        }finally {
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1;
    }

}