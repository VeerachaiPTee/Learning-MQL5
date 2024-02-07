// 17.HOW TO Get The Highest | Lowest of 10 candles
// Veerachai 388

void OnTick()
  {
  
  //High
   double HighestCandle;
   double High[];
   ArraySetAsSeries(High, true);
   CopyHigh(_Symbol,PERIOD_CURRENT,0,11,High);
   HighestCandle = ArrayMaximum(High,0,11);
   
   Comment("Highest candle within the last 10 candles: ", HighestCandle);
   
   //Low
   double LowestCandle;
   double Low[];
   ArraySetAsSeries(Low, true);
   CopyLow(_Symbol,PERIOD_CURRENT,0,11,Low);
   LowestCandle = ArrayMaximum(Low,0,11);
   
   Comment("Lowest candle within the last 10 candles: ", LowestCandle);
}