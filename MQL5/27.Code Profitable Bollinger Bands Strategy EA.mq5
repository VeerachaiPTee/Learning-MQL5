//27.Code Profitable Bollinger Bands Strategy EA
//Veerachai 388
#include <Trade\Trade.mqh>
CTrade trade;
bool newBar;
datetime lastBarTime;
MqlRates bar[];
void OnTick()
  {
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   CopyRates(_Symbol,PERIOD_CURRENT,0,5,bar);
   if(bar[0].time > lastBarTime)
     {
      newBar = true;
      lastBarTime = bar[0].time;
     } else {
      newBar = false;
     }
    if(newBar == true)
      {
       Alert("New Bar: ", lastBarTime);
      }
   MqlRates PriceInfo[];
   ArraySetAsSeries(PriceInfo,true);
   int Data = CopyRates(Symbol(),Period(),0,3,PriceInfo);
   string signal = "";
   double MiddleBandArr[];
   double UpperBandArr [];
   double LowerBandArr [];
   int BollingBandDefinition = iBands(_Symbol,_Period,20,0,2,PRICE_CLOSE);
   CopyBuffer(BollingBandDefinition,0,0,3,MiddleBandArr);
   CopyBuffer(BollingBandDefinition,1,0,3,UpperBandArr);
   CopyBuffer(BollingBandDefinition,2,0,3,LowerBandArr);
   double midval0 = MiddleBandArr[0];
   double upval0 = UpperBandArr[0];
   double lowval0 = LowerBandArr[0];
   double midval1 = MiddleBandArr[1];
   double upval1 = UpperBandArr[1];
   double lowval1 = LowerBandArr[1];
   if((PriceInfo[1].close < lowval1) && (PriceInfo[0].close < lowval0) && newBar == true)
   {
   trade.Buy(0.1,NULL,Ask,0,Ask+300*_Point,NULL);
   signal = "buy";
   }
   
   if((PriceInfo[1].close > upval1) && (PriceInfo[0].close < upval0) && newBar == true)
   {
    trade.Sell(0.1,NULL,Bid,0,Bid+300*_Point,NULL);
   signal = "sell";
   }
  }
//+------------------------------------------------------------------+
