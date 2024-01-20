/******************************************************************************
Задание №1
Используя tupydef, опредилить новые имена для всех стандартных типов.
Объявить несколько переменных новых типов данных,
задать им значения, вывести на экран. 
*******************************************************************************/

#include <iostream>

// Определение новых имен для стандартных типов данных с использованием typedef
typedef unsigned int UN_INT;
typedef unsigned char UN_CHAR;

int main() {
    // Объявление переменных новых типов данных
    UN_INT a = 52;
    UN_CHAR b = 'A';

    // Вывод значений переменных на экран
    std::cout << "Мой целочисленный тип (UN_INT): " << a << std::endl;
    std::cout << "Мой символьный тип(UN_CHAR): " << b << std::endl;

    return 0;
}
