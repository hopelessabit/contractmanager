/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.admins;

import abc.owners.*;
import abc.customers.*;
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
public class AdminDAO {
    public static AdminDTO getAccount(String email, String password) {
        AdminDTO admin=null;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Select * from Admin where email=? and password=? and status=1";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
               admin = new AdminDTO( rs.getInt(1),  rs.getString(2),  rs.getString(3),  rs.getString(4),  rs.getString(5), rs.getString(7), rs.getInt(8) );               
            }
            cn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
    public static void main(String[] args){
    System.out.println(getAccount("hung@gmail.com","123"));
}
}
