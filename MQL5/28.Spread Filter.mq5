//28.Spread Filter
//Veerachai 388
#include <Trade\Trade.mqh>
CTrade trade;
input int maxSpread = 10;
void OnTick()
  {
//---
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   int currentSpread = SymbolInfoInteger(_Symbol,SYMBOL_SPREAD);
   if(currentSpread >= maxSpread && PositionsTotal()<1)
    
      trade.Buy(0.1,NULL,Ask,Ask-300*_Point,NULL);
      Comment("Current spread = ", currentSpread);
  }
//+------------------------------------------------------------------+
