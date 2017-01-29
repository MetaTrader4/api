// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

public:

//
virtual void OnTimer( void ) {}

//
void fireOnTimer( void ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnTimer();
    }
}
