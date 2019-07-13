package DAO;

import Model.Role;
import Model.Skill;
import Model.Status;
import Model.User;
import Utility.HibernateUtility;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public User getUserById(int idUser) {
        Session session = HibernateUtility.getSession();
        Transaction transaction = null;
        User user = null;

        try {
            transaction = session.beginTransaction();
            user = session.get(User.class, idUser);
            session.update(user);
            transaction.commit();
            session.close();
        } catch (HibernateException e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }

    public void addUser (String firstname, String lastname, String country, String birth_date, List<Skill> listSkill, int role, int status){

        Session session = HibernateUtility.getSession();
        Transaction transaction = null;

        try{

        transaction = session.beginTransaction();
        User user = new User(firstname, lastname, country, birth_date);
        RoleDAO roleDAO = new RoleDAO();
        StatusDAO statusDAO = new StatusDAO();
        user.setRole(roleDAO.getRoleById(role));
        user.setStatus(statusDAO.getStatusById(status));
        user.setSkills(listSkill);
        session.save(user);
        transaction.commit();
        } catch (HibernateException e){
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void updateUser(int id, String firstname, String lastname, String country, String birth_date, int status, int role, List<Skill> skills) {
        Session session = HibernateUtility.getSession();
        RoleDAO roleDAO = new RoleDAO();
        StatusDAO statusDAO = new StatusDAO();

        Transaction transaction = null;
        try {

            transaction = session.beginTransaction();
            Status status1 = statusDAO.getStatusById(status);
            Role role1 = roleDAO.getRoleById(role);

            User user = new User();
            user.setId(id);
            user.setFirstname(firstname);
            user.setLastname(lastname);
            user.setCountry(country);
            user.setBirth_date(birth_date);
            user.setRole(role1);
            user.setStatus(status1);
            user.setSkills(skills);
            session.saveOrUpdate(user);
            transaction.commit();
        } catch (HibernateException e){
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<User> userList(){
        Session session = HibernateUtility.getSession();
        Query listu=session.createQuery("from User ");
        List<User> userList = (ArrayList<User>) listu.list();
        session.close();
        return userList;
    }

    public List<User> search(String filterSearch, String inputSearch ){
        Session session = HibernateUtility.getSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> search = builder.createQuery(User.class);
        Root<User> root = search.from(User.class);
        search.select(root).where(builder.equal(root.get(filterSearch), inputSearch));
        Query<User> q = session.createQuery(search);
        List<User> userSearch = q.getResultList();
        session.close();
        return userSearch;
    }

    public void deleteUser(Integer userid){
        Session session = HibernateUtility.getSession();
        Transaction transaction = null;
        try {
            transaction=session.beginTransaction();
            User user = session.get(User.class, userid);
            if (user != null)
                session.delete(user);
            transaction.commit();
        } catch (HibernateException e){
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

}
