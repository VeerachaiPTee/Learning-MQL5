// MQL Tutorial 1 : How to Open Simple Buy Order
// Veerachai 388

#include<Trade\Trade.mqh>
CTrade trade;

void OnTick()
  {
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Balance = AccountInfoDouble(ACCOUNT_BALANCE); 
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   if(Equity >= Balance)
     {
      trade.Buy(0.01,NULL,Ask,0,(Ask + 100* _Point), NULL);
     }
   
  }
//+------------------------------------------------------------------+
