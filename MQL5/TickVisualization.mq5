#include  <arrays/arrayobj.mqh>
#include  <chartobjects/chartobjectstxtcontrols.mqh>
#include  <chartobjects/chartobjectsshapes.mqh>

class CZone : public CObject {
public:
   double high;
   double low;
   int ticks;
   
   virtual int Compare(const CObject *node, const int mode = 0) const {
   const CZone* other = (CZone*)node;
      return other.ticks - ticks;
   }
};

input ENUM_TIMEFRAMES Timeframe = PERIOD_H1;
input int Candles = 100;

int barsTotal;

CArrayObj chartObjects;
int OnInit()
  {
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {
   if(reason == REASON_REMOVE || reason == REASON_PARAMETERS) {
   
   ObjectsDeleteAll(0);
   barsTotal =0;
   }
  }

void OnTick()
  {
   int bars = iBars(_Symbol,Timeframe);
   if(barsTotal != bars) 
     {
      barsTotal = bars;
      
      datetime timeEnd = iTime(_Symbol,PERIOD_D1,0);
      datetime timeStart = timeEnd - PeriodSeconds(Timeframe)*Candles;
      
      MqlTick ticks[];
      CopyTicksRange(_Symbol, ticks, COPY_TICKS_ALL,timeStart*1000,timeEnd*1000);
      
      double highs[];
      CopyHigh(_Symbol,Timeframe,timeStart,timeEnd,highs);
      double high = highs[ArrayMaximum(highs)];
      
      double lows[];
      CopyLow(_Symbol,Timeframe,timeStart,timeEnd,lows);
      double low = lows[ArrayMinimum(lows)];
      
      double size = high-low;
      
      CArrayObj zones;
      
      int count = 10;
      for(int i=0;i<count;i++)
        {
            double h = high - size * i / count;
            double l = high - size * (i+1) / count;
            
            CZone* zone = new CZone();
            zone.high = h;
            zone.low = l;
            zones.Add(zone);
        }
        
        for(int i=0;i<ArraySize(ticks);i++)
          {
           for(int j=0;j <zones.Total();j++)
             {
              CZone* zone = zones.At(j);
              
              if(ticks[i].bid >= zone.low && ticks[i].bid <= zone.high)
                  {
                     zone.ticks++;
                     break;
                     
                  }   
             }
          }
          
        zones.Sort();
        chartObjects.Clear();
        for(int i=0;i<zones.Total();i++)
          {
           CZone* zone = zones.At(i);
           
           string objName = "ZONE "+IntegerToString(i);
           
           CChartObjectRectangle* rect = new CChartObjectRectangle();
           rect.Create(0, objName,0, timeStart, zone.high, timeEnd,zone.low);
           rect.Fill(true);
           
           CChartObjectLabel* label = new CChartObjectLabel();
           label.Create(0, objName+" Label",0,timeStart,zone.high);
           label.Color(clrYellow);
           label.Description(DoubleToString((double)zone.ticks/ArraySize(ticks)*100,2)+"%");
           
           if(zone.ticks > ArraySize(ticks) *0.15)
             {
              rect.Color(clrOrangeRed);
             }else if(zone.ticks > ArraySize(ticks) * 0.10)
                     {
                      rect.Color(clrTomato);
                     } else if(zone.ticks > ArraySize(ticks)* 0.5)
                              {
                               rect.Color(clrSandyBrown);
                              } else {
                                 rect.Color(clrLightGray);
                              }
           
           chartObjects.Add(rect);
           chartObjects.Add(label);
           ChartRedraw();
          }
     }
  }

