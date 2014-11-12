#include <stdio.h>
#include <string.h>
#include <time.h>
#include "cinterf.h"

/* call as: current_datime(-D)
    Returns the predicate datime(D) where D is the current time in ms*/
int current_datime(CTXTdecl)
{
    time_t now;
    time(&now);
   
    prolog_term t = reg_term(CTXTc 1);
    if (is_functor(t))
    {
        char *func = p2c_functor(t);
        if(strcmp(func,"datime")==0)
        {
            c2p_int(CTXTc now, p2p_arg(reg_term(CTXTc 1),1));
            return TRUE;
        }
        return FALSE;
    }
    c2p_functor(CTXTc "datime",1,reg_term(CTXTc 1));
    c2p_int(CTXTc now, p2p_arg(reg_term(CTXTc 1),1));
    return TRUE;
}

/*
 * call as: epoch(+Y,+M,+D,+H,+M,+S,-Sec)
 *  Returns the seconds until the date Y-M-D-H-M-S
 */
int epoch(CTXTdecl)
{
    int time_sec;
    struct tm time;
    time.tm_year = p2c_int(reg_term(CTXTc 1)) - 1900;
    time.tm_mon = p2c_int(reg_term(CTXTc 2)) - 1 ;
    time.tm_mday = p2c_int(reg_term(CTXTc 3));
    time.tm_hour = p2c_int(reg_term(CTXTc 4));
    time.tm_min = p2c_int(reg_term(CTXTc 5));
    time.tm_sec = p2c_int(reg_term(CTXTc 6));
    time.tm_isdst = -1;

    time_sec = mktime(&time);
    c2p_int(CTXTc time_sec, reg_term(CTXTc 7));
    return TRUE;
}
int epoch2date(CTXTdecl)
{
    time_t epoch = p2c_int(reg_term(CTXTc 7));
    struct tm date = *localtime(&epoch);
    c2p_int(CTXTc 1900 + date.tm_year, reg_term(CTXTc 1));
    c2p_int(CTXTc 1 + date.tm_mon, reg_term(CTXTc 2));
    c2p_int(CTXTc date.tm_mday, reg_term(CTXTc 3));
    c2p_int(CTXTc date.tm_hour, reg_term(CTXTc 4));
    c2p_int(CTXTc date.tm_min, reg_term(CTXTc 5));
    c2p_int(CTXTc date.tm_sec, reg_term(CTXTc 6));
    return TRUE;
}
/*
 * call as: is_datime(+T)
 *  Returns true if T is a datime (with or without counter)
 */
int is_datime(CTXTdecl)
{
    prolog_term t = reg_term(CTXTc 1);
    if(is_functor(t))
    {
        char *func = p2c_functor(t);
        if(strcmp(func,"datime")==0)
            return TRUE;
    }
    return FALSE;
}
/*
 * Auxiliary function for less_datime
 *  Compares if one date is older than the other
 */
int aux_less_datime(int t1_ts, int t2_ts, int t1_coun, int t2_coun)
{
    if (t1_ts < t2_ts)
        return TRUE;
    else if(t1_ts == t2_ts && t1_coun < t2_coun)
        return TRUE;
    else
        return FALSE;
}
/*
 * call as: less_datime(T1,T2)
 *  Return true if T1 is an older date than T2
 */
int less_datime(CTXTdecl)
{
    prolog_term t1 = reg_term(CTXTc 1);
    prolog_term t2 = reg_term(CTXTc 2);
    if (!is_functor(t1) || !is_functor(t2))
    {
        return FALSE;
    }
    int t1_arity = p2c_arity(t1);
    int t2_arity = p2c_arity(t2);
    int t1_ts = p2c_int(p2p_arg(t1,1));
    int t2_ts = p2c_int(p2p_arg(t2,1));
    int t1_coun = 0;
    int t2_coun = 0;

    if ( t1_arity > 1 && t2_arity > 1 )
    {
        t1_coun = p2c_int(p2p_arg(t1,2));
        t2_coun = p2c_int(p2p_arg(t2,2));
    }   
    return aux_less_datime(t1_ts,t2_ts,t1_coun,t2_coun);
}
/*
 * call as: between_datime(+T1,+T2,+T3)
 *  Checks if T1 is between T2 and T3
 */
int between_datime(CTXTdecl)
{
    prolog_term t1 = reg_term(CTXTc 1);
    prolog_term t2 = reg_term(CTXTc 2);
    prolog_term t3 = reg_term(CTXTc 3);

    if (!is_functor(t1) && !is_functor(t2) && !is_functor(t3))
        return FALSE;

    int t1_arity = p2c_arity(t1);
    int t2_arity = p2c_arity(t2);
    int t3_arity = p2c_arity(t3);
    int t1_ts = p2c_int(p2p_arg(t1,1));
    int t2_ts = p2c_int(p2p_arg(t2,1));
    int t3_ts = p2c_int(p2p_arg(t3,1));
    int t1_coun = 0;
    int t2_coun = 0;
    int t3_coun = 0;

    if ( t1_arity > 1 && t2_arity > 1 && t3_arity > 1 )
    {
        t1_coun = p2c_int(p2p_arg(t1,2));
        t2_coun = p2c_int(p2p_arg(t2,2));
        t3_coun = p2c_int(p2p_arg(t3,2));
    }   
    return aux_less_datime(t2_ts,t1_ts,t2_coun,t1_coun) && 
        aux_less_datime(t1_ts,t3_ts,t1_coun,t3_coun);
}
/*
 * call as: equal_datime(T1,T2)
 *  Checks if T1 and T2 are the same date
 */
