# Enotes
Got it, here's the README with the removed sections:

---

# Enotes

This is a Maven-based project that demonstrates a simple Notes Management application using Spring MVC and Hibernate. The application allows users to create, read, update, and delete (CRUD) notes. It also includes features such as keyword search, speech-to-text input for notes, unique email validation for users, and an authentication handler to restrict access to registered users only.

## Features

- **Create Note**: Add new notes with a title and content.
- **Read Notes**: View a list of all notes with details.
- **Update Note**: Edit existing notes.
- **Delete Note**: Remove notes from the database.
- **Keyword Search**: Search notes by keywords.
- **Speech-to-Text Input**: Enter notes using speech input.
- **Unique Email Validation**: Validate user emails to ensure uniqueness.
- **Authentication Handler**: Restrict access to registered users only.

## Technologies Used

- **Spring MVC**: For creating the web application using the MVC design pattern.
- **Hibernate ORM**: For mapping Java objects to database tables and vice versa.
- **Maven**: For project management and build automation.
- **JSP**: For rendering the view layer.
- **MySQL**: As the relational database management system (you can use any other database by changing the configuration).

## Project Structure

- **src/main/java**: Contains the Java source code
  - **controller**: Spring MVC controllers for handling web requests
  - **model**: Entity classes mapped to database tables using Hibernate
  - **dao**: Data Access Object classes for database operations
- **src/main/resources/spring-servlet.xml**: Spring configuration file for servlet and other beans.
- **src/main/webapp**: Web resources including JSP files and static content

## Getting Started

### Prerequisites

- JDK 8 or higher
- Apache Maven
- MySQL database (or any other database of your choice)

### Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/schandanrajput/Enotes.git
   cd Enotes
   ```

2. **Create the database**:
   Log in to your MySQL database and run the following command to create the database named "Enotes":
   ```sql
   CREATE DATABASE Enotes;
   ```

3. **Configure the database**:
   Update the `src/main/resources/spring-servlet.xml` file with your database connection details:
   ```xml
   <!-- Example for MySQL -->
   <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
       <property name="driverClassName" value="com.mysql.cj.jdbc.Driver" />
       <property name="url" value="jdbc:mysql://localhost:3306/Enotes" />
       <property name="username" value="yourusername" />
       <property name="password" value="yourpassword" />
   </bean>
   ```

4. **Build the project**:
   ```bash
   mvn clean install
   ```

5. **Run the application**:
   Deploy the WAR file generated in the `target` directory to your servlet container (e.g., Apache Tomcat) and access the application.

6. **Access the application**:
   Open your web browser and navigate to `http://localhost:8080/Enotes`

## Usage

- **Home Page**: Displays a list of all notes with options to add, edit, or delete notes.
- **Add Note**: Click the "Add Note" button to create a new note.
- **Edit Note**: Click the "Edit" button next to a note to modify its content.
- **Delete Note**: Click the "Delete" button next to a note to remove it.
- **Search Notes**: Use the search bar to search notes by keywords.
- **Speech-to-Text Input**: Click the "Speech Input" button to enter notes using speech.
- **Unique Email Validation**: Validate email addresses during user registration to ensure uniqueness.
- **Authentication**: Only registered users can access the application. New users can register using the provided registration form.

## Contributing

If you would like to contribute to this project, please fork the repository and submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

---
