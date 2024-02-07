//26. Dynamic Lot Sizing
//Veerachai 388
#include <Trade\Trade.mqh>
CTrade trade;
void OnTick()
  {
   double equlity = AccountInfoDouble(ACCOUNT_EQUITY);
   double dynamicPositionSize = NormalizeDouble((equlity/1000000),2);
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   if(PositionsTotal()<100 && OrdersTotal()<100)
   trade.BuyStop(dynamicPositionSize,Ask+100*_Point,_Symbol,0,Ask+300*_Point,ORDER_TIME_GTC,0,0);
   Comment("Dynamic Position size: ",dynamicPositionSize);
   
  }

