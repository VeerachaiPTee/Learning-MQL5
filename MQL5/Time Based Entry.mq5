// 18. Time Based Entry
// Veerachai 388

#include <Trade\Trade.mqh>;
CTrade trade;

void OnTick()
  {
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   datetime time = TimeLocal();
   string hoursAndMinutes = TimeToString(time, TIME_MINUTES);
   if((PositionsTotal() == 0) && (StringSubstr(hoursAndMinutes,0,5)== "15:00"))
     {
      trade.Buy(0.10,NULL,Ask,0,(Ask+100*_Point),NULL);
     }
   Comment(hoursAndMinutes);
  }

