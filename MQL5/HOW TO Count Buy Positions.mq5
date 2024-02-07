//8. HOW TO Count Buy Positions
//Veerachai 388

#include <Trade\Trade.mqh>
CTrade trade;

void OnTick()
  {
//---
   Comment("Number of buy positions: ", countBuyPositions());
  }
//+------------------------------------------------------------------+ 
int countBuyPositions()
{
   int numberBuyPosition = 0; // local Variable

   for(int i=PositionsTotal()-1; i>= 0;i--) //look at all positions
   {
   string currencyPair = PositionGetSymbol(i); // identify currency
   //get the position type
   int PositionDirection= PositionGetInteger(POSITION_TYPE);
   //if symbol on chart aquals position symbol
   if(Symbol()==currencyPair)
   //if position type is abuy positions
   if(PositionDirection==POSITION_TYPE_BUY)
     {
      numberBuyPosition=numberBuyPosition+1;
     }
   }
   return numberBuyPosition;

}
