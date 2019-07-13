package DAO;

import Model.Role;
import Model.Status;
import Utility.HibernateUtility;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class StatusDAO {

    public Status getStatusById(int idStatus){
        Session session = HibernateUtility.getSession();
        Transaction transaction = null;
        Status status = null;

        try {
            transaction = session.beginTransaction();
            status = session.get(Status.class, idStatus);
            transaction.commit();
            session.close();
        } catch (HibernateException e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return status;
    }

    public List<Status> getStatusList(){
        Session session = HibernateUtility.getSession();
        Query lists=session.createQuery("from Status ");
        List<Status> statusList = (ArrayList<Status>) lists.list();
        session.close();
        return statusList;
    }
}
