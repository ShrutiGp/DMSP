package guestuser;


import java.util.*;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ManageUser {
    private static SessionFactory factory;
    public int servicing(int reg_no, String mod, String radio, String dd, String loginuser) {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }

        Session session = factory.openSession();
        Transaction tx = null;
        Integer in = null;
        try {
            tx = session.beginTransaction();
            UserService employee = new UserService(reg_no, mod, radio, dd, "Confirmed", loginuser);
            in = (Integer)session.save(employee);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        if( in != 0)
            return 1;
        else
        return -1;
    }



}
