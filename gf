#pragma region VEXcode Generated Robot Configuration
// Make sure all required headers are included.
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <string.h>


#include "vex.h"

using namespace vex;

// Brain should be defined by default
brain Brain;


// START V5 MACROS
#define waitUntil(condition)                                                   \
  do {                                                                         \
    wait(5, msec);                                                             \
  } while (!(condition))

#define repeat(iterations)                                                     \
  for (int iterator = 0; iterator < iterations; iterator++)
// END V5 MACROS


// Robot configuration code.
motor Motor1 = motor(PORT1, ratio18_1, false);

motor Motor2 = motor(PORT2, ratio18_1, false);

motor SupplyMotor = motor(PORT3, ratio18_1, false);



// generating and setting random seed
void initializeRandomSeed(){
  int systemTime = Brain.Timer.systemHighResolution();
  double batteryCurrent = Brain.Battery.current();
  double batteryVoltage = Brain.Battery.voltage(voltageUnits::mV);

  // Combine these values into a single integer
  int seed = int(batteryVoltage + batteryCurrent * 100) + systemTime;

  // Set the seed
  srand(seed);
}



void vexcodeInit() {

  //Initializing random seed.
  initializeRandomSeed();
}


// Helper to make playing sounds from the V5 in VEXcode easier and
// keeps the code cleaner by making it clear what is happening.
void playVexcodeSound(const char *soundName) {
  printf("VEXPlaySound:%s\n", soundName);
  wait(5, msec);
}

#pragma endregion VEXcode Generated Robot Configuration

/*----------------------------------------------------------------------------*/
/*                                                                            */
/*    Module:       main.cpp                                                  */
/*    Author:       Levi, Ethan, Jackson                                      */
/*    Created:      3/6/2026                                                  */
/*    Description:  M5 SHERMAN                                                */
/*                                                                            */
/*----------------------------------------------------------------------------*/

// Include the V5 Library
#include "vex.h"
 
// Allows for easier use of the VEX Library
using namespace vex;

void dropcargo() {
  wait(0.05, seconds);

  SupplyMotor.setVelocity(25, percent);

  //Cargo Gate Logic
  SupplyMotor.spin(forward);

  wait(3, seconds);

  SupplyMotor.stop();

  wait(3, seconds);

  SupplyMotor.spin(reverse);

  wait(3, seconds);

  SupplyMotor.stop();

}

int main() {
      vexcodeInit();

      wait(3, seconds);

      Motor1.setVelocity(50, percent);
      Motor2.setVelocity(50, percent);

      // Drive Logic
      Motor1.spin(forward);
      Motor2.spin(forward);

      wait(3, seconds);

      Motor1.stop();
      Motor2.stop();

      dropcargo();

      //Go Back!
      wait(3, seconds);

      Motor1.spin(forward);
      Motor2.spin(forward);

      Motor1.stop();
      Motor2.stop();

      return 0;
    }
    //Totally Normal Coding Stuff Happening Below!                                                                      
                                       /*              _..----.._                                  
                                                    ]_.--._____[                                  
                                                  ___|'--'__..|--._                              
                              __               """    ;            :                              
                            ()_ """"---...__.'""!":  /    ___       :                            
                               """---...__\]..__] | /    [ 0 ]      :                            
                                          """!--./ /      """        :                            
                                   __  ...._____;""'.__________..--..:_                          
                                  /  !"''''''!''''''''''|''''/' ' ' ' \"--..__  __..              
                                 /  /.--.    |          |  .'          \' ' '.""--.{'.            
             _...__            >=7 //.-.:    |          |.'             \ ._.__  ' '""'.          
          .-' /    """"----..../ "">==7-.....:______    |                \| |  "";.;-"> \        
          """";           __.."   .--"/"""""----...."""""----.....H_______\_!....'----""""]      
        _..---|._ __..--""       _!.-=_.            """""""""""""""                   ;"""        
       /   .-";-.'--...___     ." .-""; ';""-""-...^..__...-v.^___,  ,__v.__..--^"--""-v.^v,      
      ;   ;   |'.         """-/ ./;  ;   ;\P.        ;   ;        """"____;  ;.--""""// '""<,    
      ;   ;   | 1            ;  ;  '.: .'  ;<   ___.-'._.'------""""""____'..'.--""";;'  o ';    
      '.   \__:/__           ;  ;--""()_   ;'  /___ .-" ____---""""""" __.._ __._   '>.,  ,/;    
        \   \    /"""<--...__;  '_.-'/; ""; ;.'.'  "-..'    "-.      /"/    `__. '.   "---";      
         '.  'v ; ;     ;;    \  \ .'  \ ; ////    _.-" "-._   ;    : ;   .-'__ '. ;   .^".'      
           '.  '; '.   .'/     '. `-.__.' /;;;   .o__.---.__o. ;    : ;   '"";;""' ;v^" .^        
             '-. '-.___.'<__v.^,v'.  '-.-' ;|:   '    :      ` ;v^v^'.'.    .;'.__/_..-'          
                '-...__.___...---""'-.   '-'.;\     'WW\     .'_____..>."^"-""""""""    fsc      
                                      '--..__ '"._..'  '"-;;"""                                  
                                             """---'""""""                    */                    
 

