package cn.bdqn.mapper;

import cn.bdqn.entity.Fruit;

import java.util.List;

/**
 * @Package: cn.bdqn.mapper
 * @Description:
 * @Author 杰
 * @Create 2021年04月06日 15时59分58秒
 */
public interface FruitMapper {

    List<Fruit> getFruitList();

    Fruit getFruitById(Integer fruitId);

    Integer updateF(Fruit fruit);

    Integer addF(Fruit fruit);

    Integer delF(Integer fruitId);

}
