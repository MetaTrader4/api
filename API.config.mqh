// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

// Configuration for API
// Can be override in App constructor method.

// =====================================
// Event
// =====================================

enum ENUM_EVENT_TIMER {
    EVENT_TIMER_SECOND,
    EVENT_TIMER_MILLISECOND,
};

// Can be set to EMPTY to disable, Set to one of the ENUM_EVENT_TIMER to activate
ENUM_EVENT_TIMER Event_Timer = EMPTY;
int Event_Timer_Count = 100;
bool Flag_Event_Timer_Set = false;
bool Flag_Event_Timer_Kill = false;
