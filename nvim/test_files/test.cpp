#include <stdio.h>
#include <iostream>
#include <vector>

int add(int a, int b) { return a + b; }

int main() {

  std::vector<int> numbers = {1, 2, 3, 4};

  for (int n : numbers) {
    std::cout << add(n, 10) << std::endl;
  }

  int x = 10;
  int y = 0;

  std::cout << x / y << std::endl;
  printf("hemmp");
  return 0;
}
