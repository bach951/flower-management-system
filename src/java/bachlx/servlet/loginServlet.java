/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bachlx.servlet;

import bachlx.dao.AccountDAO;
import bachlx.dao.OrderDAO;
import bachlx.dto.Account;
import bachlx.dto.Order;
import bachlx.dto.random;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AD
 */
public class loginServlet extends HttpServlet {

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
            ArrayList<Order> od;
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            String save = request.getParameter("savelogin");
            Account acc = null;
            try {
                if (acc != null || email.equals("") || password == null || password.equals("")) {
                    Cookie[] c = request.getCookies();
                    String token = "";
                    if (c != null) {
                        for (Cookie aCookie : c) {
                            if (aCookie.getName().equals("selector")) {
                                token = aCookie.getValue();
                            }
                        }
                    }
                    if (!token.equals("")) {
                        od = OrderDAO.getOrders(email);
                        request.setAttribute("listOd", od);
                        RequestDispatcher rd = request.getRequestDispatcher("personalPage.jsp");
                        rd.forward(request, response);
                    } else {
                        response.sendRedirect("errorpage.html");
                    }
                } else {
                    acc = AccountDAO.getAccount(email, password);
                    if (acc != null) {

                        if (acc.getRole() == 1) {
//chuyen qua homepage
                            HttpSession ss = request.getSession(true);
                            if (ss != null) {
                                ss.setAttribute("name", acc.getFullname());
                                ss.setAttribute("email", email);
                                ss.setAttribute("password", password);
                                ss.setAttribute("accId", acc.getAccID());
//                                response.sendRedirect("personalPage.jsp");
                                if (save != null) {

                                    String random1 = null;
                                    random1 = random.randomAlphaNumeric(6);
                                    String token = random1;
                                    AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 2);
                                    response.addCookie(cookie);
//                                
                                }
                                RequestDispatcher rd = request.getRequestDispatcher("AdminIndex.jsp");
                                rd.forward(request, response);
                            }
                        } //user
                        else {
//                        response.sendRedirect("welcome.html");

                            HttpSession ss = request.getSession(true);
                            if (ss != null) {

                                ss.setAttribute("name", acc.getFullname());
                                ss.setAttribute("email", email);
                                ss.setAttribute("password", password);
                                ss.setAttribute("accId", acc.getAccID());
//                                response.sendRedirect("personalPage.jsp");
                                if (save != null) {

                                    String random1 = null;
                                    random1 = random.randomAlphaNumeric(6);
                                    String token = random1;
                                    AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 2);
                                    response.addCookie(cookie);
//                                
                                }
                                od = OrderDAO.getOrders(email);
                                request.setAttribute("listOd", od);
                                RequestDispatcher rd = request.getRequestDispatcher("personalPage.jsp");
                                rd.forward(request, response);
                            }

                        }
                    } else {
//                        response.sendRedirect("errorpage.html");
                        request.setAttribute("invalidEmail", "email or password invalid");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
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
