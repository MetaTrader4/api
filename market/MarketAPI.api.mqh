// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

public:

// =====================================
// Events
// =====================================

// From MarketAPI
virtual void OnNewTick( const string symbol, const MqlTick &tick, const bool init ) {}


// =====================================
// Triggers
// =====================================

//
void fireOnNewTick( const string symbol, const MqlTick &tick, const bool init = false ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnNewTick( symbol, tick, init );
    }
}
