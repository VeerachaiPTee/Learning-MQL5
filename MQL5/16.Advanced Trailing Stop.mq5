//16. Advanced Trailing Stop For Multi Positions Buy | Sell
//Veerachai 388
#include <Trade\Trade.mqh>
CTrade trade;


void OnTick()
  {

   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   if(PositionsTotal()<3)
     {
      trade.Buy(0.1,NULL,Ask,(Ask-1000*_Point),(Ask+500*_Point),NULL);
     }
     checkTralingStop(Ask);
  }
void checkTralingStop(double Ask) {
   double sl = NormalizeDouble(Ask-150*_Point,_Digits);
   
   for(int i=PositionsTotal()-1; i>=0 ;i--)
     {
      ulong positionTicket = PositionGetInteger(POSITION_TICKET);
      double currentStopLoss = PositionGetDouble(POSITION_SL);
      if(currentStopLoss<sl)
        {
         trade.PositionModify(positionTicket,(currentStopLoss+10*_Point),0);
        }
     }
}
