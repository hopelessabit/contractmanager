/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.controller;

import abc.customer.CustomerDAO;
import abc.customer.CustomerDTO;
import abc.owner.OwnerDTO;
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
            String contractName = request.getParameter("txtContractName");
            int RoID = Integer.parseInt(request.getParameter("RoID"));
            String txtlessee = request.getParameter("txtLessee");
            String txtLCID = request.getParameter("txtLCID");
            Object lessee = CustomerDAO.searchAccount(txtlessee, txtLCID);
            if(lessee == null){
            }
            
            String seller = request.getParameter("txtSeller");
            String txtSCID = request.getParameter("txtSCID");
            
            Date from = Date.valueOf(request.getParameter("dateFrom"));
            Date to = Date.valueOf(request.getParameter("dateTo"));
            String description = request.getParameter("txtDescription");
            
            
            //---------------------------------------------
            
            
            
            
            
            
            
            
            request.setCharacterEncoding("UTF-8");            
            StringBuffer text = new StringBuffer(description);
            int loc = (new String(text)).indexOf('\n');
            while (loc > 0) {
                text.replace(loc, loc + 1, "<BR>");
                loc = (new String(text)).indexOf('\n');
            }
            request.setAttribute("descript", text);
            
//            request.getRequestDispatcher("CreateContract.jsp").forward(request, response);
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
