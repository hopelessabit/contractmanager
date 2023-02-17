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
        OwnerDTO owner=null;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Select * from Owner where email=? and password=? and status=1";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                owner = new OwnerDTO( rs.getInt(1),  rs.getString(2),  rs.getString(3),  rs.getString(4),  rs.getDate(5), rs.getString(6),  rs.getString(7),   rs.getString(9),  rs.getInt(10));
            }
            cn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return owner;
    }
    public static int changePass(String newPass,String email) {
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
        OwnerDTO result = null;
        Connection cn = null;
        try {
            cn = abc.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT[OID] ,[email],[OCID],[password],[dateOfBirth],[fullname],[phone],[avartar],[address1],[status]\n"
                        + "FROM [ContractManager].[dbo].[Owner]\n"
                        + "WHERE [Owner].[OID] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, OID);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String email = rs.getString("email");
                    String OCID = rs.getString("OCID");
                    String password = rs.getString("password");
                    Date dateOfBirth = rs.getDate("dateOfBirth");
                    String fullName = rs.getString("fullName"); 
                    String phoneNumber = rs.getString("phone");
                    String address = rs.getString("address1");
                    int status = rs.getInt("status");
                    result = new OwnerDTO(OID, email, OCID, password, dateOfBirth, fullName, phoneNumber, address, status);
                }
            }
            cn.close();
        } catch (Exception e) {
            e.getCause();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                }
            }

        }
        return result;
    }
}
