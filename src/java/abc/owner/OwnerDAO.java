/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.owner;

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
public class OwnerDAO {

    public static OwnerDTO getAccount(String email, String password) {
        OwnerDTO owner = null;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Select * from Owner where email=? and password=? COLLATE SQL_Latin1_General_CP1_CS_AS and status=1";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                owner = new OwnerDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));
            }
            cn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return owner;
    }

    public static int changePass(String newPass, String email) {
        int result = 0;

        try {
            Connection cn = DBUtils.getConnection();
            String sql = "update Owner set password=? where email=?";
            PreparedStatement pr = cn.prepareStatement(sql);

            pr.setString(1, newPass);
            pr.setString(2, email);
            result = pr.executeUpdate();

            cn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return result;

    }

    public static OwnerDTO searchOwner(int OID) {
        OwnerDTO owner = null;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Select * from Owner where OID = ?";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setInt(1, OID);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                owner = new OwnerDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return owner;
    }

    public static int updateProfile(String name, Date dob, String address, String CID, int ID) {
        int result = 0;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "update Owner set fullname=?, dateOfBirth=?, address1=?, OCID=? where OID=?";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, name);
            pr.setDate(2, dob);
            pr.setString(3, address);
            pr.setString(4, CID);
            pr.setInt(5, ID);
            result = pr.executeUpdate();
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
