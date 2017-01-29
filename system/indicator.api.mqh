// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

#include "inc\OnInit.mqh"
#include "inc\OnDeinit.mqh"
#include "inc\OnChartEvent.mqh"
#include "inc\OnTimer.mqh"

public:

// =====================================
// Events
// =====================================

//
virtual void OnCalculate( const int rates_total,      // size of input time series 
                         const int prev_calculated,  // bars handled in previous call 
                         const datetime &time[],     // Time 
                         const double &open[],       // Open 
                         const double &high[],       // High 
                         const double &low[],        // Low 
                         const double &close[],      // Close 
                         const long &tick_volume[],  // Tick Volume 
                         const long &volume[],       // Real Volume 
                         const int &spread[],        // Spread 
                         int &ret
                       ) {}

// =====================================
// Triggers
// =====================================

//
void fireOnCalculate( const int rates_total,      // size of input time series 
                      const int prev_calculated,  // bars handled in previous call 
                      const datetime &time[],     // Time 
                      const double &open[],       // Open 
                      const double &high[],       // High 
                      const double &low[],        // Low 
                      const double &close[],      // Close 
                      const long &tick_volume[],  // Tick Volume 
                      const long &volume[],       // Real Volume 
                      const int &spread[],         // Spread
                      int &ret
                   ) {
    //int ret = rates_total;
    //
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnCalculate( rates_total, prev_calculated, time, open, high, low, close, tick_volume, volume, spread, ret );
    }
    //
    //return ret;
}
