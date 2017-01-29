// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

#include "inc\OnInit.mqh"
#include "inc\OnDeinit.mqh"
#include "inc\OnChartEvent.mqh"

public:

// =====================================
// Events
// =====================================

//
virtual void OnStart( void ) {}


// =====================================
// Triggers
// =====================================

//
void fireOnStart( void ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnStart();
    }
}
