/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.controller;

import abc.contract.ContractDAO;
import static abc.utils.Utilities.*;
import abc.customer.CustomerDAO;
import abc.customer.CustomerDTO;
import abc.owner.OwnerDTO;
import abc.resident.ResidentDAO;
import abc.resident.ResidentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mical
 */
public class CreateContractServlet extends HttpServlet {

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
            OwnerDTO owner = (OwnerDTO) request.getSession().getAttribute("user");
            int OID = owner.getOID();
            String contractName = request.getParameter("txtContractName"); request.setAttribute("txtContractName", contractName);
            int RoID = Integer.parseInt(request.getParameter("RoID")); request.setAttribute("RoID", RoID);
            String txtlessee = request.getParameter("txtLessee"); request.setAttribute("txtLessee", txtlessee);
            String txtLCID = request.getParameter("txtLCID"); request.setAttribute("txtLCID", txtLCID);
            int rentalFee = Integer.parseInt(request.getParameter("intRentalFee")); request.setAttribute("intRentailFee", rentalFee);
            char lesseeType = 'R';
            boolean brk = false;
            int userID= 0;
            CustomerDTO customer = CustomerDAO.searchAccount(txtlessee, txtLCID);
            if (customer == null) {
                ResidentDTO resident = ResidentDAO.searchResident(txtlessee, txtLCID);
                if (resident == null) {
                    request.setAttribute("lesseeError", "Can not find Lessee");
                    brk = true;
                } else {
                    lesseeType = 'R';
                    userID = resident.getRID();
                    request.setAttribute("lessee", resident);
                }
            } else {
                lesseeType = 'C';
                userID = customer.getCID();
                request.setAttribute("lessee", customer);
            }
            Date today = abc.utils.Utilities.getDate();
            Date from = Date.valueOf(request.getParameter("dateFrom")); request.setAttribute("dateFrom", from);
            Date to = Date.valueOf(request.getParameter("dateTo")); request.setAttribute("dateTo", to);

            if (from.compareTo(today) != 1) {
                request.setAttribute("fromError", "Commencement date must be atleast 1 day after today!");
                brk = true;
            }
            if (to.compareTo(from) != 1) {
                request.setAttribute("toError", "Ending date must be atleast 1 month after Commencement date!");
                brk = true;
            } else {
                if (getYear(to.toString()) == getYear(from.toString())) {
                    if ((getMonth(to.toString()) - getMonth(from.toString())) < 1) {
                        request.setAttribute("toError", "Ending date must be atleast 1 month after Commencement date!");
                        brk = true;
                    } else if((getMonth(to.toString()) - getMonth(from.toString())) == 1){
                        if((getDay(to.toString()) - getDay(from.toString())) < 0){
                            request.setAttribute("toError", "Ending date must be atleast 1 month after Commencement date!");
                            brk = true;
                        }
                    }
                } else if(getYear(to.toString()) == getYear(from.toString())){
                    if(getMonth(from.toString()) == 12 && getMonth(to.toString()) == 1){
                        if((getDay(to.toString()) - getDay(from.toString())) < 0){
                            request.setAttribute("toError", "Ending date must be atleast 1 month after Commencement date!");
                            brk = true;
                        }
                    }
                }
            }
            if(brk) request.getRequestDispatcher("CreateContract.jsp").forward(request, response);
            
            //---------------------------------------------
            request.setCharacterEncoding("UTF-8");
            String description = request.getParameter("txtDescription");
            
            ContractDAO.createContract(RoID, userID, lesseeType, OID, rentalFee, 0, from, to, contractName, description);
            request.setAttribute("noti", "Create contract successed!");
            request.getRequestDispatcher("CreateContract.jsp").forward(request, response);
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
