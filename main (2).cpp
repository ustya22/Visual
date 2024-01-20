/******************************************************************************
Задание №3
Ввести с клавиатуры номер дня недели.
Вывести на экран его название. Использовать перечисления (enum).
*******************************************************************************/
#include <iostream>

// Перечисление для дней недели
enum DayOfWeek {
    MON = 1, TUE, WED, THU, FRI, SAT, SUN
};

int main() {
    int dayNumber;

    // Ввод номера дня недели с клавиатуры
    std::cout << "Введите номер дня недели (1-7): ";
    std::cin >> dayNumber;

    // Проверка на корректность введенного номера
    if (dayNumber >= MON && dayNumber <= SUN) {
        // Преобразование номера в перечисление
        DayOfWeek dayOfWeek = static_cast<DayOfWeek>(dayNumber);

        // Вывод названия дня недели
        switch (dayOfWeek) {
            case MON:
                std::cout << "Понедельник\n";
                break;
            case TUE:
                std::cout << "Вторник\n";
                break;
            case WED:
                std::cout << "Среда\n";
                break;
            case THU:
                std::cout << "Четверг\n";
                break;
            case FRI:
                std::cout << "Пятница\n";
                break;
            case SAT:
                std::cout << "Суббота\n";
                break;
            case SUN:
                std::cout << "Воскресенье\n";
                break;
        }
    } else {
        std::cout << "Некорректный номер дня недели\n";
    }

    return 0;
}
