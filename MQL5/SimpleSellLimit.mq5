// 6. Simple Sell Limit
// Veerachai 388

#include <Trade\Trade.mqh>
CTrade trade;
void OnTick()
  {
   //Get the asl price
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   
   //Get the bid price
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   
   //If no order and no position exists
   if(OrdersTotal()==0 && PositionsTotal()==0)
     {
      trade.SellLimit(0.10,(Ask+(200*_Point)),_Symbol,0,(Bid-(200*_Point)),ORDER_TIME_GTC,0,NULL);
     }
  }
//+------------------------------------------------------------------+
