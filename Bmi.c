#include <stdio.h>
#include <stdlib.h>

#include "Bmi.h"

static const int MULTIPLIER = 703;
static const double BMI_UNDERWEIGHT = 18.5;
static const double BMI_NORMALWEIGHT = 24.9;
static const double BMI_OVERWEIGHT = 29.9;

// Returns one string from stdin up to ARG_MAX length.
double ParseDouble() {
   double dbl;

   scanf("%lf", &dbl);

   return dbl;
}

// Computes the BMI from |lbs| and |in|.
double Bmi(double ins, double lbs) {
   return lbs * MULTIPLIER / (ins * ins);
}

// Prints the results of |bmi|.
void PrintOutput(double bmi) {
   printf("Your BMI is: %.1f\n", bmi);

   if (bmi < BMI_UNDERWEIGHT) {
      printf("You are underweight. (<%.1f)\n", BMI_UNDERWEIGHT);
   }
   else if (bmi < BMI_NORMALWEIGHT) {
      printf("You are normal weight. (%.1f-%.1f)\n", BMI_UNDERWEIGHT,
       BMI_NORMALWEIGHT);
   }
   else if (bmi < BMI_OVERWEIGHT) {
      printf("You are overweight. (%.1f-%.1f)\n", BMI_NORMALWEIGHT,
       BMI_OVERWEIGHT);
   }
   else {
      printf("You are obese. (>%.1f)\n", BMI_OVERWEIGHT);
   }
}

int main(int argc, char **argv) {
   PrintOutput(Bmi(ParseDouble(), ParseDouble()));

   return EXIT_SUCCESS;
}
