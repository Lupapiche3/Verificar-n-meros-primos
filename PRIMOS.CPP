#include <iostream>
using namespace std;

bool VERIFICAR_SI_NUMERO_ES_PRIMO(int $a0);

int main() { // linea 42
  int $a0; 
  cout << "Introduzca un número(positivo) y diré si es primo: ";
  cin >> $a0;//linea 47
  
  if (VERIFICAR_SI_NUMERO_ES_PRIMO($a0) != 0) { //linea 50 y 57
    cout << "Es primo"; //linea 58, 59, 65
    
  } else { //linea 58
   cout << "No es primo"; //linea 62, 65
  }
}

bool VERIFICAR_SI_NUMERO_ES_PRIMO(int $a0) {
  if ($a0 < 2) return 0; //linea 12
  
  //LOOP_VERIFICAR_SI_NUMERO_ES_PRIMO: linea 19
  for (int $t0 = 2; $t0 < $a0; $t0++) { //linea 21 (22),26
    if ($a0 % $t0 == 0) return 0; //24,25,26
  }
  
  return 1;          //es primo
}
