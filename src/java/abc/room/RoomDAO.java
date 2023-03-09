/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.room;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author mical
 */
public class RoomDAO {

    public static ArrayList<Integer> getRoomID(int OID) {
        ArrayList<Integer> result = new ArrayList<>();
        Connection cn = null;
        int type = 0;
        try {
            cn = abc.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [RoID],[RID],[OID],[status]\n"
                        + "FROM [dbo].[Room]\n"
                        + "where [OID] = ? and status = 0";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, OID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        result.add(rs.getInt(1));
                    }
                }
            }
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
    
    public static void main(String[] args) {
        ArrayList<Integer> list = getRoomID(1);
        System.out.println(list.size());
        Date date = new Date(System.currentTimeMillis());
        Date date2 = new Date(123, 2, 9);
        System.out.println(date);
        System.out.println(System.currentTimeMillis());
        System.out.println(date2);
        System.out.println(java.time.LocalDate.now());
    }
}
