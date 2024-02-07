//10. HOW TO Close Buy Position
//Veerachai 388 

#include <Trade\Trade.mqh>
CTrade trade;
void OnTick()
  {
//---
   closeBuyPositions();
  }
//+------------------------------------------------------------------+

void closeBuyPositions()
{
   for (int i=PositionsTotal()-1; i>=0; i-- ) {
   ulong ticket = PositionGetTicket(i);;
   ulong positionDirection = PositionGetInteger(POSITION_TYPE);
   if(positionDirection == POSITION_TYPE_BUY)
      {
      
         trade.PositionClose(ticket);
      }
   }

}
