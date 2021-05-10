package cn.bdqn.controller;

import cn.bdqn.entity.Fruit;
import cn.bdqn.service.FruitService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Package: cn.bdqn.controller
 * @Description:
 * @Author 杰
 * @Create 2021年04月06日 16时08分51秒
 */
@Controller
public class FruitController {
    @Autowired
    FruitService fruitService;


    @RequestMapping("list")
    public String list(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,Model model){
        PageHelper.startPage(pageNum,2);
        List<Fruit> list=fruitService.getFruitList();
        PageInfo<Fruit> info=new PageInfo<>(list);
        System.out.println(info.getPageSize()+"++++++++++++++++++++++++");
        model.addAttribute("pages",info);
        model.addAttribute("list",list);
        return "index";
    }
    @ResponseBody
    @RequestMapping("getFruitById")
    public Fruit getFruitById(Integer fruitId){
        return fruitService.getFruitById(fruitId);
    }
    @ResponseBody
    @RequestMapping("addandUpdate")
    public boolean addandUpdate(@RequestParam(value = "fruitId",defaultValue = "0") Integer fruitId, Fruit fruit){
        if (fruitId==0){
            return fruitService.addF(fruit);
        }else {
            return fruitService.updateF(fruit);
        }
    }
    @ResponseBody
    @RequestMapping("delF")
    public boolean delF(Integer fruitId){
        return fruitService.delF(fruitId);
    }

}

