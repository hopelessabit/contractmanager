 
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.contract;

import abc.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author mical
 */
public class ContractDAO {

    public static ArrayList<ContractDTO> getContracts(char userType, int id) {
        ArrayList<ContractDTO> result = new ArrayList<>();
        Connection cn = null;
        try {
            cn = abc.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "select Contract.[CoID],[RoID],Contract.[CID],[dbo].[Contract].[RID],[dbo].[Owner].[OID],[dbo].[Contract].[SID],[dbo].[Contract].[status],[fee],[total],[createDate],[endDate],\n"
                        + "[dbo].[Customer].[fullname] AS [CName], [dbo].[Owner].[fullname] AS [OName], [dbo].[Seller].[fullname] AS [SName], [dbo].[Resident].[fullname] AS [RName]\n"
                        + "from Contract \n"
                        + "left join [dbo].[ContractInformation] on Contract.[CoID] = [dbo].[ContractInformation].[CoID] \n"
                        + "left join [dbo].[Customer] on [dbo].[Contract].CID = [dbo].[Customer].CID\n"
                        + "left join [dbo].[Owner] on [dbo].[Contract].[OID] = [dbo].[Owner].[OID]\n"
                        + "left join [dbo].[Seller] on [dbo].[Contract].[SID] = [dbo].[Seller].[SID]\n"
                        + "left join [dbo].[Resident] on [dbo].[Contract].[RID] = [dbo].[Resident].[RID]\n";

                if (userType == 'C') {
                    sql = sql + "where Contract.[CID]=?";
                }
                if (userType == 'O') {
                    sql = sql + "where Contract.[OID]=?";
                }
                if (userType == 'R') {
                    sql = sql + "where Contract.[RID]=?";
                }
                if (userType == 'S') {
                    sql = sql + "where Contract.[SID]=?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int CoID = rs.getInt("CoID");
                        int RoID = rs.getInt("RoID");
                        int CID = rs.getInt("CID");
                        String CName = "";
                        if (rs.wasNull()) {
                            CID = 0;
                        }else{
                            CName = rs.getString("CName");
                        }
                        int RID = rs.getInt("RID");
                        String RName = "";
                        if (rs.wasNull()) {
                            RID = 0;
                        }else{
                            RName = rs.getString("RName");
                        }
                        int OID = rs.getInt("OID");
                        String OName = rs.getString("OName");
                        int SID = rs.getInt("SID");
                        String SName = "";
                        if(rs.wasNull()){
                            SID = 0;
                        }else{
                            SName = rs.getString("SName");
                        }
                        int check = rs.getInt("status");
                        int fee = rs.getInt("fee");
                        int total = rs.getInt("total");
                        Date createDate = rs.getDate("createDate");
                        Date endDate = rs.getDate("endDate");
                        ContractDTO nw = new ContractDTO(CoID, RoID, CID, CName, RID, RName, OID, OName, SID, SName, check, fee, total, createDate, endDate);
                        result.add(nw);
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

    
    public static ArrayList<ContractDTO> get2Contracts(char userType, int id) {
        ArrayList<ContractDTO> result = new ArrayList<>();
        Connection cn = null;
        try {
            cn = abc.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "select top 2 Contract.[CoID],[RoID],Contract.[CID],[dbo].[Contract].[RID],[dbo].[Owner].[OID],[dbo].[Contract].[SID],[dbo].[Contract].[status],[fee],[total],[createDate],[endDate],\n"
                        + "[dbo].[Customer].[fullname] AS [CName], [dbo].[Owner].[fullname] AS [OName], [dbo].[Seller].[fullname] AS [SName], [dbo].[Resident].[fullname] AS [RName]\n"
                        + "from Contract \n"
                        + "left join [dbo].[ContractInformation] on Contract.[CoID] = [dbo].[ContractInformation].[CoID] \n"
                        + "left join [dbo].[Customer] on [dbo].[Contract].CID = [dbo].[Customer].CID\n"
                        + "left join [dbo].[Owner] on [dbo].[Contract].[OID] = [dbo].[Owner].[OID]\n"
                        + "left join [dbo].[Seller] on [dbo].[Contract].[SID] = [dbo].[Seller].[SID]\n"
                        + "left join [dbo].[Resident] on [dbo].[Contract].[RID] = [dbo].[Resident].[RID]\n";

                if (userType == 'C') {
                    sql = sql + "where Contract.[CID]=?";
                }
                if (userType == 'O') {
                    sql = sql + "where Contract.[OID]=?";
                }
                if (userType == 'R') {
                    sql = sql + "where Contract.[RID]=?";
                }
                if (userType == 'S') {
                    sql = sql + "where Contract.[SID]=?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int CoID = rs.getInt("CoID");
                        int RoID = rs.getInt("RoID");
                        int CID = rs.getInt("CID");
                        String CName = "";
                        if (rs.wasNull()) {
                            CID = 0;
                        }else{
                            CName = rs.getString("CName");
                        }
                        int RID = rs.getInt("RID");
                        String RName = "";
                        if (rs.wasNull()) {
                            RID = 0;
                        }else{
                            RName = rs.getString("RName");
                        }
                        int OID = rs.getInt("OID");
                        String OName = rs.getString("OName");
                        int SID = rs.getInt("SID");
                        String SName = "";
                        if(rs.wasNull()){
                            SID = 0;
                        }else{
                            SName = rs.getString("SName");
                        }
                        int check = rs.getInt("status");
                        int fee = rs.getInt("fee");
                        int total = rs.getInt("total");
                        Date createDate = rs.getDate("createDate");
                        Date endDate = rs.getDate("endDate");
                        ContractDTO nw = new ContractDTO(CoID, RoID, CID, CName, RID, RName, OID, OName, SID, SName, check, fee, total, createDate, endDate);
                        result.add(nw);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.getCause();
        }
        return result;
    }
    public static ArrayList<ContractDTO> getContracts() {
        ArrayList<ContractDTO> result = new ArrayList<>();
        Connection cn = null;
        try {
            cn = abc.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "select Contract.[CoID],[RoID],Contract.[CID],[dbo].[Contract].[RID],[dbo].[Owner].[OID],[dbo].[Contract].[SID],[dbo].[Contract].[status],[fee],[total],[createDate],[endDate],\n"
                        + "[dbo].[Customer].[fullname] AS [CName], [dbo].[Owner].[fullname] AS [OName], [dbo].[Seller].[fullname] AS [SName], [dbo].[Resident].[fullname] AS [RName]\n"
                        + "from Contract \n"
                        + "left join [dbo].[ContractInformation] on Contract.[CoID] = [dbo].[ContractInformation].[CoID] \n"
                        + "left join [dbo].[Customer] on [dbo].[Contract].CID = [dbo].[Customer].CID\n"
                        + "left join [dbo].[Owner] on [dbo].[Contract].[OID] = [dbo].[Owner].[OID]\n"
                        + "left join [dbo].[Seller] on [dbo].[Contract].[SID] = [dbo].[Seller].[SID]\n"
                        + "left join [dbo].[Resident] on [dbo].[Contract].[RID] = [dbo].[Resident].[RID]\n";

                PreparedStatement pst = cn.prepareStatement(sql);

                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int CoID = rs.getInt("CoID");
                        String CName = rs.getString("CName");
                        String RName = rs.getString("RName");
                        String OName = rs.getString("OName");
                        String SName = rs.getString("SName");
                        int check = rs.getInt("status");
                        int fee = rs.getInt("fee");
                        int total = rs.getInt("total");
                        Date createDate = rs.getDate("createDate");
                        Date endDate = rs.getDate("endDate");
                        ContractDTO nw = new ContractDTO(CoID, CName, RName, OName, SName, check, fee, total, createDate, endDate);
                        result.add(nw);
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
        ContractDTO a = getContractDetail("5");
        System.out.println(a);

    }

    public static ContractDTO getContractDetail(String id) {
        ContractDTO contract = null;
        try {
            Connection cn = DBUtils.getConnection();
            String sql = "select Contract.[CoID],[RoID],Contract.[CID],[dbo].[Contract].[RID],[dbo].[Owner].[OID],[dbo].[Contract].[SID],[dbo].[Contract].[status],[fee],[total],[createDate],[endDate],\n"
                    + "[dbo].[Customer].[fullname] AS [CName], [dbo].[Owner].[fullname] AS [OName], [dbo].[Seller].[fullname] AS [SName], [dbo].[Resident].[fullname] AS [RName]\n"
                    + "from Contract \n"
                    + "left join [dbo].[ContractInformation] on Contract.[CoID] = [dbo].[ContractInformation].[CoID] \n"
                    + "left join [dbo].[Customer] on [dbo].[Contract].CID = [dbo].[Customer].CID\n"
                    + "left join [dbo].[Owner] on [dbo].[Contract].[OID] = [dbo].[Owner].[OID]\n"
                    + "left join [dbo].[Seller] on [dbo].[Contract].[SID] = [dbo].[Seller].[SID]\n"
                    + "left join [dbo].[Resident] on [dbo].[Contract].[RID] = [dbo].[Resident].[RID]\n where Contract.[CoID] = ?";
            PreparedStatement pr = cn.prepareStatement(sql);
            pr.setString(1, id);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {

                int CoID = rs.getInt("CoID");
                String CName = rs.getString("CName");
                String RName = rs.getString("RName");
                String OName = rs.getString("OName");
                String SName = rs.getString("SName");
                int check = rs.getInt("status");
                int fee = rs.getInt("fee");
                int total = rs.getInt("total");
                Date createDate = rs.getDate("createDate");
                Date endDate = rs.getDate("endDate");
                contract = new ContractDTO(CoID, CName, RName, OName, SName, check, fee, total, createDate, endDate);

            }
            cn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return contract;
    }

    public static int updateFee(int fee, int total, String id) {
         Connection cn = null;
         int rs=0;
         try{ 
             cn=DBUtils.getConnection();
             if(cn!=null){
                 String sql="update ContractInformation set fee=?,total=? where CoID=?";
                 PreparedStatement pr=cn.prepareStatement(sql);
                 pr.setInt(1,fee);
                 pr.setInt(2,total);
                 pr.setString(3,id);
                 rs=pr.executeUpdate();
             }
             
         }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
         }
         return rs;
    }
}
 
    

 
