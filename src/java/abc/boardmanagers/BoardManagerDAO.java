/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.boardmanagers;

import abc.admins.*;
import abc.owners.*;
import abc.customers.*;
import abc.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class BoardManagerDAO {
    public static BoardManagerDTO getAccount(String email, String password) {
        BoardManagerDTO boardManager=null;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "Select * from BoardManager where email=? and password=? and status=1";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
               boardManager = new BoardManagerDTO( rs.getInt(1),  rs.getString(2),  rs.getString(3) );
                  
                  
            }
            cn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return boardManager;
    }
    public static void main(String[] args){
    System.out.println(getAccount("nguoisohuu1@gmail.com","123"));
}
     
}
