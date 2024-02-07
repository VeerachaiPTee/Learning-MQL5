//9. HOW TO Count Sell Positions
//Veerachai 388
void OnTick()
  {
//---
   Comment("Number of sell Positions: ", countSellPositions());
  }
//+------------------------------------------------------------------+

int countSellPositions() {
   int numberOfSellPositions = 0;
   
   for(int i = PositionsTotal()-1; i>=0; i--)
   {
      string currentcyPair = PositionGetSymbol(i);
      
      // get the position type
      int positionDirection = PositionGetInteger(POSITION_TYPE);
      
      //if symbol on chart equal positionn symbol
      if (positionDirection == POSITION_TYPE_SELL)
      {
         numberOfSellPositions=numberOfSellPositions+1;
      }
   }
   
   //return number of positions to the ain function
   return numberOfSellPositions;
}