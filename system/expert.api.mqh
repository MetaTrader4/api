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
virtual void OnTick( void ) {}
//
virtual void OnTester( double &ret ) {}

// =====================================
// Triggers
// =====================================

//
void fireOnTick( void ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnTick();
    }
}

//
void fireOnTester( double &ret ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnTester( ret );
    }
}
