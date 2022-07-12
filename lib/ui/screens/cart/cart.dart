import 'package:calms_parent/common/util/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartList = [];
  int selectedBoxIndex = 0;

  @override
  void initState() {
    super.initState();
    initValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          title: Text(
            "CART",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white),
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.zero,
            color: Colors.white,
            padding: EdgeInsets.zero,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: cartList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    new Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        child: cartList[index]['image'].length > 0
                            ? Image.network(cartList[index]['image'][0],
                                // width: 300,
                                height: 100,
                                fit: BoxFit.fill)
                            : Image.asset("assets/images/meal_default.png"),
                      ),
                      title: Text(
                        cartList[index]['item_name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 80),
                            child: Text(
                              cartList[index]["description"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new RichText(
                                text: new TextSpan(
                                  text: '',
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text:
                                            'MYR ${double.parse(cartList[index]["price"]).toStringAsFixed(2)}',
                                        style: new TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green)),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 5),
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.grey.shade200,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text("1"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 5),
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  ]);
                }),
          ),
        ),
      ]),
    );
  }

  void initValues() {
    cartList = [
      {
        "category": "Stationery",
        "item_name": "Color Box",
        "inventory_code": "S1011",
        "description":
            "46 PCS Color Set has a lot of fun features to keep your baby engaged. It has 42 pieces It contain 12 water color, 6 sketch color, a sharpner, an eraser, 10 crayons color, 8 oil pastel colors, a glue, a paper clip and a box. Very nice product for your kid It improves creative power of your dear ones. Improves visual skills, creative skills and coordination skills of your child Designed keeping safety of your child on priority basis Always choose Happiesta for your kids Happiness",
        "is_dress": 1,
        "price": "10.00",
        "discount": "5%",
        "available_quantity": 50,
        "applicable_group": "All",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "colors": ["White", "Black", "Red", "Blue"],
        "size": ["S", "M", "L", "XL", "XXL"],
        "merchantimage":
            "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
      },
      {
        "category": "Stationery",
        "item_name": "student-plastic-id-card-holder-500x500",
        "inventory_code": "S1011",
        "description": "student-plastic-id-card-holder-500x500",
        "is_dress": "0",
        "price": "10.00",
        "discount": "5%",
        "available_quantity": 50,
        "applicable_group": "All",
        "image": [
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "merchantimage":
            "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
      },
      {
        "category": "Stationery",
        "item_name": "Breakfast",
        "inventory_code": "S1011",
        "description": "student-plastic-id-card-holder-500x500",
        "is_dress": "0",
        "price": "10.00",
        "discount": "5%",
        "available_quantity": 50,
        "applicable_group": "All",
        "image": [],
        "merchantimage":
            "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
      },
    ];
  }
}
