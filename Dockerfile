# Example for Java Spring Boot application
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built JAR file (adjust path as needed)
COPY target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
