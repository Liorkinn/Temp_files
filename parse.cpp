#include <iostream>
#include <fstream>
#include <string>

// Функция для извлечения значения атрибута из строки
std::string getAttributeValue(const std::string& line, const std::string& attributeName) {
    size_t namePos = line.find(attributeName + "=\"");
    if (namePos != std::string::npos) {
        size_t startPos = namePos + attributeName.length() + 2;
        size_t endPos = line.find("\"", startPos);
        if (endPos != std::string::npos) {
            return line.substr(startPos, endPos - startPos);
        }
    }
    return "";
}

int main() {
    std::ifstream file("file.xml"); // Замените "file.xml" на путь к вашему XML файлу

    std::string line;
    while (std::getline(file, line)) {
        if (line.find("database") != std::string::npos && line.find("name=\"Finish2\"") != std::string::npos) {
            std::string hostname = getAttributeValue(line, "hostname");
            std::string port = getAttributeValue(line, "port");
            std::cout << "Hostname: " << hostname << std::endl;
            std::cout << "Port: " << port << std::endl;
            break;
        }
    }

    file.close();
    return 0;
}
