package Controller;

import DAO.RoleDAO;
import DAO.SkillDAO;
import DAO.StatusDAO;
import DAO.UserDAO;
import Model.Role;
import Model.Skill;
import Model.Status;
import Model.User;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ControllerUser", urlPatterns = { "/ControllerUser.do" })
public class ControllerUser extends HttpServlet {


    private Integer idrole, idstatus, IdUser;
    private String idRole, idStatus, firstname, lastname, country, birthdate;
    private List<Skill> skills = new ArrayList<>();

    public void setParameters(HttpServletRequest request){
        idRole=request.getParameter("role");
        idStatus=request.getParameter("status");
        firstname=request.getParameter("firstname");
        lastname=request.getParameter("lastname");
        country=request.getParameter("country");
        birthdate=request.getParameter("birth_date");
        idrole=Integer.parseInt(idRole);
        idstatus=Integer.parseInt(idStatus);
        String language = "";
        String[] lang = request.getParameterValues("skill");
        if (lang != null){
            int j;
            for (j = 0; j < lang.length; j++) {
                language = lang[j];
                Integer idskill = Integer.parseInt(language);
                skills.add(new Skill(idskill));
            }
        }else {}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDAO userDAO = new UserDAO();
        SkillDAO skillDAO = new SkillDAO();
        StatusDAO statusDAO = new StatusDAO();
        RoleDAO roleDAO = new RoleDAO();

        String iduser = request.getParameter("user_id");
        boolean validation = false;

        if (iduser == null || iduser.equals("") || iduser.equals("0")) {

            setParameters(request);

            if (request.getParameter("firstname").equals("")){
                request.setAttribute("errFirst", "Firstname cannot be null");
                validation = true;
            }
            if (request.getParameter("lastname").equals("")){
                request.setAttribute("errLast", "Lastname cannot be null");
                validation = true;
            }
            if (request.getParameter("country").equals("")){
                request.setAttribute("errCoun", "Country cannot be null");
                validation = true;
            }
            if (request.getParameter("birth_date").equals("")){
                request.setAttribute("errDate", "Birth Date cannot be null");
                validation = true;
            }
            if (!validation){

                userDAO.addUser(firstname, lastname, country, birthdate, skills, idrole, idstatus);
                response.sendRedirect("Home");
                skills.clear();
            } else {
                request.setAttribute("role", roleDAO.getRoleList());
                request.setAttribute("skill", skillDAO.getSkillList());
                request.setAttribute("status", statusDAO.getStatusList());
                request.getRequestDispatcher("/userform.jsp").forward(request,response);
            }

        } else {

            setParameters(request);

            if (firstname.equals("")){
                request.setAttribute("errFirst", "Firstname cannot be null");
                validation = true;
            }

            if (lastname.equals("")){
                request.setAttribute("errLast", "Lastname cannot be null");
                validation = true;
            }
            if (country.equals("")){
                request.setAttribute("errCoun", "Country cannot be null");
                validation = true;
            }
            if (birthdate.equals("")){
                request.setAttribute("errDate", "Birth Date cannot be null");
                validation = true;
            }
            if (!validation){
                String idU = request.getParameter("user_id");
                IdUser = Integer.parseInt(idU);
                userDAO.updateUser(IdUser, firstname, lastname, country, birthdate, idstatus, idrole, skills);
                response.sendRedirect("Home");
                skills.clear();
            }
            else {
                request.setAttribute("user", userDAO.getUserById(Integer.parseInt(request.getParameter("user_id"))));
                request.setAttribute("role", roleDAO.getRoleList());
                request.setAttribute("skill", skillDAO.getSkillList());
                request.setAttribute("status", statusDAO.getStatusList());
                request.getRequestDispatcher("/userform.jsp").forward(request,response);
            }

        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDAO userDAO = new UserDAO();
        RoleDAO roleDAO = new RoleDAO();
        StatusDAO statusDAO = new StatusDAO();
        SkillDAO skillDAO = new SkillDAO();

        List<Role> role = roleDAO.getRoleList();
        List<Status> status = statusDAO.getStatusList();
        List<Skill> skills = skillDAO.getSkillList();

        String idUser = request.getParameter("user_id");

        if ((idUser)!=null && !idUser.isEmpty()){
           User user = userDAO.getUserById(Integer.parseInt(idUser));
            request.setAttribute("user", user);
        }

        request.setAttribute("role", role);
        request.setAttribute("status", status);
        request.setAttribute("skill", skills);

        RequestDispatcher view = request.getRequestDispatcher("userform.jsp");       // lo inviamo alla JSP
        view.forward(request, response);

    }

}
