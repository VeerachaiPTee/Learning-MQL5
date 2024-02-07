//13. HOW TO Access Previous Bar Data 
//Veerachai 388

#include <Trade\Trade.mqh>
CTrade trade;

MqlRates bar[];

int OnInit()
  {
//---
   ArraySetAsSeries(bar, true);
//---
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
  }
void OnTick()
  {
//---
   CopyRates(_Symbol,PERIOD_CURRENT,0,10,bar);
   Print(bar[1].open);
   Print(bar[1].close);
   Print(bar[1].high);
   Print(bar[1].low);
  }
//+------------------------------------------------------------------+
