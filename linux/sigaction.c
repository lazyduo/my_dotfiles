#include <stdio.h>
#include <unistd.h>
#include <signal.h>

// signal block test
void sigint_handler( int signum)
{
   printf( "You pressed Ctrl + C.\n");
   printf( "Hold 3 seconds, try Ctrl + Z\n");

   for (int i = 3; 0 < i; i--){
      printf( "%d second left.\n", i);
      sleep(1);
   }
}

int main( void)
{
   struct sigaction act;

   act.sa_handler = sigint_handler;  // register signal handler

    /**
     * to use sa_sigaction (sa_sigaction is extension of sa_handler)
     * 
     * act.sa_sigaction = sigint_handler; 
     * act.sa_flags = SA_SIGINFO;
     */

   sigemptyset(&act.sa_mask);        // empty signal mask set
   sigfillset(&act.sa_mask);        // fill all signals of set to block all signals

   sigaction(SIGINT, &act, NULL); // SIGINT : Ctrl + C

   while(1) {
      printf( "lazyduo\n");
      sleep(1);
   }
}

/**
 * 
 * Compile: gcc -o demo sigaction.c
 * 
 * OUTPUT :
 * siginit_handler가 동작하는 동안에는 Ctrl + Z 가 먹히지 않고,
 * pending으로 기다리다가 시그널이 끝난 뒤에 Ctrl + Z가 입력되면서 프로그램이 종료 된다.
 * 
 */