/******************************************************************************
Задание №2
С клавиатуры ввести строку, состоящю из нескольких слов, разделенных одним пробелом.
Для хранения строки исползовать новый тип данных TEXT,
введенный с помощью typedef. Написать функцию подсчета количества слов в строке.
*******************************************************************************/
#include <iostream>

// Определение нового типа данных TEXT
typedef char TEXT[100]; // Например, предполагаем максимальную длину строки в 100 символов

// Функция для подсчета количества слов в строке
int countWords(const TEXT& inputString) {
    int wordCount = 0;
    TEXT word;
    int length = 0;

    // Находим длину строки
    while (inputString[length] != '\0' && length < sizeof(inputString)) {
        length++;
    }

    // Проходим по символам строки
    for (int i = 0; i < length; ++i) {
        // Если текущий символ - пробел, увеличиваем счетчик слов
        if (inputString[i] == ' ' || inputString[i] == '\t' || inputString[i] == '\n') {
            wordCount++;
        }
    }

    // Если строка не заканчивается пробелом, увеличиваем счетчик еще раз
    if (length > 0 && inputString[length - 1] != ' ' && inputString[length - 1] != '\t' && inputString[length - 1] != '\n') {
        wordCount++;
    }

    return wordCount;
}

int main() {
    std::cout << "Введите строку из нескольких слов, разделенных пробелами (макс. 100 символов): ";
    
    // Считываем строку с клавиатуры
    TEXT enteredString;
    std::cin.getline(enteredString, sizeof(enteredString));

    // Вызываем функцию для подсчета слов и выводим результат
    int wordCount = countWords(enteredString);
    std::cout << "Количество слов в строке: " << wordCount << std::endl;

    return 0;
}
