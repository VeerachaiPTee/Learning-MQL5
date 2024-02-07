//32. Momentum EA
//Veerachai 388
void OnTick()
  {
   double myPriceArr[];
   int iMomentumDefinition = iMomentum(_Symbol,_Period,14,PRICE_CLOSE);
   ArraySetAsSeries(myPriceArr,true);
   CopyBuffer(iMomentumDefinition,0,0,3,myPriceArr);
   
   double myMomentumVal = NormalizeDouble(myPriceArr[0],2);
   if(myMomentumVal>100.0)Comment("Strong momentum : ", myMomentumVal);
   if(myMomentumVal<99.9)Comment("Week momentum : ", myMomentumVal);
   
   if((myMomentumVal > 99.9) && (myMomentumVal < 100))
   Comment(" ", myMomentumVal);
  }
//+------------------------------------------------------------------+
