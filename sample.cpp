#include <iostream>
#include <optional>
#include <string>
#include <experimental/coroutine>
#include <boost/lexical_cast.hpp>

int x = 0;

std::optional<int> foo() {
   return []() {
      return x++;
   }();
}

int main() {
   std::cout << "Hello " << *foo() << "\n";
   std::cerr << "Hello " << *foo() << "\n";
   std::clog << "Hello " << boost::lexical_cast<std::string>(*foo()) << "\n";
}
