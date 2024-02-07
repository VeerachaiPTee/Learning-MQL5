//14. HOW TO Only Trade on a New Bar
//Veerachai 388
#include <Trade\Trade.mqh>
CTrade trade;

bool newBar;
datetime lastBar;
MqlRates bar[];
int OnInit()
  {
   ArraySetAsSeries(bar,true);
   return(INIT_SUCCEEDED);
  }
void OnTick()
  {
double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK),_Digits);
   CopyRates(_Symbol,PERIOD_CURRENT,0,5,bar);
   if(bar[0].time > lastBar)
     {
      newBar = true;
      lastBar=bar[0].time;
     }else
        {
         newBar = false;
        }   
    if(newBar == true)
       {
        Alert("New Bar: ",lastBar);
        trade.Buy(0.01,NULL,Ask,0,(Ask+100*_Point),NULL);
       }
  }
//+------------------------------------------------------------------+
