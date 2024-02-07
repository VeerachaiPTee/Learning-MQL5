//3. Simple buy stop order
//Veerachai 388
#include <Trade\Trade.mqh>
CTrade trade;
void OnTick()
  {
//---
  //get the ask price
  double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
  //get the account balance
  double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
  //get the account equity
  double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
  //if account balance and equity is equal
  if(Balance == Equity)
    {
     trade.BuyStop(0.10,Ask+100*_Point,_Symbol,0,Ask+300*_Point,ORDER_TIME_GTC,0,0);
    } 
  
  }
//+------------------------------------------------------------------+
