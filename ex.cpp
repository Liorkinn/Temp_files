#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

// Функция для удаления пробелов в начале и конце строки
std::string trim(const std::string& str) {
    std::string trimmedStr = str;
    size_t firstNonSpace = trimmedStr.find_first_not_of(' ');
    size_t lastNonSpace = trimmedStr.find_last_not_of(' ');
    if (firstNonSpace != std::string::npos && lastNonSpace != std::string::npos) {
        trimmedStr = trimmedStr.substr(firstNonSpace, lastNonSpace - firstNonSpace + 1);
    }
    else {
        trimmedStr.clear();
    }
    return trimmedStr;
}

int main() {
    std::ifstream file("example.xml");
    std::string line;
    std::stringstream ss;
    
    while (std::getline(file, line)) {
        ss << trim(line);  // Удаляем пробелы в начале и конце строки
    }
    
    std::string xml = ss.str();
    
    // Ищем теги <database>
    size_t start = 0;
    while ((start = xml.find("<database", start)) != std::string::npos) {
        size_t end = xml.find("</database>", start);
        if (end == std::string::npos) {
            break; // Не найден закрывающий тег
        }
        
        std::string database = xml.substr(start, end - start + 11); // Получаем строку с тегом <database> и его содержимым
        
        // Извлекаем атрибуты name, port и driver
        size_t nameStart = database.find("name=\"") + 6;
        size_t nameEnd = database.find("\"", nameStart);
        size_t portStart = database.find("port=\"") + 6;
        size_t portEnd = database.find("\"", portStart);
        size_t driverStart = database.find("driver=\"") + 8;
        size_t driverEnd = database.find("\"", driverStart);
        
        std::string name = database.substr(nameStart, nameEnd - nameStart);
        std::string port = database.substr(portStart, portEnd - portStart);
        std::string driver = database.substr(driverStart, driverEnd - driverStart);
        
        std::cout << "Name: " << name << std::endl;
        std::cout << "Port: " << port << std::endl;
        std::cout << "Driver: " << driver << std::endl;
        
        start = end + 11; // Переходим к следующему тегу <database>
    }
    std::cout << "Driver: " << std::endl;
    return 0;
}
