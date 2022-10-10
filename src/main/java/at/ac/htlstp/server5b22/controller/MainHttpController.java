package at.ac.htlstp.server5b22.controller;

import at.ac.htlstp.server5b22.endpoints.Endpoint;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
public class MainHttpController {

    @RequestMapping("/info")
    public String info(Model model) {
        model.addAttribute("datum",new Date());
        return "info";
    }
}
