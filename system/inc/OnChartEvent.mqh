// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

public:

//
virtual void OnChartEvent( const int id,          // Event ID 
                           const long &lparam,    // Parameter of type long event 
                           const double &dparam,  // Parameter of type double event
                           const string &sparam   // Parameter of type string events
                         ) {}

//
void fireOnChartEvent( const int id,          // Event ID 
                       const long &lparam,    // Parameter of type long event 
                       const double &dparam,  // Parameter of type double event
                       const string &sparam   // Parameter of type string events
                     ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnChartEvent( id, lparam, dparam, sparam );
    }
}
