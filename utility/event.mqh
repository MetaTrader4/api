// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

// Utility Functions for Event

#include "../API.config.mqh"

bool EventSetTimerAPI( void ) {
    if ( Flag_Event_Timer_Set )
        return true;
    //
    if ( Event_Timer == EVENT_TIMER_SECOND )
        Flag_Event_Timer_Set = EventSetTimer( Event_Timer_Count );
    if ( Event_Timer == EVENT_TIMER_MILLISECOND )
        Flag_Event_Timer_Set = EventSetMillisecondTimer( Event_Timer_Count );

    if ( Flag_Event_Timer_Set )
        Flag_Event_Timer_Kill = false;

    return Flag_Event_Timer_Set;
}

void EventKillTimerAPI( void ) {
    if ( !Flag_Event_Timer_Kill ) {
        EventKillTimer();
        Flag_Event_Timer_Kill = true;
        Flag_Event_Timer_Set = false;
    }
}
