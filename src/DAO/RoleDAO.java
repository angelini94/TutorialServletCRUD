package DAO;

import Model.Role;
import Utility.HibernateUtility;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class RoleDAO {

    public Role getRoleById(int idRole ){
        Session session = HibernateUtility.getSession();
        Transaction transaction = null;
        Role role = null;

        try {
            transaction = session.beginTransaction();
            role = session.get(Role.class, idRole);
            session.update(role);
            transaction.commit();
            session.close();
        } catch (HibernateException e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return role;
    }

    public List<Role> getRoleList(){
        Session session = HibernateUtility.getSession();
        Query listr=session.createQuery("from Role");
        List<Role> roleList = (ArrayList<Role>) listr.list();
        session.close();
        return roleList;
    }


}
