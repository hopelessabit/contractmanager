/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.resident;

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
public class ResidentDAO {
    public static ResidentDTO getAccount(String email, String password) {
        ResidentDTO resident=null;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Select * from Resident where email=? and password=? and status=1";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                resident = new ResidentDTO( rs.getInt(1),  rs.getString(2),  rs.getString(3),  rs.getString(4),  rs.getDate(5), rs.getString(6),  rs.getString(7),   rs.getString(9),  rs.getInt(10));
            }
            cn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return resident;
    }
    public static ResidentDTO searchResident(int RID) {
        ResidentDTO resident=null;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Select * from Resident where RID=? and status=1";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setInt(1, RID);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                resident = new ResidentDTO( rs.getInt(1),  rs.getString(2),  rs.getString(3),  rs.getString(4),  rs.getDate(5), rs.getString(6),  rs.getString(7),   rs.getString(9),  rs.getInt(10));
            }
            cn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return resident;
    }
    public static int changePass(String newPass,String email) {
        int result = 0;

        try {
            Connection cn = DBUtils.getConnection();
            String sql = "update Resident set password=? where email=?";
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
}
