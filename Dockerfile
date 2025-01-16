FROM openjdk:23-jdk-slim
WORKDIR /app

# Копируем jar-файл приложения
COPY target/myapp-0.0.1-SNAPSHOT.jar /app/myapp.jar

# Копируем статические ресурсы
COPY src/main/resources/static /app/static

# Указываем переменные окружения для конфигурации
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://db:5432/docker \
    SPRING_DATASOURCE_USERNAME=postgres \
    SPRING_DATASOURCE_PASSWORD=123 \
    SPRING_JPA_HIBERNATE_DDL_AUTO=update

# Точка входа
ENTRYPOINT ["java", "-jar", "/app/myapp.jar"]

# Открываем порт приложения
EXPOSE 9999
