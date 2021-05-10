package cn.bdqn.service;

import cn.bdqn.entity.Fruit;

import java.util.List;

/**
 * @Package: cn.bdqn.service
 * @Description:
 * @Author 杰
 * @Create 2021年04月06日 16时06分31秒
 */
public interface FruitService {

    List<Fruit> getFruitList();

    Fruit getFruitById(Integer fruitId);

    boolean updateF(Fruit fruit);

    boolean addF(Fruit fruit);

    boolean delF(Integer fruitId);
}
