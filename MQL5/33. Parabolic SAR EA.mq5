//33. Parabolic SAR EA
//Veerachai 388
void OnTick()
  {
   double sarArr[];
   
   int sarDefinition = iSAR(_Symbol,_Period,0.02,0.2);
   ArraySetAsSeries(sarArr,true);
   CopyBuffer(sarDefinition,0,0,3,sarArr);
   
   double sarVal = NormalizeDouble(sarArr[0],5);
   Comment("Sar val: ",sarVal);
   
  }
//+------------------------------------------------------------------+
