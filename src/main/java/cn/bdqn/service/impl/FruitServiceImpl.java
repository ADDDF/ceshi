package cn.bdqn.service.impl;

import cn.bdqn.entity.Fruit;
import cn.bdqn.mapper.FruitMapper;
import cn.bdqn.service.FruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Package: cn.bdqn.service.impl
 * @Description:
 * @Author 杰
 * @Create 2021年04月06日 16时07分00秒
 */
@Service
public class FruitServiceImpl implements FruitService {
    @Autowired
    FruitMapper fruitMapper;
    @Override
    public List<Fruit> getFruitList() {
        return fruitMapper.getFruitList();
    }

    @Override
    public Fruit getFruitById(Integer fruitId) {
        return fruitMapper.getFruitById(fruitId);
    }

    @Override
    public boolean updateF(Fruit fruit) {
        return fruitMapper.updateF(fruit)>0?true:false;
    }

    @Override
    public boolean addF(Fruit fruit) {
        return fruitMapper.addF(fruit)>0?true:false;
    }

    @Override
    public boolean delF(Integer fruitId) {
        return fruitMapper.delF(fruitId)>0?true:false;
    }
}
