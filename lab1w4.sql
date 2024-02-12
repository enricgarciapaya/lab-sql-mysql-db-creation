CREATE DATABASE IF NOT EXISTS lab_mysql;


#Cars - e.g. the vehicle identification number (VIN), manufacturer, model, year, and color of the cars in your company's inventory.
#customers - e.g. the customer ID, name, phone number, email, address, city, state/province, country, and zip/postal code of the customer
#Salespersons - e.g. staff ID, name, and the store at your company.
#Invoices - e.g. the invoice number, date, car, customer, and salesperson related to each car sale.
CREATE TABLE lab_mysql.cars (VIN VARCHAR(20) PRIMARY KEY, manufacturer VARCHAR (20) NOT NULL, model  VARCHAR(20) NOT NULL,
						year integer NOT NULL, color VARCHAR (20) NOT NULL);
                        
CREATE TABLE lab_mysql.customers (customer_id INT PRIMARY KEY, name VARCHAR (20) NOT NULL, phone_number VARCHAR(20) UNIQUE NOT NULL,
							email VARCHAR(50) UNIQUE , address VARCHAR (50) NOT NULL, city VARCHAR (20) NOT NULL,
                            state_province VARCHAR (50) NOT NULL,country VARCHAR (50) NOT NULL, zip_postal INT NOT NULL);
                            
CREATE TABLE lab_mysql.Salespersons (staff_id INT PRIMARY KEY, name VARCHAR (20) NOT NULL, store VARCHAR (20) NOT NULL);

CREATE TABLE lab_mysql.Invoices (invoice_number INT AUTO_INCREMENT PRIMARY KEY,date DATE,car VARCHAR(20) UNIQUE NOT NULL,customer INT UNIQUE NOT NULL,
								salesperson INT UNIQUE NOT NULL);
 # foreing key  carsVIN                               
 DROP TABLE lab_mysql.Invoices;  
DROP TABLE lab_mysql.customers;
 INSERT INTO lab_mysql.cars(VIN, manufacturer, model,year,color)
		VALUES ("K096I98581DHSNUP","Volkswagen","Tiguan",2019,"Blue"),
        ("M8G7BEUQZ97IH46V", "Peugeot","Rifter",2019,	"Red"),
        ("RKXVNNIHLVVZOUB4M", "Ford","Fusion" ,2018,"White"),
        ("HKNDGS7CU31E9Z7JW", "Toyota","RAV4" ,2018,"Silver"),
         ("DAM41UDN3CHU2WVF6", "Volvo","V60" ,2019,	"Gray"),
         ("DAM41UDN3CHU2WVF7", "Volvo","V60" ,2019,	"Gray");
SELECT * FROM lab_mysql.cars;
INSERT INTO lab_mysql.customers(customer_id, name, phone_number, email, address, city, state_province, country, zip_postal) VALUES
(10001, "Pablo Picasso", 34636176382, NULL, "Paseo de la Chopera 14", "Madrid", "Madrid", "Spain", 28045),
(20001, "Abraham Lincoln", "13059077086", NULL, "120 SW 8th St", "Miami", "Florida", "United States", 33130),
(30001, "Napoléon Bonaparte", "33179754000", NULL, "40 Rue du Colisée", "Paris", "Île-de-France", "France", 75008);
                            
SELECT * FROM lab_mysql.customers;
INSERT INTO lab_mysql.Salespersons (staff_id, name, store) VALUES
(1, 'Petey Cruiser', 'Madrid'),
(2, 'Anna Sthesia', 'Barcelona'),
(3, 'Paul Molive', 'Berlin'),
(4, 'Gail Forcewind', 'Paris'),
(5, 'Paige Turner', 'Miami'),
(6, 'Bob Frapples', 'Mexico City'),
(7, 'Walter Melon', 'Amsterdam'),
(8, 'Shonda Leer', 'São Paulo');

INSERT INTO lab_mysql.Invoices (date, car, customer, salesperson) VALUES
('2018-08-22', 'K096I98581DHSNUP', 10001, 1),
('2018-12-31', 'RKXVNNIHLVVZOUB4M', 20001, 4),
('2019-01-22', 'DAM41UDN3CHU2WVF7', 30001, 8);

ALTER TABLE lab_mysql.Invoices
ADD CONSTRAINT fk_car FOREIGN KEY (car) REFERENCES lab_mysql.cars(VIN),
ADD CONSTRAINT fk_customer FOREIGN KEY (customer) REFERENCES lab_mysql.customers(customer_id),
ADD CONSTRAINT fk_salesperson FOREIGN KEY (salesperson) REFERENCES lab_mysql.Salespersons(staff_id);
