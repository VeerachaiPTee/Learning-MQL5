//7. HOW TO Add Comment To Chart
//Veerachai 388

#include <Trade\Trade.mqh>
CTrade trade;
void OnTick()
  {
//---
   double ask,bid;
   int spread;
   
   ask = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   bid = SymbolInfoDouble(Symbol(),SYMBOL_BID);
   
   //out values iun three lines
   Comment(StringFormat("Show price\nAsk = %G\nBidSpread = %d" , ask,bid,spread));
  }
//+------------------------------------------------------------------+
