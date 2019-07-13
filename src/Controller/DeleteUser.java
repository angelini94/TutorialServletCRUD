package Controller;

import DAO.UserDAO;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet(description = "Create new user Servlet", urlPatterns = { "/DeleteUser.do" })
public class DeleteUser extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {


    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        UserDAO userDAO = new UserDAO();
        String iduser = request.getParameter("user_id");

        userDAO.deleteUser(Integer.parseInt(iduser));
        response.sendRedirect("Home");

    }
}
