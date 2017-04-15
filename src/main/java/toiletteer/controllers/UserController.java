package toiletteer.controllers;

import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import toiletteer.dao.UserDAO;
import toiletteer.models.dao.UserDB;
import toiletteer.models.rest.UserRest;

import java.util.List;

@RestController
public class UserController {

    private final Logger LOG = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserDAO userDAO;

    @RequestMapping("/users/fb_login")
    public String facebookLogin() {
        return "your face";
    }

    @RequestMapping("/users/list")
    public List<UserRest> listUsers() {
        try {
            Iterable<UserDB> all = userDAO.findAll();
            List<UserRest> allRest = Lists.newArrayList();
            for (UserDB u : all) {
                allRest.add(new UserRest(u));
            }
            return allRest;
        } catch (Exception e) {
            LOG.error(e.toString());
            e.printStackTrace();
            return null;
        }
    }
}