int equal_datime(CTXTdecl)
{
    prolog_term t1 = reg_term(CTXTc 1);
    prolog_term t2 = reg_term(CTXTc 2);

    if(!is_functor(t1) && !is_functor(t2))
        return FALSE;
    
    int t1_ts = p2c_int(p2p_arg(t1,1));
    int t2_ts = p2c_int(p2p_arg(t2,1));

    if (t1_ts==t2_ts)
        return TRUE;
    else
        return FALSE;
}
/*
 * call as: datime_plus_sec(T1,Sec,T2)
 *  Returns T2 as the result of date T1 plus Sec seconds
 */
int datime_plus_sec(CTXTdecl)
{
    prolog_term t1 = reg_term(CTXTc 1);
    if(!is_functor(t1))
        return FALSE;

    int t1_ts = p2c_int(p2p_arg(t1,1));
    int sec = p2c_int(reg_term(CTXTc 2));
    if (p2c_arity(t1) > 1)
    {
        int counter = p2p_arg(t1,2);
        c2p_functor(CTXTc "datime",2,reg_term(CTXTc 3));
        c2p_int(CTXTc t1_ts+sec,p2p_arg(reg_term(CTXTc 3),1));
        c2p_int(CTXTc counter,p2p_arg(reg_term(CTXTc 3),2));
    }
    else
    {
        c2p_functor(CTXTc "datime",1,reg_term(CTXTc 3));
        c2p_int(CTXTc t1_ts+sec,p2p_arg(reg_term(CTXTc 3),1));
    }
    return TRUE;
}
/*
 * call as: datime_minus_sec(T1,Sec,T2)
 *  Returns T2 as the result of the date T1 minus Sec seconds
 */
int datime_minus_sec(CTXTdecl)
{
    prolog_term t1 = reg_term(CTXTc 1);

    if(!is_functor(t1))
        return FALSE;

    int t1_ts = p2c_int(p2p_arg(t1,1));
    int sec = p2c_int(reg_term(CTXTc 2));
    if (p2c_arity(t1) > 1)
    {
        int counter = p2p_arg(t1,2);
        c2p_functor(CTXTc "datime",2,reg_term(CTXTc 3));
        c2p_int(CTXTc t1_ts-sec,p2p_arg(reg_term(CTXTc 3),1));
        c2p_int(CTXTc counter,p2p_arg(reg_term(CTXTc 3),2));
    }
    else
    {
        c2p_functor(CTXTc "datime",1,reg_term(CTXTc 3));
        c2p_int(CTXTc t1_ts-sec,p2p_arg(reg_term(CTXTc 3),1));
    }
    return TRUE;
}
/*
 * call as: datime_minus_datime(T1,T2,Sec)
 * Returns Sec as the diff in seconds between T1 and T2
 */
int datime_minus_datime(CTXTdecl)
{
    prolog_term t1 = reg_term(CTXTc 1);
    prolog_term t2 = reg_term(CTXTc 2);

    if(!is_functor(t1) && !is_functor(t2))
        return FALSE;
    
    int t1_ts = p2c_int(p2p_arg(t1,1));
    int t2_ts = p2c_int(p2p_arg(t2,1));
    int diff = 0;
    
    if(t1_ts < t2_ts)
        diff = t2_ts - t1_ts;
    else
        diff = t1_ts - t2_ts;

    c2p_int(CTXTc diff,reg_term(CTXTc 3));
    return TRUE;
}
/*
 * call as: next_valid_timestamp(Ts1,Ts2,Interval,NTs)
 * Returns NTs as the next valid timestamp after Ts2 taking into account the
 * interval. This is useful for the periodics events  
 */
int next_valid_timestamp(CTXTdecl)
{
    int ts = p2c_int(reg_term(CTXTc 1));
    int interval = p2c_int(reg_term(CTXTc 3));
    int ts_now = p2c_int(reg_term(CTXTc 2));
    int next_ts = 0;

    if (ts_now <= ts)
    {    
        next_ts = ts + interval;
        c2p_int(CTXTc next_ts, reg_term(CTXTc 4));
        return TRUE;
    }

    int diff = (ts_now - ts);
    int left_time = diff % interval;
    next_ts = ts_now + (interval - left_time);
    c2p_int(CTXTc next_ts, reg_term(CTXTc 4));

    return TRUE;
}
