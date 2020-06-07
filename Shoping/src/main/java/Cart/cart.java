package Cart;
import java.util.*;
import java.io.*;
public class cart implements Serializable
{
    float Sum=0;
    Hashtable<String,Integer> Goods=new Hashtable<String,Integer> ();

    public void cart()
    {
    }

    //获取每件商品的价格
    public float getPrice(String goodsname)
    {
        if(goodsname.equals("Book_1"))
            return new Float(59.0);
        else if(goodsname.equals("Book_2"))
            return new Float(37.0);
        else if(goodsname.equals("Book_3"))
            return new Float(49.0);
        else if(goodsname.equals("Book_4"))
            return new Float(27.0);
        else if(goodsname.equals("Book_5"))
            return new Float(32.0);
        else if(goodsname.equals("Book_6"))
            return new Float(28.0);
        else
            return new Float(0);
    }

    //将某个商品信息加入购物车
    public void add(String GoodsName,int GoodsNumber)
    {
        if(Goods.containsKey(GoodsName))
        {
            int Num=((Integer)Goods.get(GoodsName)).intValue();
            Num=Num+GoodsNumber;
            Goods.put(GoodsName,new Integer(Num));
            Sum=Sum+getPrice(GoodsName)*GoodsNumber;
        }
        else
        {
            Goods.put(GoodsName,new Integer(GoodsNumber));
            Sum=Sum+getPrice(GoodsName)*GoodsNumber;
        }
    }

    //获取购物车中所有商品信息
    public Hashtable ShowCartInf()
    {
        return Goods;
    }

    //从购物车中删除一件商品信息
    public void delete(String GoodsName)
    {
        int GoodsNum=((Integer)Goods.get(GoodsName)).intValue();
        Goods.remove(GoodsName);
        Sum=Sum-getPrice(GoodsName)*GoodsNum;
    }

    //获取购物车内商品总价格
    public float getSum()
    {
        return Sum;
    }
}
