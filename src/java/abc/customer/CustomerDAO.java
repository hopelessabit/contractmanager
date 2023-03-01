/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.customer;

import abc.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class CustomerDAO {

    public static CustomerDTO getAccount(String email, String password) {
        CustomerDTO customer = null;

        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Select * from Customer where email = ? and password = ? COLLATE SQL_Latin1_General_CP1_CS_AS and status=1";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                customer = new CustomerDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;

    }

    public static CustomerDTO searchAccount(int ID) {
        CustomerDTO customer = null;

        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Select * from Customer where CID = ?";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setInt(1, ID);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                customer = new CustomerDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;

    }

    public static int insertAcc(String email, String password, String id, String phone, String name, String dob, String address) {
        int result = 0;

        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Insert into Customer(email, CCID, password, status,phone,fullname,dateOfBirth,address1) values(?,?,?,1,?,?,?,?)";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, id);
            pr.setString(3, password);
            pr.setString(4, phone);
            pr.setString(5, name);
            pr.setString(6, dob);
            pr.setString(7, address);
            result = pr.executeUpdate();

            cn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return result;

    }

    public static int changePass(String newPass, String email) {
        int result = 0;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "update Customer set password=? where email=?";
            PreparedStatement pr = cn.prepareStatement(sql);

            pr.setString(1, newPass);
            pr.setString(2, email);
            result = pr.executeUpdate();

            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int updateProfile(String name, Date dob, String address, String CCID, int CID) {
        int result = 0;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "update Customer set fullname=?, dateOfBirth=?, address1=?, CCID=? where CID=?";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, name);
            pr.setDate(2, dob);
            pr.setString(3, address);
            pr.setString(4, CCID);
            pr.setInt(5, CID);
            result = pr.executeUpdate();
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
//         System.out.println(changePass("1111111","h@gmail.com"));
        updateProfile("Tran Van Ne", new Date(2000, 11, 12), "65 Nguyen Xien", "123111222333", 1);
        System.out.println(getAccount("khachhanga@gmail.com", "123"));
    }
}
