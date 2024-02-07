//31. RSI+Bolling Bands
// Veerachai 388

void OnTick()
  {
   Comment("");
   double myRSIArr[], LowerBandArr[];
   int rsiDefinition = iRSI(_Symbol,_Period,14,PRICE_CLOSE);
   ArraySetAsSeries(myRSIArr,true);
   CopyBuffer(rsiDefinition,0,0,3,myRSIArr);
   double myRsiVal = NormalizeDouble(myRSIArr[0],2);
   ArraySetAsSeries(LowerBandArr,true);
   
   int bollingerBandsDefinition = iBands(_Symbol,_Period,20,0,2,PRICE_CLOSE);
   CopyBuffer(bollingerBandsDefinition,2,0,3,LowerBandArr);
   double lowerBandVal = LowerBandArr[1];
   double ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   
   if(myRsiVal<30)
   if(ask<lowerBandVal)
   Comment("\n\n\n\n","Oversold And Bellow lower bollinger band");

  }
//+------------------------------------------------------------------+
