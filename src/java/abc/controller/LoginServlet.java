/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.controller;

import abc.admin.AdminDAO;
import abc.admin.AdminDTO;
import abc.boardmanager.BoardManagerDAO;
import abc.boardmanager.BoardManagerDTO;
import abc.customer.CustomerDAO;
import abc.customer.CustomerDTO;
import abc.owner.OwnerDAO;
import abc.owner.OwnerDTO;
import abc.resident.ResidentDTO;
import abc.resident.ResidentDAO;
import abc.seller.SellerDAO;
import abc.seller.SellerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

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
            String email = request.getParameter("emailtxt");
            String password = request.getParameter("passwordtxt");
            String role = request.getParameter("role");
            HttpSession s = request.getSession(false);
            String url = "";
//            out.print("hi");
//            out.print("email: "+email);
//            out.print("password: "+ password);
//            CustomerDTO user = CustomerDAO.getAccount("khachhanga@gmail.com", "123");
//            out.print(user.toString());
            
            
            switch (role) {
                case "Customer":
                    CustomerDTO customer = CustomerDAO.getAccount(email, password);
                     
                    if (customer != null) {
                        s.setAttribute("user", customer);
                        s.setAttribute("userType", "C");
                        url = "MainController?action=Find2contracts";
                        request.getRequestDispatcher(url).forward(request, response);
                    } else {
                        request.setAttribute("notification", "Account is not found");
                        request.getRequestDispatcher("Index.jsp").forward(request, response);
                    }
                    break;
                case "Owner":
                    OwnerDTO owner = OwnerDAO.getAccount(email, password);
                    if (owner != null) {
                        s.setAttribute("user", owner);
                        s.setAttribute("userType", "O");
                        url = "MainController?action=Find2contracts";
                        request.getRequestDispatcher(url).forward(request, response);
                    } else {
                        request.setAttribute("notification", "Account is not found");
                        request.getRequestDispatcher("Index.jsp").forward(request, response);
                    }
                    break;
                case "Resident":
                    ResidentDTO resident = ResidentDAO.getAccount(email, password);
                    if (resident != null) {
                        s.setAttribute("user", resident);
                        s.setAttribute("userType", "R");
                        url = "MainController?action=Find2contracts";
                        request.getRequestDispatcher(url).forward(request, response);
                    } else {
                        request.setAttribute("notification", "Account is not found");
                        request.getRequestDispatcher("Index.jsp").forward(request, response);
                    }
                    break;
                case "Seller":
                    SellerDTO seller = SellerDAO.getAccount(email, password);
                    if (seller != null) {
                        s.setAttribute("user", seller);
                        s.setAttribute("userType", "S");
                        url = "MainController?action=Find2contracts";
                        request.getRequestDispatcher(url).forward(request, response);
                    } else {
                        request.setAttribute("notification", "Account is not found");
                        request.getRequestDispatcher("Index.jsp").forward(request, response);
                    }
                    break;
                case "Admin":
                    AdminDTO admin = AdminDAO.getAccount(email, password);
                    if (admin != null) {
                        s.setAttribute("user", admin);
                        s.setAttribute("userType", "A");
                        url = "MainController?action=Find2contracts";
                        request.getRequestDispatcher(url).forward(request, response);
                    } else {
                        request.setAttribute("notification", "Account is not found");
                        request.getRequestDispatcher("Index.jsp").forward(request, response);

                    }
                    break;
                case "BoardManager":
                       BoardManagerDTO boardManager = BoardManagerDAO.getAccount(email, password);
                    if (boardManager != null) {
                       s.setAttribute("user", boardManager);
                       s.setAttribute("userType", "B");
                        
                        url = "MainController?action=Find2contracts";
                        request.getRequestDispatcher(url).forward(request, response);
                    } else {
                        request.setAttribute("notification", "Account is not found");
                        request.getRequestDispatcher("Index.jsp").forward(request, response);

                    }
                    break;
                   
            }
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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
