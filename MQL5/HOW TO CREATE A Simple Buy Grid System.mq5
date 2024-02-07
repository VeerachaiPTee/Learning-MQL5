//15. HOW TO CREATE A Simple Buy Grid System
// Veerachai 388
#include <Trade\Trade.mqh>
CTrade trade;
MqlRates priceInfo[];

string signal = "";

void OnTick()
  {
//---
   static double NextBuyPrice;
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   ArraySetAsSeries(priceInfo,true);  
   int priceData = CopyRates(_Symbol,_Period,0,3,priceInfo); 
   if(OrdersTotal()==0)
      NextBuyPrice = 0;
      signal = checkEntrySignal();     
      if(Ask >= NextBuyPrice)
      if(signal == "buy")
      {
         trade.Buy(0.1,_Symbol,Ask,Ask-50*_Point,Ask+300*_Point);        
         NextBuyPrice = Ask+50*_Point;
      }
      Comment("Ask: ",Ask, "\n","Next Buy Price: ",NextBuyPrice);
  }
     string checkEntrySignal() {   
      if(priceInfo[1].close > priceInfo[1].open)
        signal = "buy";        
      if(priceInfo[1].close < priceInfo[1].open)
      signal = "sell";
        return signal;
     }
