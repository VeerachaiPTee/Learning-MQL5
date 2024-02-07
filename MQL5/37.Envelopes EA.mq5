//37. Envelopes EA
//Veerachai 388

void OnTick()
  {
   MqlRates priceInfomation[];
   ArraySetAsSeries(priceInfomation,true);
   int Data = CopyRates(Symbol(),Period(),0,Bars(Symbol(),Period()),priceInfomation);
   
   double upperBandArr[];
   double lowerBandArr[];
   ArraySetAsSeries(upperBandArr,true);
   ArraySetAsSeries(lowerBandArr,true);
   
   int envDefinition = iEnvelopes(_Symbol,_Period,14,0,MODE_SMA,PRICE_CLOSE,0.100);
   
   CopyBuffer(envDefinition,0,0,3,upperBandArr);
   CopyBuffer(envDefinition,1,0,3,lowerBandArr);
   double upperBandval = NormalizeDouble(upperBandArr[0],6);
   double lowerBandval = NormalizeDouble(lowerBandArr[0],6);
   
   if(priceInfomation[0].close > upperBandval) Comment("Upper signal");
   if(priceInfomation[1].close < lowerBandval) Comment("Lower signal");
   
   Comment(
   "myUpperbandVal: ", upperBandval,"\n",
   "mylowerbandVal: ", lowerBandval
   );
}
//+------------------------------------------------------------------+
