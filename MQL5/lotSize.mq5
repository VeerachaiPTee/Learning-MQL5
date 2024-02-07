#include <Trade/Trade.mqh>
int OnInit()
  {
  calcLots(1.00, 0.05);
  
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {

  }

void OnTick()
  {

  }
 
double calcLots(double riskPercent, double slDistance){ 
   double ticksize = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE);
   double tickvalue = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);
   double lotstep = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
   
   if(ticksize == 0 || tickvalue == 0 || lotstep == 0){ 
        Print(__FUNCTION__," > Lotsize cannot be caiculated...");
        return 0;  
   }
   
   double riskMoney = AccountInfoDouble(ACCOUNT_BALANCE) * riskPercent /100;
   double moneyLotStep = (slDistance / ticksize) * tickvalue * lotstep;
   double balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   if(moneyLotStep == 0) {
   Print(__FUNCTION__," > Lotsize cannot be calculated");
   return 0;
   }
   
   double lots = riskMoney / moneyLotStep * lotstep;
   
   Print("Tee 388 /","Account Balance = ", balance,"/","Risk money = ",riskMoney,"/","Lotsize = ",lots);
   

return 1.0;
}

