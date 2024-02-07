// 12. HOW TO Close Sell Position
// Veerachai 388

#include <Trade\Trade.mqh>
CTrade trade;

void OnTick()
  {
//---
   closeSellPositions();
  }
//+------------------------------------------------------------------+

void closeSellPositions() {
   for(int i=PositionsTotal()-1; i>0; i--)
     {
      ulong ticket = PositionGetTicket(i);
      ulong positionDilection = PositionGetInteger(POSITION_TYPE);
      if(positionDilection == POSITION_TYPE_SELL)
        {
         trade.PositionClose(ticket);
        }
     }


}