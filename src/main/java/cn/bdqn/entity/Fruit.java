package cn.bdqn.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Fruit {

  private Integer fruitId;
  private String type;
  private String breed;
  private String area;
  private String brief;
  private Integer weight;
  private double price;

}
