/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.controller;

import abc.customer.CustomerDAO;
import abc.customer.CustomerDTO;
import abc.error.ErrorDTO;
import abc.owner.OwnerDAO;
import abc.owner.OwnerDTO;
import abc.resident.ResidentDAO;
import abc.resident.ResidentDTO;
import abc.seller.SellerDAO;
import abc.seller.SellerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AddUserServlet extends HttpServlet {

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
            String role = request.getParameter("role");
            String email = request.getParameter("txtEmail");
            String passWord = request.getParameter("txtPassword");
            String id = request.getParameter("txtID");
            String phone = request.getParameter("txtPhone");
            String fullName = request.getParameter("txtName");
            String dob = request.getParameter("txtDob");
            String address = request.getParameter("txtAddress");
            String avatar = request.getParameter("txtAvatar");
            int rs = 0;
            boolean flag = false;
            String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
            ErrorDTO err = new ErrorDTO();
            CustomerDTO customer = CustomerDAO.getAccount(email );
            OwnerDTO owner = OwnerDAO.getAccount(email );
            ResidentDTO resident = ResidentDAO.getAccount(email );
            SellerDTO seller = SellerDAO.getAccount(email );
            if(customer!=null||owner!=null||resident!=null||seller!=null){
                request.setAttribute("exist", "Can't create because the account associates with this email is found");
                request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
            }
            if (!email.matches(regex)) {
                flag = true;

                err.setEmailErr("Email is in valid");
            }
            if (passWord.trim().length() < 6 || passWord.trim().length() > 30) {
                flag = true;

                err.setPasswordErr("Requires 6-30 chars");
            }

            if (id.trim().length() != 12) {
                flag = true;
                err.setIdErr("ID is invalid");
            }
            if (phone.length() < 10) {
                flag = true;
                err.setPhoneErr("Invalid");
            }
            if (!flag) {
                switch (role) {
                    case "customer":
                        rs = CustomerDAO.insertCustomer(email, passWord, id, phone, avatar, fullName, dob, address);
                        if (rs > 0) {
                            request.setAttribute("notification", "Successfully");
                            request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
                        } else {

                            err.setExisted("Email or id is already existed");
                            request.setAttribute("ERROR", err);
                            request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
                        }
                        break;
                    case "owner":
                        rs = OwnerDAO.insertOwner(email, passWord, id, phone, avatar, fullName, dob, address);
                        if (rs > 0) {
                            request.setAttribute("notification", "Successfully");
                            request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
                        } else {

                            err.setExisted("Email or id is already existed");
                            request.setAttribute("ERROR", err);
                            request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
                        }
                        break;
                    case "resident":
                        rs = ResidentDAO.insertResident(email, passWord, id, phone, avatar, fullName, dob, address);
                        if (rs > 0) {
                            request.setAttribute("notification", "Successfully");
                            request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
                        } else {

                            err.setExisted("Email or id is already existed");
                            request.setAttribute("ERROR", err);
                            request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
                        }
                        break;
                    case "seller":
                        rs = SellerDAO.insertSeller(email, passWord, id, phone, avatar, fullName, dob, address);
                        if (rs > 0) {
                            request.setAttribute("notification", "Successfully");
                            request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
                        } else {

                            err.setExisted("Email or id is already existed");
                            request.setAttribute("ERROR", err);
                            request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
                        }
                        break;
                        

                }

            } else {
                request.setAttribute("ERROR", err);
                request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
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
