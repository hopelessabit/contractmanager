/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.controllers;

import abc.admins.AdminDTO;
import abc.boardmanagers.BoardManagerDTO;
import abc.contracts.ContractDAO;
import abc.contracts.ContractDTO;
import abc.customers.CustomerDTO;
import abc.owners.OwnerDTO;
import abc.residents.ResidentDTO;
import abc.sellers.SellerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mical
 */
public class Find2ContractsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String url = "";
            Object user = new Object();
            int userID = 0;
            char userType = ((String) session.getAttribute("userType")).charAt(0);
            switch (userType) {
                case 'C':
                    user = (CustomerDTO) session.getAttribute("user");
                    url = "CustomerIndex.jsp";
                    userID = ((CustomerDTO) user).getCID();
                    break;
                case 'O':
                    user = (OwnerDTO) session.getAttribute("user");
                    url = "OwnerIndex.jsp";
                    userID = ((OwnerDTO) user).getOID();
                    break;
                case 'B':
                    user = (BoardManagerDTO) session.getAttribute("user");
                    url = "BoardManagerIndex.jsp";
                    userID = ((BoardManagerDTO) user).getBID();
                    break;
                case 'A':
                    user = (AdminDTO) session.getAttribute("user");
                    url = "AdminIndex.jsp";
                    userID = ((AdminDTO) user).getAID();
                    break;    
                case 'R':
                    user = (ResidentDTO) session.getAttribute("user");
                    url = "ResidentIndex.jsp";
                    userID = ((ResidentDTO) user).getRID();
                    break; 
                case 'S':
                    user = (SellerDTO) session.getAttribute("user");
                    url = "SellerIndex.jsp";
                    userID = ((SellerDTO) user).getSaID();
                    break; 

            }
            ArrayList<ContractDTO> LIST_CONTRACT = new ArrayList<>();
            LIST_CONTRACT = ContractDAO.get2Contracts(userType, userID);
            request.setAttribute("contractList", LIST_CONTRACT);
            request.getRequestDispatcher("MainController?action=FindAllContracts").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
