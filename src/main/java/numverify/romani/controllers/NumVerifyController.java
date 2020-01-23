package numverify.romani.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import numverify.romani.entities.NumVerifyHistory;
import numverify.romani.model.NumberVerify;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.IOException;
import java.net.*;
import java.util.List;


@Controller
public class NumVerifyController {

    @RequestMapping("/")
    public String numVerifyPage(Model model) {
        model.addAttribute("numverify", new NumberVerify());
        return "index";
    }

    @RequestMapping("/checkValidNumber")
    public String jsonTest(@ModelAttribute("numverify") NumberVerify numberVerify, Model model)
    {
        String link ="http://apilayer.net/api/validate?access_key=63932447085a399140d5fdcdc8643af4&number="+ numberVerify.getNumber() +"&country_code=&format=1";

        try {
            URL url = new URL(link);

            ObjectMapper mapper = new ObjectMapper();
            NumberVerify numberVerify1 =  mapper.readValue(url, NumberVerify.class);
            model.addAttribute("numInfo", numberVerify1);

            String validNumberStaus = "";
            String number = "";
            if (numberVerify1.isValid() == false) {
                model.addAttribute("message" , "invalid number");
                validNumberStaus = "invalid number";
                number = "";
            } else {
                validNumberStaus = "valid number";
                number = numberVerify1.getNumber();
            }


            SessionFactory sessionFactory = new Configuration()
                    .configure("connection-hibernate.xml")
                    .addAnnotatedClass(NumVerifyHistory.class)
                    .buildSessionFactory();

            Session session = sessionFactory.getCurrentSession();

            try {
                session.beginTransaction();
                NumVerifyHistory numVerifyHistory = new NumVerifyHistory(validNumberStaus , number);
                session.save(numVerifyHistory);
                session.getTransaction().commit();
            } finally {
                session.close();
                sessionFactory.close();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return"index";

    }

    @RequestMapping("showHistoryPage")
    public String showHistoryPage(Model model)
    {
        SessionFactory sessionFactory = new Configuration()
                .configure("connection-hibernate.xml")
                .addAnnotatedClass(NumVerifyHistory.class)
                .buildSessionFactory();

        Session session = sessionFactory.getCurrentSession();

        try {
            session.beginTransaction();

            List<NumVerifyHistory> numVerifyHistories = session.createQuery("from NumVerifyHistory").getResultList();

            model.addAttribute("numVerifyHistories", numVerifyHistories);

            session.getTransaction().commit();
        } finally {
            session.close();
            sessionFactory.close();
        }

        return "history-table";
    }

}
