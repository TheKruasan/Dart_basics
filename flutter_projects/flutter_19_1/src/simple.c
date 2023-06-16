#include <time.h>
#include <stdlib.h>
#include <string.h>

int get_value_s (char* a){
    return strlen(a);
}

int get_value( )
{
    srand(time(NULL));
    int r = rand() % 500; 
    return r;
}
