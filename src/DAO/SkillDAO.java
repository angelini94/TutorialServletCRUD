package DAO;

import Model.Skill;
import Model.Status;
import Utility.HibernateUtility;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class SkillDAO {

    public List<String> getSkillListFromId(int idUser) {
        Session session = HibernateUtility.getSession();
        List<String> skillUser = session.createNativeQuery("from skills s, users_skills us, users u" +
                " where s.skills_id = us.fk_skill " +
                "and us.fk_user = u.user_id " +
                "and u.user_id="+idUser).list();
        session.close();
        return skillUser;
    }

    public List<Skill> getSkillList(){
        Session session = HibernateUtility.getSession();
        Query lists=session.createQuery("from Skill ");
        List<Skill> skillList = (ArrayList<Skill>) lists.list();
        session.close();
        return skillList;
    }

}
