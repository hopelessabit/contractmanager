/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
 public class DBUtils {
 
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection cn=null;
        String IP="localhost";
        String instanceName="LAPTOP-96TMMNF";
        String port="1433";
        String uid="sa";
        String pwd="12345";
        String db="ContractManager";
        String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url="jdbc:sqlserver://" +IP+"\\"+ instanceName+":"+port
                 +";databasename="+db+";user="+uid+";password="+pwd;
        Class.forName(driver);
        cn=DriverManager.getConnection(url);
        return cn;
    }
}
