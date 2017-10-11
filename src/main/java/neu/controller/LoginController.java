package neu.controller;

import neu.entity.User;
import neu.service.JoiningAssnService;
import neu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 黄宇航 on 2017/9/27.
 */
@Controller
public class LoginController {
    @Autowired
    private UserService userservice;
    @Autowired
    private JoiningAssnService joiningassnservice;

    @RequestMapping("/login")
    public String getToLogin(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "login";
        } else {
            return "homepage";
        }
    }

    @RequestMapping("/checklogin")
    @ResponseBody
    public String checkLogin(@RequestParam("username") String username, @RequestParam("password") String password,
                             @RequestParam("usercode") String usercode, HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "error";
        }

        User user = userservice.queryByUsernameAndPassword(username, password);

        if (user == null) {
            return "nouser";
        } else {
            // user.setUseractivities();
            //user.setUsercommunities();
            user.setUserjoiningassns(joiningassnservice.queryByUserid(user.getId()));
            session.setAttribute("user", user);

            return "pass";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");

        return "homepage";
    }

    @RequestMapping("adminlogin")
    public String getToLogIn(HttpSession session) {
        Object obj = session.getAttribute("admin");

        if (obj != null && obj.toString().equals("1")) {
            return "admin";
        } else {
            return "adminlogin";
        }
    }

    @RequestMapping("checkadmin")
    @ResponseBody
    public String checkAdmin(@RequestParam("username") String username, @RequestParam("password") String password,
                             HttpSession session) {
        if (!username.equals("neuadmin") || !password.equals("neuone")) {
            return "error";
        } else {
            session.setAttribute("admin", 1);
            return "pass";
        }
    }
}
