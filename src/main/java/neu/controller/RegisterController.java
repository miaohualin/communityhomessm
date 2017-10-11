package neu.controller;

import neu.action.RegisterAction;
import neu.entity.User;
import neu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

/**
 * Created by 黄宇航 on 2017/9/27.
 */
@Controller
public class RegisterController {
    @Autowired
    private UserService userservice;


    @RequestMapping("/register")
    public String getToRegister(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "homepage";
        } else {
            return "register";
        }
    }

    @RequestMapping("/checkregister")
    @ResponseBody
    public String checkRegister(@RequestParam("username") String username, @RequestParam("password") String password,
                                @RequestParam("email") String email, @RequestParam("university") String university,
                                @RequestParam("usercode") String usercode, HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "islogin";
        }

        String emailcode;
        try {
            emailcode = session.getAttribute("emailcode").toString();
        } catch (Exception e) {
            return "error";
        }

        if (!emailcode.equals(usercode)) {
            return "codeerror";
        } else {
            User user = new User();

            user.setUsername(username);
            user.setPassword(password);
            user.setMailbox(email);
            user.setSchool(university);
            user.setPicture("default.jpg");
            user.setProfession("");
            user.setTelnumber("");
            user.setGender("");
            user.setName("");

            int result = userservice.add(user);

            if (result == -2) {
                return "exist";
            } else if (result == 1) {
                return "done";
            } else {
                return "error";
            }
        }
    }

    @RequestMapping("/sendemail")
    @ResponseBody
    public String sendEmail(@RequestParam("email") String email, HttpSession session) {
        if (userservice.queryByEmail(email) != null) {
            return "exist";
        } else if (session.getAttribute("user") != null) {
            return "error";
        }

        RegisterAction registeraction = RegisterAction.getInstance();
        String code = registeraction.getRandomCode();

        session.setAttribute("emailcode", code);

        try {
            return registeraction.sendEmail(email, code) ? "done" : "error";
        } catch (Exception e) {
            return "error";
        }
    }
}
