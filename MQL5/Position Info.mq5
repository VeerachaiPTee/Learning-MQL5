// 19.Position Info
// Veerachai 388
   void OnTick()
     {
   //---
      if(PositionSelect(_Symbol)==true)
      {  
      for(int i =PositionsTotal()-1 ; i>=0;i--)
       {
      ulong positionTicket = PositionGetTicket(i);
      string positionSymbol = PositionGetString(POSITION_SYMBOL);
      double positionPriceOpen = PositionGetDouble(POSITION_PRICE_OPEN);
      double positionPriceCurrent = PositionGetDouble(POSITION_PRICE_CURRENT);
      double positionProfit = PositionGetDouble(POSITION_PROFIT);
      int positionSwap = (int) PositionGetDouble(POSITION_SWAP);
      double positionNetProfit = positionProfit+positionSwap;
  
      if(positionSymbol == _Symbol)
        {
         Comment(
               "Position Number: ",i,"\n",
               "Position ticket: ",positionTicket,"\n",
               "Position Number: ",positionSymbol,"\n",
               "Position Profit: ",positionProfit,"\n",
               "Position swap: ",positionSwap,"\n",
               "Position Net Profit: ",positionNetProfit,"\n",
               "Position Price Open: ",positionPriceOpen,"\n",
               "Position Price current: ",positionPriceCurrent,"\n"
         );
         }
        }
       }
     }
   //+------------------------------------------------------------------+
