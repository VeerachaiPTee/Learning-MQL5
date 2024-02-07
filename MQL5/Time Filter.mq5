//22. Time Filter
//Veerachai 388
#include <Trade\Trade.mqh>
CTrade trade;
input string startTradingTime = "09:00";
input string stopTradingTime = "10:00";
string currentTime;
bool tradingIsAllowed = false;
void OnTick()
  {
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   datetime time = TimeLocal();
   currentTime = TimeToString(time,TIME_MINUTES);
   if(checkTradingTime()== true)
   if(PositionsTotal() == 0)
   {
      trade.Buy(0.10,NULL,Ask,0,(Ask+100*_Point),NULL);
   }
   Comment(
      "Trading Is Allowed = ",tradingIsAllowed, "\n",
      "Current Time = ", currentTime,"\n",
      "Start Trading Time = ",startTradingTime,"\n",
      "Stop Trading Time = ",stopTradingTime 
   );
   
  }
bool checkTradingTime()
{
   if(StringSubstr(currentTime,0,5) == startTradingTime)tradingIsAllowed = true;
   if(StringSubstr(currentTime,0,5) == stopTradingTime)tradingIsAllowed = false;
   return tradingIsAllowed;
}
