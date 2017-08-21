package cn.tw.controller;

import cn.tw.pojo.User;
import cn.tw.service.UserServise;
import cn.tw.util.MessageBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping
public class LoginController {
    @Resource
    private UserServise userServise;

    /*@RequestMapping("doLogin")
    public String login(String username,String password, HttpServletRequest req){
        try {
            Emp emp=empServise.findEmpByAccount(username,password);
            req.getSession().setAttribute("emp",emp);
        } catch (Exception e) {
            req.setAttribute("msg",e.getMessage());
            return "forward:login.jsp";
        }
        return "redirect:toIndex";
    }*/
    @RequestMapping("doLogin")
    public @ResponseBody
    MessageBean login(String username, String password, HttpServletRequest request) {
        try {
            User user=userServise.findUserByAccount(username,password);
            request.getSession().setAttribute("user",user);
        } catch (Exception e) {
            return new MessageBean("errMSG",e.getMessage());
        }
        return new MessageBean("succMSG","登录成功！");
    }
    @RequestMapping({"/","toLogin"})
    public String toLogin(){
        return "forward:login.jsp";
    }
    @RequestMapping("toIndex")
    public String toIndex(){
        return "index";
    }
    @RequestMapping("logout")
    public String toLogout(HttpServletRequest request){
        request.getSession().setAttribute("user", null);
        return "redirect:toLogin";
    }
}
