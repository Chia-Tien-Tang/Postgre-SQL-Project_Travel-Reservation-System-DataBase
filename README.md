# Postgre-SQL-Project_Travel-Reservation-System-DataBase
This project consists in designing a relational database for the given application context, importing the data of a given dataset into a PostgreSQL database and querying the data in SQL.

Project Structure:
* Step 1. Creation of a relational database - The conceptual schema & ER Diagram
* Step 2. Normalization - Normal Form & Tables
* Step 3. The physical schema - Indicate the primary key, foreign keys and NOT NULL & UNIQUE constraints. 
* Step 4. Database creation and data import - Generally cleaning data in excel
* Step 5. Running queries

Project Content:
We intend to manage the data of a travel reservation system with clients all over the world. Upon registration, customers are automatically given a numeric identifier and they are asked to indicate their first and family names, their gender, date of birth, a phone number, an email address and their country of residence.

Any customer can book a trip that includes the reservation of one or more flights and, possibly, one or more hotels.

For each flight booked by a customer, the system keeps the seat number, the travel class (e.g., economy or business), the price and the date of the flight. Usually, airlines include details on the type of aircraft they plan to use on their flight schedules; these details include the name of the aircraft (e.g., Boeing 787-8) and, when available, the IATA code (e.g., 788, a unique three-letter identifier for the aircraft) and the ICAO code (e.g., B788, a unique four-letter identifier for the aircraft).

The system maintains a list of hotels, with their names, addresses and an average review score, which is a real number denoting the average grade assigned to the hotel by its customers. Customers can write a review for an hotel; in which case the system stores the text of the review, the date and its author. When a customer books an hotel, the system keeps the price paid, the check-in and check-out dates and whether the breakfast is included.

Example: 
Emirates flight EK074 leaves Paris, France at 10 AM and arrives at Dubai, UAE at 7:40 PM (regardless of the departure day).
