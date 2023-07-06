import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/requests/order_request/order_request.dart';
import '../../data/responses/all_food_response/all_food_response.dart';
import '../../data/responses/order_response/order_response.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of<OrderCubit>(context);

  OrderResponse orderResponse = OrderResponse();
  static int totalPrice = 0;
  static List<AllFoodData> listOfOrders = [];
  static List<num> listOfQuantities = [];

  void increaseQuantity(int index,AllFoodData allFoodData){
    listOfQuantities[index]+=1;
    totalPrice = totalPrice + int.parse(allFoodData.price);
    emit(QuantityChanged());
  }

  void decreaseQuantity(int index,AllFoodData allFoodData){
    listOfQuantities[index]-=1;
    if(listOfQuantities[index]==0)
      {
        listOfQuantities.removeAt(index);
        listOfOrders.removeAt(index);
      }
    totalPrice = totalPrice - int.parse(allFoodData.price);
    emit(QuantityChanged());
  }

  List<AllFoodData> getOrders(){
    return listOfOrders;
  }
  List<num> getQuantities(){
    return listOfQuantities;
  }

  void addOrderToList(AllFoodData allFoodData,)
  {
    listOfOrders.add(allFoodData);
    listOfQuantities.add(1);
    totalPrice = totalPrice+int.parse(allFoodData.price) ;
    emit(TotalPriceChangedState());
  }

  void removeOrderFromList({required int index,}){
    totalPrice=totalPrice-int.parse(listOfOrders[index].price) * listOfQuantities[index].toInt();
    listOfOrders.removeAt(index);
    listOfQuantities.removeAt(index);
    emit(TotalPriceChangedState());
  }

  int getTotalPrice(){
    return totalPrice;
  }

  void createOrder({required num quantity, required num id}) {
    emit(OrderLoadingState());
    OrderRequest().orderRequest(id: id, quantity: quantity).then((value) {
      orderResponse = value;
      emit(OrderSuccessState());
    }).catchError((error) {
      emit(OrderFailedState());
    });
  }

  void createOrders(){
    for(int i = 0;i<listOfOrders.length;i++){
      createOrder(quantity: listOfQuantities[i], id: listOfOrders[i].id);
    }
  }

}
