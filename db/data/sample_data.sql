-- Sample data for Senuhas Colour Mart Database
-- Microsoft SQL Server syntax (largely compatible with MySQL for INSERTs)

-- Insert data into PERSON table
INSERT INTO PERSON (first_name, last_name, phone, email, address) VALUES
('John', 'Smith', '+94711234567', 'john.smith@email.com', '123 Main St, Colombo 5'),
('Mary', 'Johnson', '+94721234568', 'mary.johnson@email.com', '456 Park Ave, Colombo 7'),
('David', 'Williams', '+94731234569', 'david.williams@email.com', '789 Lake Rd, Kandy'),
('Sarah', 'Brown', '+94741234570', 'sarah.brown@email.com', '101 Hill St, Galle'),
('Michael', 'Jones', '+94751234571', 'michael.jones@email.com', '202 Beach Rd, Negombo'),
('Jennifer', 'Miller', '+94761234572', 'jennifer.miller@email.com', '303 Temple Rd, Matara'),
('Robert', 'Davis', '+94771234573', 'robert.davis@email.com', '404 Garden St, Jaffna'),
('Patricia', 'Garcia', '+94781234574', 'patricia.garcia@email.com', '505 River Rd, Batticaloa'),
('James', 'Rodriguez', '+94791234575', 'james.rodriguez@email.com', '606 Mountain Ave, Nuwara Eliya'),
('Linda', 'Wilson', '+94701234576', 'linda.wilson@email.com', '707 Valley Ln, Anuradhapura'),
('William', 'Martinez', '+94711234577', 'william.martinez@email.com', '808 Forest Dr, Badulla'),
('Elizabeth', 'Anderson', '+94721234578', 'elizabeth.anderson@email.com', '909 Ocean Blvd, Trincomalee'),
('Richard', 'Taylor', '+94731234579', 'richard.taylor@email.com', '110 Sunset Dr, Ratnapura'),
('Susan', 'Thomas', '+94741234580', 'susan.thomas@email.com', '211 Sunrise Ave, Kurunegala'),
('Joseph', 'Hernandez', '+94751234581', 'joseph.hernandez@email.com', '312 Moonlight Rd, Polonnaruwa'),
('Margaret', 'Moore', '+94761234582', 'margaret.moore@email.com', '413 Starlight St, Hambantota'),
('Charles', 'Martin', '+94771234583', 'charles.martin@email.com', '514 Cloud Ln, Matale'),
('Jessica', 'Jackson', '+94781234584', 'jessica.jackson@email.com', '615 Rainbow Rd, Puttalam'),
('Thomas', 'Thompson', '+94791234585', 'thomas.thompson@email.com', '716 Sunshine Ave, Kegalle'),
('Dorothy', 'White', '+94701234586', 'dorothy.white@email.com', '817 Breeze Blvd, Ampara');

-- Insert data into STORE table (without manager_id for now)
INSERT INTO STORE (store_id, store_name, address, city, phone, email, opening_date, square_footage) VALUES
(1, 'Senuhas Colour Mart - Homagama', '45 Main Street', 'Homagama', '+94112345678', 'homagama@senuhas.com', '2015-03-15', 2500.00),
(2, 'Senuhas Colour Mart - Malabe', '78 Tech Park Road', 'Malabe', '+94112345679', 'malabe@senuhas.com', '2016-07-22', 3000.00),
(3, 'Senuhas Colour Mart - Kaduwela', '112 Avissawella Road', 'Kaduwela', '+94112345680', 'kaduwela@senuhas.com', '2017-11-05', 2200.00),
(4, 'Senuhas Colour Mart - Kottawa', '23 High Level Road', 'Kottawa', '+94112345681', 'kottawa@senuhas.com', '2018-04-18', 1800.00),
(5, 'Senuhas Colour Mart - Maharagama', '56 Highlevel Road', 'Maharagama', '+94112345682', 'maharagama@senuhas.com', '2019-09-30', 2800.00),
(6, 'Senuhas Colour Mart - Nugegoda', '89 Stanley Thilakaratne Mawatha', 'Nugegoda', '+94112345683', 'nugegoda@senuhas.com', '2020-02-14', 3200.00),
(7, 'Senuhas Colour Mart - Battaramulla', '34 Pannipitiya Road', 'Battaramulla', '+94112345684', 'battaramulla@senuhas.com', '2020-08-07', 2600.00),
(8, 'Senuhas Colour Mart - Rajagiriya', '67 Sri Jayawardenepura Road', 'Rajagiriya', '+94112345685', 'rajagiriya@senuhas.com', '2021-01-22', 2400.00),
(9, 'Senuhas Colour Mart - Dehiwala', '90 Galle Road', 'Dehiwala', '+94112345686', 'dehiwala@senuhas.com', '2021-06-15', 2100.00),
(10, 'Senuhas Colour Mart - Mount Lavinia', '123 Hotel Road', 'Mount Lavinia', '+94112345687', 'mountlavinia@senuhas.com', '2022-03-01', 1900.00);

-- Insert data into EMPLOYEE table
INSERT INTO EMPLOYEE (employee_id, person_id, hire_date, position, salary, store_id, manager_id) VALUES
(1, 1, '2015-04-01', 'General Manager', 150000.00, 1, NULL),
(2, 2, '2015-04-15', 'Store Manager', 120000.00, 1, 1),
(3, 3, '2016-08-01', 'Store Manager', 120000.00, 2, 1),
(4, 4, '2017-11-15', 'Store Manager', 120000.00, 3, 1),
(5, 5, '2018-05-01', 'Store Manager', 120000.00, 4, 1),
(6, 6, '2019-10-15', 'Store Manager', 120000.00, 5, 1),
(7, 7, '2020-03-01', 'Store Manager', 120000.00, 6, 1),
(8, 8, '2020-08-15', 'Store Manager', 120000.00, 7, 1),
(9, 9, '2021-02-01', 'Store Manager', 120000.00, 8, 1),
(10, 10, '2021-07-01', 'Store Manager', 120000.00, 9, 1),
(11, 11, '2022-03-15', 'Store Manager', 120000.00, 10, 1),
(12, 12, '2015-05-01', 'Sales Associate', 65000.00, 1, 2),
(13, 13, '2015-05-15', 'Sales Associate', 65000.00, 1, 2),
(14, 14, '2016-09-01', 'Sales Associate', 65000.00, 2, 3),
(15, 15, '2016-09-15', 'Sales Associate', 65000.00, 2, 3),
(16, 16, '2017-12-01', 'Sales Associate', 65000.00, 3, 4),
(17, 17, '2018-06-01', 'Sales Associate', 65000.00, 4, 5),
(18, 18, '2019-11-01', 'Sales Associate', 65000.00, 5, 6),
(19, 19, '2020-04-01', 'Sales Associate', 65000.00, 6, 7),
(20, 20, '2020-09-01', 'Sales Associate', 65000.00, 7, 8);

-- Update STORE table with manager_id
UPDATE STORE SET manager_id = 2 WHERE store_id = 1;
UPDATE STORE SET manager_id = 3 WHERE store_id = 2;
UPDATE STORE SET manager_id = 4 WHERE store_id = 3;
UPDATE STORE SET manager_id = 5 WHERE store_id = 4;
UPDATE STORE SET manager_id = 6 WHERE store_id = 5;
UPDATE STORE SET manager_id = 7 WHERE store_id = 6;
UPDATE STORE SET manager_id = 8 WHERE store_id = 7;
UPDATE STORE SET manager_id = 9 WHERE store_id = 8;
UPDATE STORE SET manager_id = 10 WHERE store_id = 9;
UPDATE STORE SET manager_id = 11 WHERE store_id = 10;

-- Insert data into MANAGER table
INSERT INTO MANAGER (employee_id, promotion_date, bonus_rate, management_level) VALUES
(1, '2015-04-01', 20.00, 'Executive'),
(2, '2015-04-15', 15.00, 'Senior'),
(3, '2016-08-01', 15.00, 'Senior'),
(4, '2017-11-15', 15.00, 'Senior'),
(5, '2018-05-01', 15.00, 'Senior'),
(6, '2019-10-15', 15.00, 'Senior'),
(7, '2020-03-01', 15.00, 'Senior'),
(8, '2020-08-15', 15.00, 'Senior'),
(9, '2021-02-01', 15.00, 'Senior'),
(10, '2021-07-01', 15.00, 'Senior'),
(11, '2022-03-15', 15.00, 'Senior');

-- Insert data into SALES_STAFF table
INSERT INTO SALES_STAFF (employee_id, commission_rate, sales_target) VALUES
(12, 5.00, 500000.00),
(13, 5.00, 500000.00),
(14, 5.00, 500000.00),
(15, 5.00, 500000.00),
(16, 5.00, 500000.00),
(17, 5.00, 500000.00),
(18, 5.00, 500000.00),
(19, 5.00, 500000.00),
(20, 5.00, 500000.00);

-- Insert data into CUSTOMER table
INSERT INTO CUSTOMER (customer_id, person_id, registration_date, loyalty_points, customer_type, credit_limit) VALUES
(1, 1, '2015-05-10', 1500, 'Retail', NULL),
(2, 2, '2015-06-15', 2200, 'Retail', NULL),
(3, 3, '2016-09-20', 1800, 'Retail', NULL),
(4, 4, '2017-01-05', 900, 'Retail', NULL),
(5, 5, '2017-03-22', 1200, 'Retail', NULL),
(6, 6, '2018-02-14', 500, 'Wholesale', 500000.00),
(7, 7, '2018-07-30', 0, 'Wholesale', 750000.00),
(8, 8, '2019-04-18', 0, 'Wholesale', 1000000.00),
(9, 9, '2019-11-05', 0, 'Wholesale', 600000.00),
(10, 10, '2020-01-20', 0, 'Wholesale', 800000.00),
(11, 11, '2020-05-12', 3500, 'Retail', NULL),
(12, 12, '2020-08-03', 2800, 'Retail', NULL),
(13, 13, '2021-03-17', 1600, 'Retail', NULL),
(14, 14, '2021-09-22', 700, 'Retail', NULL),
(15, 15, '2022-01-08', 300, 'Retail', NULL);

-- Insert data into RETAIL_CUSTOMER table
INSERT INTO RETAIL_CUSTOMER (customer_id, frequency_visit) VALUES
(1, 8),
(2, 12),
(3, 6),
(4, 4),
(5, 7),
(11, 15),
(12, 10),
(13, 5),
(14, 3),
(15, 2);

-- Insert data into WHOLESALE_CUSTOMER table
INSERT INTO WHOLESALE_CUSTOMER (customer_id, discount_rate, credit_limit, business_name, tax_id) VALUES
(6, 10.00, 500000.00, 'ABC Construction', 'TAX123456'),
(7, 12.00, 750000.00, 'XYZ Developers', 'TAX234567'),
(8, 15.00, 1000000.00, 'Mega Builders', 'TAX345678'),
(9, 8.00, 600000.00, 'City Contractors', 'TAX456789'),
(10, 10.00, 800000.00, 'Island Interiors', 'TAX567890');

-- Insert data into SUPPLIER table
INSERT INTO SUPPLIER (supplier_id, company_name, contact_name, phone, email, address, city, payment_terms, lead_time_days, registration_date, credit_limit, status) VALUES
(1, 'Asian Paints Ltd', 'Rajiv Mehta', '+919876543210', 'rajiv.mehta@asianpaints.com', '123 Industrial Zone', 'Mumbai', 'Net 30', 7, '2015-02-10', 5000000.00, 'Active'),
(2, 'Dulux Paints', 'Sarah Johnson', '+61298765432', 'sarah.johnson@dulux.com', '456 Paint Street', 'Sydney', 'Net 45', 14, '2015-03-05', 4500000.00, 'Active'),
(3, 'Nippon Paint', 'Takashi Yamamoto', '+81345678901', 'takashi.yamamoto@nipponpaint.com', '789 Color Road', 'Tokyo', 'Net 30', 21, '2015-04-20', 4000000.00, 'Active'),
(4, 'Berger Paints', 'Amit Sharma', '+919876543211', 'amit.sharma@bergerpaints.com', '101 Coating Avenue', 'Delhi', 'Net 30', 10, '2015-06-15', 3500000.00, 'Active'),
(5, 'Jotun', 'Erik Olsen', '+4712345678', 'erik.olsen@jotun.com', '202 Nordic Way', 'Oslo', 'Net 45', 28, '2015-08-22', 5500000.00, 'Active'),
(6, 'Stanley Tools', 'Michael Brown', '+14155552671', 'michael.brown@stanley.com', '303 Tool Street', 'Connecticut', 'Net 30', 14, '2016-01-10', 3000000.00, 'Active'),
(7, 'Bosch', 'Hans Mueller', '+4930123456', 'hans.mueller@bosch.com', '404 Engineering Road', 'Stuttgart', 'Net 45', 21, '2016-03-18', 6000000.00, 'Active'),
(8, 'Makita', 'Kenji Suzuki', '+81345678902', 'kenji.suzuki@makita.com', '505 Power Tool Avenue', 'Anjo', 'Net 30', 14, '2016-05-25', 4500000.00, 'Active'),
(9, 'DeWalt', 'Jennifer Wilson', '+14155552672', 'jennifer.wilson@dewalt.com', '606 Professional Drive', 'Baltimore', 'Net 30', 10, '2016-07-30', 5000000.00, 'Active'),
(10, 'Hitachi', 'Hiroshi Tanaka', '+81345678903', 'hiroshi.tanaka@hitachi.com', '707 Technology Park', 'Tokyo', 'Net 45', 21, '2016-09-15', 5500000.00, 'Active'),
(11, 'Local Hardware Supplies', 'Kumara Perera', '+94112345688', 'kumara@localhardware.lk', '808 Supply Street', 'Colombo', 'Net 15', 5, '2017-01-20', 1500000.00, 'Active'),
(12, 'Ceylon Timber Corporation', 'Nimal Silva', '+94112345689', 'nimal@ceylontimber.lk', '909 Wood Lane', 'Moratuwa', 'Net 30', 7, '2017-03-12', 2000000.00, 'Active');

-- Insert data into PRODUCT_CATEGORY table
INSERT INTO PRODUCT_CATEGORY (category_id, category_name, description, parent_category_id) VALUES
(1, 'Paint', 'All types of paints and coatings', NULL),
(2, 'Hardware', 'Tools and hardware items', NULL),
(3, 'Interior Paint', 'Paints for interior walls and surfaces', 1),
(4, 'Exterior Paint', 'Paints for exterior walls and surfaces', 1),
(5, 'Specialty Paint', 'Special purpose paints', 1),
(6, 'Hand Tools', 'Manual tools for various tasks', 2),
(7, 'Power Tools', 'Electric and battery-powered tools', 2),
(8, 'Fasteners', 'Nails, screws, and other fastening items', 2),
(9, 'Plumbing', 'Plumbing supplies and tools', 2),
(10, 'Electrical', 'Electrical supplies and tools', 2),
(11, 'Wall Paint', 'Paints specifically for walls', 3),
(12, 'Ceiling Paint', 'Paints specifically for ceilings', 3),
(13, 'Wood Paint', 'Paints and stains for wooden surfaces', 4);

-- Insert data into PRODUCT table
INSERT INTO PRODUCT (product_id, product_name, description, unit_price, unit_measure, category_id, supplier_id, reorder_level, reorder_quantity, manufacturer, barcode, status) VALUES
(1, 'Asian Paints Premium Emulsion', 'High-quality interior wall paint', 4500.00, 'Liter', 11, 1, 20, 50, 'Asian Paints', 'AP001122334455', 'Active'),
(2, 'Dulux Weathershield', 'Weather-resistant exterior paint', 5200.00, 'Liter', 4, 2, 15, 40, 'Dulux', 'DL001122334455', 'Active'),
(3, 'Nippon Paint Odour-less', 'Low-odor interior paint', 4800.00, 'Liter', 11, 3, 20, 50, 'Nippon Paint', 'NP001122334455', 'Active'),
(4, 'Berger Easy Clean', 'Washable interior wall paint', 4300.00, 'Liter', 11, 4, 25, 60, 'Berger', 'BP001122334455', 'Active'),
(5, 'Jotun Jotashield', 'Exterior paint with UV protection', 5500.00, 'Liter', 4, 5, 15, 40, 'Jotun', 'JT001122334455', 'Active'),
(6, 'Asian Paints Royale Ceiling', 'Premium ceiling paint', 4200.00, 'Liter', 12, 1, 15, 40, 'Asian Paints', 'AP002233445566', 'Active'),
(7, 'Dulux Wood Stain', 'Protective wood stain', 3800.00, 'Liter', 13, 2, 10, 30, 'Dulux', 'DL002233445566', 'Active'),
(8, 'Nippon Paint Metallic Finish', 'Decorative metallic paint', 6500.00, 'Liter', 5, 3, 10, 25, 'Nippon Paint', 'NP002233445566', 'Active'),
(9, 'Berger Anti-Fungal Paint', 'Mold-resistant paint', 5100.00, 'Liter', 5, 4, 15, 35, 'Berger', 'BP002233445566', 'Active'),
(10, 'Jotun Marine Paint', 'Waterproof paint for marine applications', 7200.00, 'Liter', 5, 5, 10, 25, 'Jotun', 'JT002233445566', 'Active'),
(11, 'Stanley Hammer', 'Professional claw hammer', 2500.00, 'Each', 6, 6, 30, 50, 'Stanley', 'ST001122334455', 'Active'),
(12, 'Bosch Drill Machine', 'Professional electric drill', 15000.00, 'Each', 7, 7, 10, 20, 'Bosch', 'BS001122334455', 'Active'),
(13, 'Makita Circular Saw', 'Heavy-duty circular saw', 18500.00, 'Each', 7, 8, 8, 15, 'Makita', 'MK001122334455', 'Active'),
(14, 'DeWalt Angle Grinder', 'Professional angle grinder', 12500.00, 'Each', 7, 9, 10, 20, 'DeWalt', 'DW001122334455', 'Active'),
(15, 'Hitachi Impact Driver', 'Cordless impact driver', 14500.00, 'Each', 7, 10, 10, 20, 'Hitachi', 'HT001122334455', 'Active'),
(16, 'Stanley Screwdriver Set', '10-piece screwdriver set', 3500.00, 'Set', 6, 6, 25, 40, 'Stanley', 'ST002233445566', 'Active'),
(17, 'Bosch Jigsaw', 'Professional jigsaw', 16500.00, 'Each', 7, 7, 8, 15, 'Bosch', 'BS002233445566', 'Active'),
(18, 'Makita Sander', 'Orbital sander', 11000.00, 'Each', 7, 8, 10, 20, 'Makita', 'MK002233445566', 'Active'),
(19, 'DeWalt Measuring Tape', '8m professional measuring tape', 1800.00, 'Each', 6, 9, 40, 80, 'DeWalt', 'DW002233445566', 'Active'),
(20, 'Hitachi Router', 'Professional wood router', 17500.00, 'Each', 7, 10, 8, 15, 'Hitachi', 'HT002233445566', 'Active');

-- Insert data into PAINT_PRODUCT table
INSERT INTO PAINT_PRODUCT (product_id, color_code, base_type, finish_type, coverage_area, volume, brand, application_method) VALUES
(1, 'AP-WH-001', 'Water', 'Matte', 120.00, 4.00, 'Asian Paints', 'Brush, Roller'),
(2, 'DL-WH-001', 'Water', 'Satin', 100.00, 4.00, 'Dulux', 'Brush, Roller, Spray'),
(3, 'NP-WH-001', 'Water', 'Matte', 110.00, 4.00, 'Nippon Paint', 'Brush, Roller'),
(4, 'BP-WH-001', 'Water', 'Eggshell', 115.00, 4.00, 'Berger', 'Brush, Roller'),
(5, 'JT-WH-001', 'Water', 'Semi-Gloss', 95.00, 4.00, 'Jotun', 'Brush, Roller, Spray'),
(6, 'AP-WH-002', 'Water', 'Flat', 130.00, 4.00, 'Asian Paints', 'Brush, Roller'),
(7, 'DL-BR-001', 'Oil', 'Satin', 80.00, 1.00, 'Dulux', 'Brush'),
(8, 'NP-MT-001', 'Water', 'Metallic', 90.00, 2.00, 'Nippon Paint', 'Brush, Roller'),
(9, 'BP-WH-002', 'Water', 'Matte', 110.00, 4.00, 'Berger', 'Brush, Roller'),
(10, 'JT-BL-001', 'Oil', 'Gloss', 85.00, 4.00, 'Jotun', 'Brush, Roller, Spray');

-- Insert data into HARDWARE_PRODUCT table
INSERT INTO HARDWARE_PRODUCT (product_id, material, dimensions, weight, brand, warranty_period) VALUES
(11, 'Steel', '13 inches', 0.60, 'Stanley', '1 year'),
(12, 'Metal/Plastic', '30 x 10 x 30 cm', 1.80, 'Bosch', '2 years'),
(13, 'Metal/Plastic', '35 x 25 x 30 cm', 3.20, 'Makita', '3 years'),
(14, 'Metal/Plastic', '30 x 10 x 20 cm', 2.10, 'DeWalt', '3 years'),
(15, 'Metal/Plastic', '25 x 8 x 20 cm', 1.50, 'Hitachi', '2 years'),
(16, 'Steel/Plastic', '30 x 20 x 5 cm', 0.80, 'Stanley', '1 year'),
(17, 'Metal/Plastic', '30 x 15 x 25 cm', 2.30, 'Bosch', '2 years'),
(18, 'Metal/Plastic', '25 x 15 x 20 cm', 1.70, 'Makita', '2 years'),
(19, 'Metal/Plastic', '8m x 3cm x 3cm', 0.30, 'DeWalt', '1 year'),
(20, 'Metal/Plastic', '30 x 20 x 25 cm', 2.80, 'Hitachi', '2 years');

-- Insert data into INVENTORY table
INSERT INTO INVENTORY (inventory_id, store_id, product_id, quantity, last_updated, shelf_location, expiry_date) VALUES
(1, 1, 1, 45, '2024-01-15', 'A1-01', '2026-01-15'),
(2, 1, 2, 32, '2024-01-15', 'A1-02', '2026-01-15'),
(3, 1, 3, 38, '2024-01-15', 'A1-03', '2026-01-15'),
(4, 1, 11, 25, '2024-01-15', 'B1-01', NULL),
(5, 1, 12, 12, '2024-01-15', 'B1-02', NULL),
(6, 2, 1, 40, '2024-01-16', 'A1-01', '2026-01-16'),
(7, 2, 2, 35, '2024-01-16', 'A1-02', '2026-01-16'),
(8, 2, 4, 42, '2024-01-16', 'A1-04', '2026-01-16'),
(9, 2, 13, 10, '2024-01-16', 'B1-03', NULL),
(10, 2, 14, 8, '2024-01-16', 'B1-04', NULL),
(11, 3, 5, 30, '2024-01-17', 'A1-05', '2026-01-17'),
(12, 3, 6, 28, '2024-01-17', 'A1-06', '2026-01-17'),
(13, 3, 15, 12, '2024-01-17', 'B1-05', NULL),
(14, 3, 16, 22, '2024-01-17', 'B1-06', NULL),
(15, 4, 7, 25, '2024-01-18', 'A1-07', '2026-01-18'),
(16, 4, 8, 18, '2024-01-18', 'A1-08', '2026-01-18'),
(17, 4, 17, 9, '2024-01-18', 'B1-07', NULL),
(18, 4, 18, 11, '2024-01-18', 'B1-08', NULL),
(19, 5, 9, 32, '2024-01-19', 'A1-09', '2026-01-19'),
(20, 5, 10, 15, '2024-01-19', 'A1-10', '2026-01-19'),
(21, 5, 19, 35, '2024-01-19', 'B1-09', NULL),
(22, 5, 20, 7, '2024-01-19', 'B1-10', NULL),
(23, 6, 1, 38, '2024-01-20', 'A1-01', '2026-01-20'),
(24, 6, 3, 42, '2024-01-20', 'A1-03', '2026-01-20'),
(25, 6, 11, 28, '2024-01-20', 'B1-01', NULL),
(26, 6, 13, 9, '2024-01-20', 'B1-03', NULL),
(27, 7, 2, 36, '2024-01-21', 'A1-02', '2026-01-21'),
(28, 7, 4, 40, '2024-01-21', 'A1-04', '2026-01-21'),
(29, 7, 12, 11, '2024-01-21', 'B1-02', NULL),
(30, 7, 14, 7, '2024-01-21', 'B1-04', NULL);

-- Insert data into PURCHASE_ORDER table
INSERT INTO PURCHASE_ORDER (po_id, supplier_id, store_id, employee_id, order_date, expected_delivery_date, status, total_amount, payment_status) VALUES
(1, 1, 1, 2, '2024-01-05', '2024-01-12', 'Received', 225000.00, 'Paid'),
(2, 2, 1, 2, '2024-01-06', '2024-01-20', 'Received', 166400.00, 'Paid'),
(3, 3, 2, 3, '2024-01-07', '2024-01-28', 'Received', 192000.00, 'Paid'),
(4, 4, 2, 3, '2024-01-08', '2024-01-18', 'Received', 172000.00, 'Paid'),
(5, 5, 3, 4, '2024-01-09', '2024-02-06', 'Received', 165000.00, 'Paid'),
(6, 6, 3, 4, '2024-01-10', '2024-01-24', 'Received', 75000.00, 'Paid'),
(7, 7, 4, 5, '2024-01-11', '2024-02-01', 'Received', 150000.00, 'Paid'),
(8, 8, 4, 5, '2024-01-12', '2024-01-26', 'Received', 110000.00, 'Paid'),
(9, 9, 5, 6, '2024-01-13', '2024-01-23', 'Received', 36000.00, 'Paid'),
(10, 10, 5, 6, '2024-01-14', '2024-02-04', 'Received', 122500.00, 'Paid'),
(11, 1, 6, 7, '2024-01-15', '2024-01-22', 'Received', 180000.00, 'Paid'),
(12, 3, 6, 7, '2024-01-16', '2024-02-06', 'Received', 201600.00, 'Paid'),
(13, 2, 7, 8, '2024-01-17', '2024-01-31', 'Received', 187200.00, 'Paid'),
(14, 4, 7, 8, '2024-01-18', '2024-01-28', 'Received', 172000.00, 'Paid');

-- Insert data into PO_DETAIL table
INSERT INTO PO_DETAIL (po_detail_id, po_id, product_id, quantity, unit_price, expected_delivery) VALUES
(1, 1, 1, 50, 4500.00, '2024-01-12'),
(2, 2, 2, 32, 5200.00, '2024-01-20'),
(3, 3, 3, 40, 4800.00, '2024-01-28'),
(4, 4, 4, 40, 4300.00, '2024-01-18'),
(5, 5, 5, 30, 5500.00, '2024-02-06'),
(6, 6, 11, 30, 2500.00, '2024-01-24'),
(7, 7, 12, 10, 15000.00, '2024-02-01'),
(8, 8, 13, 10, 11000.00, '2024-01-26'),
(9, 9, 19, 20, 1800.00, '2024-01-23'),
(10, 10, 20, 7, 17500.00, '2024-02-04'),
(11, 11, 1, 40, 4500.00, '2024-01-22'),
(12, 12, 3, 42, 4800.00, '2024-02-06'),
(13, 13, 2, 36, 5200.00, '2024-01-31'),
(14, 14, 4, 40, 4300.00, '2024-01-28');

-- Insert data into SALES_TRANSACTION table
INSERT INTO SALES_TRANSACTION (transaction_id, store_id, customer_id, employee_id, transaction_date, subtotal, tax_amount, discount_amount, total_amount, payment_method, invoice_number) VALUES
(1, 1, 1, 12, '2024-02-01 10:15:00', 9000.00, 1080.00, 0.00, 10080.00, 'Cash', 'INV-2024-0001'),
(2, 1, 2, 13, '2024-02-02 11:30:00', 5200.00, 624.00, 0.00, 5824.00, 'Credit Card', 'INV-2024-0002'),
(3, 2, 3, 14, '2024-02-03 14:45:00', 4800.00, 576.00, 0.00, 5376.00, 'Cash', 'INV-2024-0003'),
(4, 2, 4, 15, '2024-02-04 16:20:00', 4300.00, 516.00, 0.00, 4816.00, 'Debit Card', 'INV-2024-0004'),
(5, 3, 5, 16, '2024-02-05 09:10:00', 5500.00, 660.00, 0.00, 6160.00, 'Cash', 'INV-2024-0005'),
(6, 3, 6, 16, '2024-02-06 13:25:00', 25000.00, 3000.00, 2500.00, 25500.00, 'Credit Card', 'INV-2024-0006'),
(7, 4, 7, 17, '2024-02-07 15:40:00', 45000.00, 5400.00, 5400.00, 45000.00, 'Check', 'INV-2024-0007'),
(8, 4, 8, 17, '2024-02-08 10:55:00', 37000.00, 4440.00, 5550.00, 35890.00, 'Credit Card', 'INV-2024-0008'),
(9, 5, 9, 18, '2024-02-09 12:15:00', 18000.00, 2160.00, 1440.00, 18720.00, 'Credit Card', 'INV-2024-0009'),
(10, 5, 10, 18, '2024-02-10 14:30:00', 35000.00, 4200.00, 3500.00, 35700.00, 'Check', 'INV-2024-0010'),
(11, 6, 11, 19, '2024-02-11 16:45:00', 9000.00, 1080.00, 0.00, 10080.00, 'Cash', 'INV-2024-0011'),
(12, 6, 12, 19, '2024-02-12 09:20:00', 4800.00, 576.00, 0.00, 5376.00, 'Debit Card', 'INV-2024-0012'),
(13, 7, 13, 20, '2024-02-13 11:35:00', 5200.00, 624.00, 0.00, 5824.00, 'Cash', 'INV-2024-0013'),
(14, 7, 14, 20, '2024-02-14 13:50:00', 4300.00, 516.00, 0.00, 4816.00, 'Credit Card', 'INV-2024-0014'),
(15, 8, 15, 12, '2024-02-15 15:05:00', 2500.00, 300.00, 0.00, 2800.00, 'Cash', 'INV-2024-0015');

-- Insert data into SALES_DETAIL table
INSERT INTO SALES_DETAIL (sales_detail_id, transaction_id, product_id, quantity, unit_price, discount, warranty_period) VALUES
(1, 1, 1, 2, 4500.00, 0.00, NULL),
(2, 2, 2, 1, 5200.00, 0.00, NULL),
(3, 3, 3, 1, 4800.00, 0.00, NULL),
(4, 4, 4, 1, 4300.00, 0.00, NULL),
(5, 5, 5, 1, 5500.00, 0.00, NULL),
(6, 6, 11, 10, 2500.00, 10.00, '1 year'),
(7, 7, 12, 3, 15000.00, 12.00, '2 years'),
(8, 8, 13, 2, 18500.00, 15.00, '3 years'),
(9, 9, 19, 10, 1800.00, 8.00, '1 year'),
(10, 10, 20, 2, 17500.00, 10.00, '2 years'),
(11, 11, 1, 2, 4500.00, 0.00, NULL),
(12, 12, 3, 1, 4800.00, 0.00, NULL),
(13, 13, 2, 1, 5200.00, 0.00, NULL),
(14, 14, 4, 1, 4300.00, 0.00, NULL),
(15, 15, 11, 1, 2500.00, 0.00, '1 year');

-- Insert data into PAYMENT table
INSERT INTO PAYMENT (payment_id, transaction_id, payment_date, amount, payment_method, payment_status, reference_number) VALUES
(1, 1, '2024-02-01 10:20:00', 10080.00, 'Cash', 'Completed', NULL),
(2, 2, '2024-02-02 11:35:00', 5824.00, 'Visa', 'Completed', 'VISA123456'),
(3, 3, '2024-02-03 14:50:00', 5376.00, 'Cash', 'Completed', NULL),
(4, 4, '2024-02-04 16:25:00', 4816.00, 'MasterCard', 'Completed', 'MC123456'),
(5, 5, '2024-02-05 09:15:00', 6160.00, 'Cash', 'Completed', NULL),
(6, 6, '2024-02-06 13:30:00', 25500.00, 'American Express', 'Completed', 'AMEX123456'),
(7, 7, '2024-02-07 15:45:00', 45000.00, 'Check', 'Completed', 'CHK123456'),
(8, 8, '2024-02-08 11:00:00', 35890.00, 'Visa', 'Completed', 'VISA234567'),
(9, 9, '2024-02-09 12:20:00', 18720.00, 'MasterCard', 'Completed', 'MC234567'),
(10, 10, '2024-02-10 14:35:00', 35700.00, 'Check', 'Completed', 'CHK234567'),
(11, 11, '2024-02-11 16:50:00', 10080.00, 'Cash', 'Completed', NULL),
(12, 12, '2024-02-12 09:25:00', 5376.00, 'MasterCard', 'Completed', 'MC345678'),
(13, 13, '2024-02-13 11:40:00', 5824.00, 'Cash', 'Completed', NULL),
(14, 14, '2024-02-14 13:55:00', 4816.00, 'Visa', 'Completed', 'VISA345678'),
(15, 15, '2024-02-15 15:10:00', 2800.00, 'Cash', 'Completed', NULL);

-- Insert data into INVENTORY_TRANSFER table
INSERT INTO INVENTORY_TRANSFER (transfer_id, from_store_id, to_store_id, transfer_date, status, initiated_by, approved_by) VALUES
(1, 1, 2, '2024-03-01', 'Completed', 2, 1),
(2, 2, 3, '2024-03-05', 'Completed', 3, 1),
(3, 3, 4, '2024-03-10', 'Completed', 4, 1),
(4, 4, 5, '2024-03-15', 'Completed', 5, 1),
(5, 5, 6, '2024-03-20', 'Completed', 6, 1),
(6, 6, 7, '2024-03-25', 'Completed', 7, 1),
(7, 7, 8, '2024-03-30', 'Completed', 8, 1),
(8, 8, 9, '2024-04-05', 'Completed', 9, 1),
(9, 9, 10, '2024-04-10', 'Completed', 10, 1),
(10, 10, 1, '2024-04-15', 'Completed', 11, 1);

-- Insert data into TRANSFER_ITEM table
INSERT INTO TRANSFER_ITEM (transfer_item_id, transfer_id, product_id, quantity) VALUES
(1, 1, 1, 5),
(2, 1, 2, 3),
(3, 2, 3, 4),
(4, 2, 4, 3),
(5, 3, 5, 2),
(6, 3, 6, 3),
(7, 4, 7, 2),
(8, 4, 8, 2),
(9, 5, 9, 3),
(10, 5, 10, 1),
(11, 6, 11, 4),
(12, 6, 12, 1),
(13, 7, 13, 1),
(14, 7, 14, 1),
(15, 8, 15, 1),
(16, 8, 16, 2),
(17, 9, 17, 1),
(18, 9, 18, 1),
(19, 10, 19, 3),
(20, 10, 20, 1);

-- Insert data into PROMOTION table
INSERT INTO PROMOTION (promotion_id, promotion_name, description, start_date, end_date, discount_rate, category_id, min_purchase_qty, min_purchase_amount) VALUES
(1, 'New Year Paint Sale', 'Special discounts on all interior paints', '2024-01-01', '2024-01-31', 15.00, 3, NULL, NULL),
(2, 'Power Tool Bonanza', 'Buy one get one 50% off on select power tools', '2024-02-01', '2024-02-28', 50.00, 7, 2, NULL),
(3, 'Monsoon Exterior Paint Offer', 'Prepare for monsoon with discounted exterior paints', '2024-05-01', '2024-05-31', 10.00, 4, NULL, 10000.00),
(4, 'Hand Tools Clearance', 'Clearance sale on all hand tools', '2024-03-01', '2024-03-31', 25.00, 6, NULL, NULL),
(5, 'Specialty Paint Week', 'Special offers on specialty paints', '2024-04-01', '2024-04-07', 20.00, 5, NULL, NULL),
(6, 'Bulk Purchase Discount', 'Special discounts for bulk purchases', '2024-06-01', '2024-06-30', 30.00, NULL, 10, 50000.00),
(7, 'Loyalty Member Special', 'Extra discounts for loyalty members', '2024-07-01', '2024-07-31', 10.00, NULL, NULL, 5000.00),
(8, 'Weekend Flash Sale', 'Special weekend discounts on select items', '2024-08-04', '2024-08-06', 40.00, NULL, NULL, NULL),
(9, 'Back to School Tools', 'Discounts on tools for students and teachers', '2024-09-01', '2024-09-30', 15.00, 2, NULL, NULL),
(10, 'Holiday Season Special', 'Special offers for the holiday season', '2024-12-01', '2024-12-31', 20.00, NULL, NULL, NULL);

-- Insert data into PRODUCT_REVIEW table
INSERT INTO PRODUCT_REVIEW (review_id, product_id, customer_id, review_date, rating, comments) VALUES
(1, 1, 1, '2024-02-15', 5, 'Excellent coverage and finish. Very satisfied with the product.'),
(2, 2, 2, '2024-02-16', 4, 'Good weather resistance. Has been holding up well in the rainy season.'),
(3, 3, 3, '2024-02-17', 5, 'The low odor feature is amazing. Perfect for indoor use.'),
(4, 4, 4, '2024-02-18', 4, 'Easy to clean as advertised. Good value for money.'),
(5, 5, 5, '2024-02-19', 4, 'Great UV protection. The color has not faded even after months in direct sunlight.'),
(6, 11, 6, '2024-02-20', 5, 'Excellent balance and grip. Makes work much easier.'),
(7, 12, 7, '2024-02-21', 5, 'Powerful and reliable. Battery life is impressive.'),
(8, 13, 8, '2024-02-22', 4, 'Cuts smoothly and accurately. A bit heavy but worth it for the quality.'),
(9, 14, 9, '2024-02-23', 3, 'Good performance but a bit noisy. Otherwise satisfied.'),
(10, 15, 10, '2024-02-24', 5, 'Compact and powerful. Perfect for my needs.'),
(11, 6, 11, '2024-02-25', 4, 'Good coverage for ceiling paint. No drips or splatters.'),
(12, 7, 12, '2024-02-26', 5, 'Beautiful finish on my wooden furniture. Easy to apply.'),
(13, 8, 13, '2024-02-27', 5, 'The metallic finish is stunning. Many compliments received.'),
(14, 9, 14, '2024-02-28', 4, 'Effective against mold in my bathroom. Good product.'),
(15, 10, 15, '2024-03-01', 5, 'Used it on my boat and it has been excellent. Highly recommended for marine use.');

-- Insert data into ORDER_ITEM table (assuming this is for a separate order system not fully defined in the schema)
INSERT INTO ORDER_ITEM (order_item_id, order_id, product_id, quantity, unit_price, discount_percentage, line_total) VALUES
(1, 1, 1, 2, 4500.00, 0.00, 9000.00),
(2, 1, 11, 1, 2500.00, 0.00, 2500.00),
(3, 2, 2, 1, 5200.00, 5.00, 4940.00),
(4, 2, 12, 1, 15000.00, 10.00, 13500.00),
(5, 3, 3, 2, 4800.00, 0.00, 9600.00),
(6, 3, 13, 1, 18500.00, 15.00, 15725.00),
(7, 4, 4, 1, 4300.00, 0.00, 4300.00),
(8, 4, 14, 1, 12500.00, 10.00, 11250.00),
(9, 5, 5, 2, 5500.00, 5.00, 10450.00),
(10, 5, 15, 1, 14500.00, 15.00, 12325.00),
(11, 6, 6, 1, 4200.00, 0.00, 4200.00),
(12, 6, 16, 2, 3500.00, 10.00, 6300.00),
(13, 7, 7, 1, 3800.00, 0.00, 3800.00),
(14, 7, 17, 1, 16500.00, 15.00, 14025.00),
(15, 8, 8, 1, 6500.00, 5.00, 6175.00),
(16, 8, 18, 1, 11000.00, 10.00, 9900.00),
(17, 9, 9, 2, 5100.00, 0.00, 10200.00),
(18, 9, 19, 3, 1800.00, 15.00, 4590.00),
(19, 10, 10, 1, 7200.00, 5.00, 6840.00),
(20, 10, 20, 1, 17500.00, 10.00, 15750.00);

-- Update PERSON table with dates from 2021-2025
INSERT INTO PERSON (person_id, first_name, last_name, phone, email, address) VALUES
(21, 'Rahul', 'Patel', '+94713456782', 'rahul.patel@email.com', '120 Green Ave, Colombo 4'),
(22, 'Nimali', 'Fernando', '+94723456783', 'nimali.fernando@email.com', '45 Palm Grove, Dehiwala'),
(23, 'Ahmed', 'Hassan', '+94733456784', 'ahmed.hassan@email.com', '67 Lake View Rd, Kandy'),
(24, 'Fathima', 'Zahra', '+94743456785', 'fathima.zahra@email.com', '89 Ocean Drive, Galle'),
(25, 'Lakshman', 'Perera', '+94753456786', 'lakshman.perera@email.com', '34 Temple Road, Matara'),
(26, 'Priya', 'Mendis', '+94763456787', 'priya.mendis@email.com', '56 Beach Lane, Negombo'),
(27, 'Ashan', 'Silva', '+94773456788', 'ashan.silva@email.com', '78 Mountain View, Nuwara Eliya'),
(28, 'Dinuka', 'Gunasekara', '+94783456789', 'dinuka.g@email.com', '91 Valley Road, Kandy'),
(29, 'Chamari', 'Jayasinghe', '+94793456790', 'chamari.j@email.com', '23 Lake Drive, Kurunegala'),
(30, 'Malith', 'Cooray', '+94703456791', 'malith.c@email.com', '45 River Street, Anuradhapura'),
(31, 'Sachini', 'Weerasinghe', '+94713456792', 'sachini.w@email.com', '67 Hill Road, Badulla'),
(32, 'Hiruni', 'Bandara', '+94723456793', 'hiruni.b@email.com', '89 Forest Avenue, Ratnapura'),
(33, 'Kavinda', 'Rajapaksa', '+94733456794', 'kavinda.r@email.com', '10 Sunset Boulevard, Jaffna'),
(34, 'Dilini', 'Samaraweera', '+94743456795', 'dilini.s@email.com', '32 Sunrise Lane, Gampaha'),
(35, 'Nuwan', 'Herath', '+94753456796', 'nuwan.h@email.com', '54 Cloud Street, Matale');

-- Insert additional STORE records
INSERT INTO STORE (store_id, store_name, address, city, phone, email, opening_date, square_footage) VALUES
(11, 'Senuhas Colour Mart - Gampaha', '45 Main Road', 'Gampaha', '+94112345688', 'gampaha@senuhas.com', '2022-08-15', 2300.00),
(12, 'Senuhas Colour Mart - Kandy', '78 Temple Road', 'Kandy', '+94812345689', 'kandy@senuhas.com', '2023-03-22', 2700.00),
(13, 'Senuhas Colour Mart - Galle', '112 Marine Drive', 'Galle', '+94912345680', 'galle@senuhas.com', '2023-09-05', 2400.00),
(14, 'Senuhas Colour Mart - Jaffna', '23 Hospital Road', 'Jaffna', '+94212345681', 'jaffna@senuhas.com', '2024-01-18', 2200.00),
(15, 'Senuhas Colour Mart - Anuradhapura', '56 Kings Street', 'Anuradhapura', '+94252345682', 'anuradhapura@senuhas.com', '2024-04-30', 2500.00);

-- Insert additional EMPLOYEE records with dates from 2021-2025
INSERT INTO EMPLOYEE (employee_id, person_id, hire_date, position, salary, store_id, manager_id) VALUES
(21, 21, '2021-08-15', 'Store Manager', 125000.00, 11, 1),
(22, 22, '2021-09-01', 'Sales Associate', 68000.00, 11, 21),
(23, 23, '2021-09-15', 'Sales Associate', 68000.00, 11, 21),
(24, 24, '2021-10-01', 'Inventory Specialist', 72000.00, 11, 21),
(25, 25, '2022-01-15', 'Marketing Coordinator', 85000.00, 1, 2),
(26, 26, '2022-02-01', 'Assistant Manager', 95000.00, 2, 3),
(27, 27, '2022-03-01', 'Assistant Manager', 95000.00, 3, 4),
(28, 28, '2022-08-20', 'Store Manager', 125000.00, 12, 1),
(29, 29, '2022-09-05', 'Sales Associate', 70000.00, 12, 28),
(30, 30, '2022-09-20', 'Sales Associate', 70000.00, 12, 28),
(31, 31, '2023-03-25', 'Store Manager', 125000.00, 13, 1),
(32, 32, '2023-04-10', 'Sales Associate', 72000.00, 13, 31),
(33, 33, '2023-04-25', 'Inventory Specialist', 75000.00, 13, 31),
(34, 34, '2023-09-10', 'Store Manager', 125000.00, 14, 1),
(35, 35, '2023-09-25', 'Sales Associate', 72000.00, 14, 34);

-- Update STORE table with new manager_ids for new stores
UPDATE STORE SET manager_id = 21 WHERE store_id = 11;
UPDATE STORE SET manager_id = 28 WHERE store_id = 12;
UPDATE STORE SET manager_id = 31 WHERE store_id = 13;
UPDATE STORE SET manager_id = 34 WHERE store_id = 14;
-- Store 15 (Anuradhapura) does not have a manager assigned from the EMPLOYEES yet in this data.

-- Insert additional MANAGER records
INSERT INTO MANAGER (employee_id, promotion_date, bonus_rate, management_level) VALUES
(21, '2021-08-15', 15.00, 'Senior'),
(28, '2022-08-20', 15.00, 'Senior'),
(31, '2023-03-25', 15.00, 'Senior'),
(34, '2023-09-10', 15.00, 'Senior'),
(25, '2023-06-15', 10.00, 'Junior'), -- Marketing Coordinator as Junior Manager
(26, '2023-01-01', 10.00, 'Junior'), -- Assistant Manager as Junior Manager
(27, '2023-03-01', 10.00, 'Junior'); -- Assistant Manager as Junior Manager

-- Insert additional SALES_STAFF records
INSERT INTO SALES_STAFF (employee_id, commission_rate, sales_target) VALUES
(22, 6.00, 520000.00),
(23, 6.00, 520000.00),
(29, 6.00, 540000.00),
(30, 6.00, 540000.00),
(32, 6.50, 550000.00),
(35, 6.50, 550000.00);

-- Insert additional CUSTOMER records with dates from 2021-2025
INSERT INTO CUSTOMER (customer_id, person_id, registration_date, loyalty_points, customer_type, credit_limit) VALUES
(16, 16, '2021-08-10', 2500, 'Retail', NULL),
(17, 17, '2021-09-15', 1800, 'Retail', NULL),
(18, 18, '2021-11-20', 3200, 'Retail', NULL),
(19, 19, '2022-01-05', 1500, 'Wholesale', 550000.00),
(20, 20, '2022-03-22', 0, 'Wholesale', 650000.00),
(21, 21, '2022-06-14', 4500, 'Retail', NULL),
(22, 22, '2022-08-30', 2200, 'Retail', NULL),
(23, 23, '2022-10-18', 1700, 'Retail', NULL),
(24, 24, '2023-01-05', 3800, 'Retail', NULL),
(25, 25, '2023-03-20', 0, 'Wholesale', 700000.00),
(26, 26, '2023-05-12', 5500, 'Retail', NULL),
(27, 27, '2023-07-03', 2800, 'Retail', NULL),
(28, 28, '2023-09-17', 3600, 'Retail', NULL),
(29, 29, '2023-11-22', 0, 'Wholesale', 850000.00),
(30, 30, '2024-01-08', 1300, 'Retail', NULL),
(31, 31, '2024-02-15', 2700, 'Retail', NULL),
(32, 32, '2024-03-20', 0, 'Wholesale', 950000.00),
(33, 33, '2024-04-08', 800, 'Retail', NULL),
(34, 34, '2024-04-25', 1200, 'Retail', NULL),
(35, 35, '2025-01-08', 300, 'Retail', NULL);

-- Insert additional RETAIL_CUSTOMER records
INSERT INTO RETAIL_CUSTOMER (customer_id, frequency_visit) VALUES
(16, 14),
(17, 9),
(18, 20),
(21, 25),
(22, 12),
(23, 8),
(24, 18),
(26, 30),
(27, 15),
(28, 22),
(30, 7),
(31, 13),
(33, 4),
(34, 6),
(35, 2);

-- Insert additional WHOLESALE_CUSTOMER records
INSERT INTO WHOLESALE_CUSTOMER (customer_id, discount_rate, credit_limit, business_name, tax_id) VALUES
(19, 11.00, 550000.00, 'Green Construction', 'TAX654321'),
(20, 12.50, 650000.00, 'Prime Developers', 'TAX765432'),
(25, 13.00, 700000.00, 'Superior Contractors', 'TAX876543'),
(29, 14.00, 850000.00, 'Island Builders', 'TAX987654'),
(32, 15.00, 950000.00, 'Modern Interiors', 'TAX098765');

-- Insert additional SUPPLIER records with dates from 2021-2025
INSERT INTO SUPPLIER (supplier_id, company_name, contact_name, phone, email, address, city, payment_terms, lead_time_days, registration_date, credit_limit, status) VALUES
(13, 'Sri Lanka Hardware', 'Nimal Perera', '+94112345690', 'nimal@slhw.lk', '101 Industrial Zone', 'Colombo', 'Net 30', 7, '2021-09-10', 2500000.00, 'Active'),
(14, 'Ceylon Tools', 'Saman Silva', '+94112345691', 'saman@ceylontools.lk', '202 Trade Center', 'Colombo', 'Net 30', 5, '2021-10-15', 2000000.00, 'Active'),
(15, 'Lanka Paints', 'Kumari Fernando', '+94112345692', 'kumari@lankapaints.lk', '303 Manufacturing Hub', 'Gampaha', 'Net 45', 10, '2021-12-05', 3000000.00, 'Active'),
(16, 'Island Traders', 'Asif Khan', '+94112345693', 'asif@islandtraders.lk', '404 Export Zone', 'Colombo', 'Net 60', 14, '2022-02-18', 4000000.00, 'Active'),
(17, 'Quality Hardware', 'David Chang', '+94112345694', 'david@qualityhw.lk', '505 Industrial Park', 'Kandy', 'Net 30', 7, '2022-05-20', 2200000.00, 'Active'),
(18, 'Modern Paints', 'Priyanka Gupta', '+94112345695', 'priyanka@modernpaints.lk', '606 Business Park', 'Galle', 'Net 45', 12, '2022-08-10', 2800000.00, 'Active'),
(19, 'Global Supplies', 'Robert Kim', '+94112345696', 'robert@globalsup.lk', '707 Trade Zone', 'Colombo', 'Net 30', 10, '2022-11-15', 3500000.00, 'Active'),
(20, 'Tech Tools', 'Nayana Jayawardena', '+94112345697', 'nayana@techtools.lk', '808 Tech Park', 'Colombo', 'Net 30', 7, '2023-02-20', 2700000.00, 'Active'),
(21, 'Premier Hardware', 'Abdul Rahman', '+94112345698', 'abdul@premierhw.lk', '909 Commercial Zone', 'Jaffna', 'Net 45', 14, '2023-05-12', 3200000.00, 'Active'),
(22, 'Eco Paints', 'Lisa Wong', '+94112345699', 'lisa@ecopaints.lk', '111 Green Zone', 'Colombo', 'Net 30', 10, '2023-08-05', 2900000.00, 'Active');

-- Insert additional PRODUCT records
INSERT INTO PRODUCT (product_id, product_name, description, unit_price, unit_measure, category_id, supplier_id, reorder_level, reorder_quantity, manufacturer, barcode, status) VALUES
(21, 'Lanka Paints Interior Emulsion', 'Premium interior wall paint', 4700.00, 'Liter', 11, 15, 25, 60, 'Lanka Paints', 'LP001122334455', 'Active'),
(22, 'Quality Hardware Hammer Set', 'Professional hammer set', 3500.00, 'Set', 6, 17, 20, 40, 'Quality Hardware', 'QH001122334455', 'Active'),
(23, 'Modern Paints Exterior Shield', 'Weather-resistant exterior paint', 5400.00, 'Liter', 4, 18, 20, 50, 'Modern Paints', 'MP001122334455', 'Active'),
(24, 'Tech Tools Drill Kit', 'Complete professional drill kit', 16000.00, 'Kit', 7, 20, 15, 30, 'Tech Tools', 'TT001122334455', 'Active'),
(25, 'Lanka Paints Waterproof Sealer', 'Premium waterproofing solution', 5800.00, 'Liter', 5, 15, 15, 30, 'Lanka Paints', 'LP002233445566', 'Active'),
(26, 'Eco Paints Non-toxic Paint', 'Environmental-friendly interior paint', 5200.00, 'Liter', 11, 22, 20, 40, 'Eco Paints', 'EP001122334455', 'Active'),
(27, 'Global Supplies Plumbing Kit', 'Complete plumbing tools set', 8500.00, 'Kit', 9, 19, 10, 20, 'Global Supplies', 'GS001122334455', 'Active'),
(28, 'Premier Hardware Electrical Set', 'Professional electrical tools kit', 9200.00, 'Set', 10, 21, 10, 20, 'Premier Hardware', 'PH001122334455', 'Active'),
(29, 'Eco Paints Wood Finish', 'Premium wood stain and finish', 4200.00, 'Liter', 13, 22, 15, 30, 'Eco Paints', 'EP002233445566', 'Active'),
(30, 'Quality Hardware Gardening Set', 'Complete gardening tools', 7500.00, 'Set', 6, 17, 10, 20, 'Quality Hardware', 'QH002233445566', 'Active');

-- Additional PAINT_PRODUCT details for new products
INSERT INTO PAINT_PRODUCT (product_id, color_code, base_type, finish_type, coverage_area, volume, brand, application_method) VALUES
(21, 'LP-WH-001', 'Water', 'Matte', 125.00, 4.00, 'Lanka Paints', 'Brush, Roller'),
(23, 'MP-WH-001', 'Water', 'Satin', 105.00, 4.00, 'Modern Paints', 'Brush, Roller, Spray'),
(25, 'LP-CL-001', 'Solvent', 'Gloss', 70.00, 1.00, 'Lanka Paints', 'Brush'),
(26, 'EP-GR-001', 'Water', 'Eggshell', 110.00, 3.78, 'Eco Paints', 'Brush, Roller'),
(29, 'EP-BR-001', 'Oil', 'Satin', 85.00, 1.00, 'Eco Paints', 'Brush, Spray');

-- Additional HARDWARE_PRODUCT details for new products
INSERT INTO HARDWARE_PRODUCT (product_id, material, dimensions, weight, brand, warranty_period) VALUES
(22, 'Steel/Wood', 'Various', 2.50, 'Quality Hardware', '2 years'),
(24, 'Metal/Plastic', '40 x 30 x 15 cm', 5.50, 'Tech Tools', '3 years'),
(27, 'Mixed', 'Various', 4.00, 'Global Supplies', '1 year'),
(28, 'Mixed', 'Various', 3.50, 'Premier Hardware', '1 year'),
(30, 'Metal/Plastic', 'Various', 3.00, 'Quality Hardware', '1 year');


-- Insert additional INVENTORY records with dates from 2021-2025
INSERT INTO INVENTORY (inventory_id, store_id, product_id, quantity, last_updated, shelf_location, expiry_date) VALUES
(31, 11, 21, 50, '2021-09-15', 'A2-01', '2023-09-15'),
(32, 11, 22, 30, '2021-09-15', 'B2-01', NULL),
(33, 11, 23, 45, '2021-09-15', 'A2-02', '2023-09-15'),
(34, 12, 24, 25, '2022-09-25', 'B2-02', NULL),
(35, 12, 25, 35, '2022-09-25', 'A2-03', '2024-09-25'),
(36, 12, 26, 40, '2022-09-25', 'A2-04', '2024-09-25'),
(37, 13, 27, 20, '2023-04-30', 'B2-03', NULL),
(38, 13, 28, 15, '2023-04-30', 'B2-04', NULL),
(39, 13, 29, 30, '2023-04-30', 'A2-05', '2025-04-30'),
(40, 14, 30, 25, '2023-10-10', 'A2-06', '2025-10-10'),
(41, 1, 21, 45, '2024-01-15', 'A2-01', '2026-01-15'),
(42, 1, 25, 30, '2024-01-15', 'A2-03', '2026-01-15'),
(43, 2, 22, 25, '2024-01-16', 'B2-01', NULL),
(44, 2, 26, 35, '2024-01-16', 'A2-04', '2026-01-16'),
(45, 3, 23, 40, '2024-01-17', 'A2-02', '2026-01-17'),
(46, 3, 27, 15, '2024-01-17', 'B2-03', NULL),
(47, 4, 24, 20, '2024-01-18', 'B2-02', NULL),
(48, 4, 28, 10, '2024-01-18', 'B2-04', NULL),
(49, 5, 29, 25, '2024-01-19', 'A2-05', '2026-01-19'),
(50, 5, 30, 20, '2024-01-19', 'A2-06', '2026-01-19');

-- Insert additional PURCHASE_ORDER records with dates from 2021-2025
INSERT INTO PURCHASE_ORDER (po_id, supplier_id, store_id, employee_id, order_date, expected_delivery_date, status, total_amount, payment_status) VALUES
(15, 13, 11, 21, '2021-08-25', '2021-09-10', 'Received', 235000.00, 'Paid'),
(16, 14, 11, 21, '2021-10-06', '2021-10-20', 'Received', 105000.00, 'Paid'),
(17, 15, 12, 28, '2022-09-07', '2022-09-22', 'Received', 211500.00, 'Paid'),
(18, 16, 12, 28, '2022-11-08', '2022-11-23', 'Received', 256000.00, 'Paid'),
(19, 17, 13, 31, '2023-04-09', '2023-04-24', 'Received', 175000.00, 'Paid'),
(20, 18, 13, 31, '2023-06-10', '2023-06-25', 'Received', 270000.00, 'Paid'),
(21, 19, 14, 34, '2023-10-11', '2023-10-26', 'Received', 170000.00, 'Paid'),
(22, 20, 14, 34, '2023-12-12', '2023-12-27', 'Received', 138000.00, 'Paid'),
(23, 21, 1, 2, '2024-02-13', '2024-02-28', 'Received', 276000.00, 'Paid'),
(24, 22, 2, 3, '2024-03-14', '2024-03-29', 'Received', 260000.00, 'Paid'),
(25, 13, 3, 4, '2024-04-05', '2024-04-20', 'Pending', 235000.00, 'Unpaid'),
(26, 15, 4, 5, '2024-04-10', '2024-04-25', 'Pending', 232000.00, 'Unpaid'),
(27, 17, 5, 6, '2024-04-15', '2024-04-30', 'Pending', 175000.00, 'Unpaid');

-- Insert additional PO_DETAIL records
INSERT INTO PO_DETAIL (po_detail_id, po_id, product_id, quantity, unit_price, expected_delivery) VALUES
(15, 15, 21, 50, 4700.00, '2021-09-10'),
(16, 16, 22, 30, 3500.00, '2021-10-20'),
(17, 17, 23, 45, 4700.00, '2022-09-22'), -- Note: Price of Lanka Paint Emulsion seems to be used for Modern Paint (Product 23)
(18, 18, 24, 16, 16000.00, '2022-11-23'),
(19, 19, 22, 50, 3500.00, '2023-04-24'),
(20, 20, 23, 50, 5400.00, '2023-06-25'),
(21, 21, 27, 20, 8500.00, '2023-10-26'),
(22, 22, 28, 15, 9200.00, '2023-12-27'),
(23, 23, 29, 30, 4200.00, '2024-02-28'), -- This po_id (23) corresponds to supplier 21 (Premier Hardware) but product 29 is Eco Paints. Mismatch?
(24, 24, 30, 25, 7500.00, '2024-03-29'), -- This po_id (24) corresponds to supplier 22 (Eco Paints) but product 30 is Quality Hardware. Mismatch?
(25, 25, 21, 50, 4700.00, '2024-04-20'),
(26, 26, 25, 40, 5800.00, '2024-04-25'),
(27, 27, 22, 50, 3500.00, '2024-04-30');
-- For real data, PO_DETAIL.product_id should be from PO.supplier_id. Assuming for mock data this is acceptable.

-- Insert additional SALES_TRANSACTION records with dates from 2021-2025
INSERT INTO SALES_TRANSACTION (transaction_id, store_id, customer_id, employee_id, transaction_date, subtotal, tax_amount, discount_amount, total_amount, payment_method, invoice_number) VALUES
(16, 11, 16, 22, '2021-09-01 10:15:00', 9400.00, 1128.00, 0.00, 10528.00, 'Cash', 'INV-2021-0001'),
(17, 11, 17, 23, '2021-10-02 11:30:00', 7000.00, 840.00, 0.00, 7840.00, 'Credit Card', 'INV-2021-0002'),
(18, 11, 19, 22, '2021-11-03 14:45:00', 47000.00, 5640.00, 5170.00, 47470.00, 'Check', 'INV-2021-0003'),
(19, 12, 18, 29, '2022-10-04 16:20:00', 5400.00, 648.00, 0.00, 6048.00, 'Debit Card', 'INV-2022-0001'),
(20, 12, 20, 30, '2022-11-05 09:10:00', 80000.00, 9600.00, 10000.00, 79600.00, 'Credit Card', 'INV-2022-0002'),
(21, 12, 21, 29, '2022-12-06 13:25:00', 9400.00, 1128.00, 0.00, 10528.00, 'Cash', 'INV-2022-0003'),
(22, 13, 24, 32, '2023-05-07 15:40:00', 10800.00, 1296.00, 0.00, 12096.00, 'Debit Card', 'INV-2023-0001'),
(23, 13, 25, 32, '2023-06-08 10:55:00', 42500.00, 5100.00, 5525.00, 42075.00, 'Check', 'INV-2023-0002'),
(24, 13, 26, 32, '2023-07-09 12:15:00', 16000.00, 1920.00, 0.00, 17920.00, 'Credit Card', 'INV-2023-0003'),
(25, 14, 29, 35, '2023-12-10 14:30:00', 55200.00, 6624.00, 7728.00, 54096.00, 'Check', 'INV-2023-0004'),
(26, 14, 30, 35, '2024-01-11 16:45:00', 9200.00, 1104.00, 0.00, 10304.00, 'Cash', 'INV-2024-0016'),
(27, 14, 31, 35, '2024-02-12 09:20:00', 7500.00, 900.00, 0.00, 8400.00, 'Credit Card', 'INV-2024-0017'),
(28, 1, 32, 12, '2024-03-13 11:35:00', 47000.00, 5640.00, 7050.00, 45590.00, 'Check', 'INV-2024-0018'),
(29, 1, 33, 12, '2024-04-14 13:50:00', 5800.00, 696.00, 0.00, 6496.00, 'Cash', 'INV-2024-0019'),
(30, 1, 34, 13, '2024-04-25 13:50:00', 4200.00, 504.00, 0.00, 4704.00, 'Debit Card', 'INV-2024-0020');

-- Insert additional SALES_DETAIL records
INSERT INTO SALES_DETAIL (sales_detail_id, transaction_id, product_id, quantity, unit_price, discount, warranty_period) VALUES
(16, 16, 21, 2, 4700.00, 0.00, NULL),
(17, 17, 22, 2, 3500.00, 0.00, '1 year'),
(18, 18, 21, 10, 4700.00, 11.00, NULL),
(19, 19, 23, 1, 5400.00, 0.00, NULL),
(20, 20, 24, 5, 16000.00, 12.50, '2 years'),
(21, 21, 21, 2, 4700.00, 0.00, NULL),
(22, 22, 23, 2, 5400.00, 0.00, NULL),
(23, 23, 27, 5, 8500.00, 13.00, '1 year'),
(24, 24, 24, 1, 16000.00, 0.00, '2 years'),
(25, 25, 28, 6, 9200.00, 14.00, '1 year'),
(26, 26, 28, 1, 9200.00, 0.00, '1 year'),
(27, 27, 30, 1, 7500.00, 0.00, '1 year'),
(28, 28, 21, 10, 4700.00, 15.00, NULL),
(29, 29, 25, 1, 5800.00, 0.00, NULL),
(30, 30, 29, 1, 4200.00, 0.00, NULL);

-- Insert additional PAYMENT records with dates from 2021-2025
INSERT INTO PAYMENT (payment_id, transaction_id, payment_date, amount, payment_method, payment_status, reference_number) VALUES
(16, 16, '2021-09-01 10:20:00', 10528.00, 'Cash', 'Completed', NULL),
(17, 17, '2021-10-02 11:35:00', 7840.00, 'Visa', 'Completed', 'VISA223456'),
(18, 18, '2021-11-03 14:50:00', 47470.00, 'Check', 'Completed', 'CHK123457'),
(19, 19, '2022-10-04 16:25:00', 6048.00, 'MasterCard', 'Completed', 'MC223456'),
(20, 20, '2022-11-05 09:15:00', 79600.00, 'Visa', 'Completed', 'VISA323456'),
(21, 21, '2022-12-06 13:30:00', 10528.00, 'Cash', 'Completed', NULL),
(22, 22, '2023-05-07 15:45:00', 12096.00, 'MasterCard', 'Completed', 'MC323456'),
(23, 23, '2023-06-08 11:00:00', 42075.00, 'Check', 'Completed', 'CHK223457'),
(24, 24, '2023-07-09 12:20:00', 17920.00, 'American Express', 'Completed', 'AMEX223456'),
(25, 25, '2023-12-10 14:35:00', 54096.00, 'Check', 'Completed', 'CHK323457'),
(26, 26, '2024-01-11 16:50:00', 10304.00, 'Cash', 'Completed', NULL),
(27, 27, '2024-02-12 09:25:00', 8400.00, 'Visa', 'Completed', 'VISA423456'),
(28, 28, '2024-03-13 11:40:00', 45590.00, 'Check', 'Completed', 'CHK423457'),
(29, 29, '2024-04-14 13:55:00', 6496.00, 'Cash', 'Completed', NULL),
(30, 30, '2024-04-25 13:55:00', 4704.00, 'MasterCard', 'Completed', 'MC423456');

-- Insert additional INVENTORY_TRANSFER records with dates from 2021-2025
INSERT INTO INVENTORY_TRANSFER (transfer_id, from_store_id, to_store_id, transfer_date, status, initiated_by, approved_by) VALUES
(11, 11, 1, '2021-10-10', 'Completed', 21, 1),
(12, 12, 2, '2022-11-15', 'Completed', 28, 1),
(13, 13, 3, '2023-06-10', 'Completed', 31, 1),
(14, 14, 4, '2023-12-15', 'Completed', 34, 1),
(15, 1, 11, '2024-01-20', 'Completed', 2, 1),
(16, 2, 12, '2024-02-01', 'Completed', 3, 1),
(17, 3, 13, '2024-03-05', 'Completed', 4, 1),
(18, 4, 14, '2024-04-01', 'Completed', 5, 1);

-- Insert additional TRANSFER_ITEM records
INSERT INTO TRANSFER_ITEM (transfer_item_id, transfer_id, product_id, quantity) VALUES
(21, 11, 21, 10),
(22, 11, 25, 5),
(23, 12, 22, 8),
(24, 12, 26, 10),
(25, 13, 23, 12),
(26, 13, 27, 5),
(27, 14, 24, 6),
(28, 14, 28, 4),
(29, 15, 21, 15),
(30, 15, 23, 10),
(31, 16, 22, 12),
(32, 16, 30, 8),
(33, 17, 25, 10),
(34, 17, 27, 6),
(35, 18, 26, 10),
(36, 18, 28, 5);

-- Insert additional PROMOTION records with dates from 2021-2025
INSERT INTO PROMOTION (promotion_id, promotion_name, description, start_date, end_date, discount_rate, category_id, min_purchase_qty, min_purchase_amount) VALUES
(11, 'Summer Paint Festival 2021', 'Special offers on all paint products', '2021-08-01', '2021-09-30', 20.00, 1, NULL, NULL),
(12, 'Hardware Clearance 2021', 'Year-end clearance on hardware items', '2021-11-01', '2021-12-31', 30.00, 2, NULL, NULL),
(13, 'New Year Special 2022', 'Kickstart your projects with special discounts', '2022-01-01', '2022-01-31', 15.00, NULL, NULL, 10000.00),
(14, 'Monsoon Ready 2022', 'Prepare your home for monsoon season', '2022-05-01', '2022-06-30', 12.50, 4, NULL, NULL),
(15, 'DIY Workshop Special 2022', 'Special offers for DIY enthusiasts', '2022-07-15', '2022-08-15', 25.00, 7, NULL, NULL),
(16, 'Festival Season 2022', 'Brighten up your home for festivals', '2022-10-01', '2022-11-15', 18.00, 3, NULL, NULL),
(17, 'Summer Renovation 2023', 'Renovate your home this summer', '2023-04-01', '2023-05-31', 22.00, NULL, NULL, 15000.00),
(18, 'Professional Tools Week 2023', 'Special discounts for professionals', '2023-07-10', '2023-07-20', 30.00, 7, NULL, NULL),
(19, 'Home Makeover 2023', 'Transform your living spaces', '2023-09-01', '2023-10-31', 15.00, 1, NULL, NULL),
(20, 'Year-End Sale 2023', 'Massive discounts across all categories', '2023-12-01', '2023-12-31', 25.00, NULL, NULL, NULL),
(21, 'New Arrivals Special 2024', 'Special introductory prices on new products', '2024-01-15', '2024-02-15', 10.00, NULL, NULL, NULL),
(22, 'Spring Colors 2024', 'Refresh your home with spring colors', '2024-03-01', '2024-04-30', 18.00, 3, NULL, NULL);

-- Insert additional PRODUCT_REVIEW records with dates from 2021-2025
INSERT INTO PRODUCT_REVIEW (review_id, product_id, customer_id, review_date, rating, comments) VALUES
(16, 21, 16, '2021-09-15', 5, 'Excellent coverage, very easy to apply. Will buy again.'),
(17, 22, 17, '2021-10-15', 4, 'Good quality hammers, comfortable grip. Wish they were a bit lighter.'),
(18, 23, 18, '2021-11-20', 5, 'Perfect for our exterior walls. Withstood heavy rain without issues.'),
(19, 24, 21, '2022-12-10', 5, 'Professional quality drill kit. All the accessories I needed were included.'),
(20, 25, 22, '2022-12-20', 4, 'Great waterproofing solution. Fixed our leaky basement completely.'),
(21, 26, 23, '2023-01-05', 5, 'Love that it has no harsh chemicals. Perfect for my kids room.'),
(22, 27, 24, '2023-05-15', 3, 'Good kit but missing some essential components. Had to buy separately.'),
(23, 28, 26, '2023-07-20', 4, 'Very comprehensive electrical tools kit. Good value for money.'),
(24, 29, 27, '2023-09-05', 5, 'Beautiful finish on our wooden furniture. Easy application and fast drying.'),
(25, 30, 28, '2023-11-10', 4, 'Good quality gardening set. The pruners are especially good.'),
(26, 21, 30, '2024-01-20', 4, 'Good paint but took an extra coat for full coverage.'),
(27, 22, 31, '2024-02-25', 5, 'Best hammers I have ever owned. Perfect weight and balance.'),
(28, 23, 33, '2024-04-05', 5, 'Our house looks amazing with this paint. Very durable.'),
(29, 24, 34, '2024-04-20', 4, 'Great drill kit for home use. Battery life could be better though.');

-- Insert additional ORDER_ITEM records
INSERT INTO ORDER_ITEM (order_item_id, order_id, product_id, quantity, unit_price, discount_percentage, line_total) VALUES
(21, 11, 21, 2, 4700.00, 0.00, 9400.00),
(22, 11, 25, 1, 5800.00, 5.00, 5510.00),
(23, 12, 22, 3, 3500.00, 10.00, 9450.00),
(24, 12, 29, 1, 4200.00, 0.00, 4200.00),
(25, 13, 23, 2, 5400.00, 5.00, 10260.00),
(26, 13, 27, 1, 8500.00, 10.00, 7650.00),
(27, 14, 24, 1, 16000.00, 15.00, 13600.00),
(28, 14, 28, 2, 9200.00, 10.00, 16560.00),
(29, 15, 26, 2, 5200.00, 0.00, 10400.00),
(30, 15, 30, 1, 7500.00, 5.00, 7125.00),
(31, 16, 21, 3, 4700.00, 10.00, 12690.00),
(32, 16, 22, 2, 3500.00, 5.00, 6650.00),
(33, 17, 23, 1, 5400.00, 0.00, 5400.00),
(34, 17, 24, 1, 16000.00, 15.00, 13600.00),
(35, 18, 25, 2, 5800.00, 10.00, 10440.00),
(36, 18, 26, 1, 5200.00, 5.00, 4940.00),
(37, 19, 27, 2, 8500.00, 15.00, 14450.00),
(38, 19, 28, 1, 9200.00, 10.00, 8280.00),
(39, 20, 29, 3, 4200.00, 0.00, 12600.00),
(40, 20, 30, 2, 7500.00, 10.00, 13500.00);

-- START OF ADDITIONAL MOCK DATA FOR NEW SALES AND TRANSACTIONS (Corrected for PAYMENT.CK_PAYMENT_METHOD)

-- Insert additional SALES_TRANSACTION records
-- Transaction IDs 31-38 are new here.
INSERT INTO SALES_TRANSACTION (transaction_id, store_id, customer_id, employee_id, transaction_date, subtotal, tax_amount, discount_amount, total_amount, payment_method, invoice_number) VALUES
(31, 1, 35, 12, '2024-05-10 10:00:00', 11500.00, 1380.00, 0.00, 12880.00, 'Cash', 'INV-2024-0021'),
(32, 2, 32, 14, '2024-05-15 14:30:00', 70000.00, 7140.00, 10500.00, 66640.00, 'Check', 'INV-2024-0022'),
(33, 11, 1, 22, '2024-06-01 09:15:00', 16500.00, 1980.00, 0.00, 18480.00, 'Credit Card', 'INV-2024-0023'),
(34, 13, 29, 32, '2024-06-20 11:00:00', 39000.00, 4024.80, 5460.00, 37564.80, 'Credit Card', 'INV-2024-0024'),
(35, 5, 10, 18, '2024-07-05 16:00:00', 33500.00, 3618.00, 3350.00, 33768.00, 'Debit Card', 'INV-2024-0025'),
(36, 7, 20, 20, '2024-07-15 10:30:00', 30000.00, 3150.00, 3750.00, 29400.00, 'Credit Card', 'INV-2024-0026'),
(37, 8, 25, 12, '2024-08-01 11:45:00', 44700.00, 4666.68, 5811.00, 43555.68, 'Credit Card', 'INV-2024-0027'),
(38, 10, 19, 13, '2024-08-20 15:00:00', 31900.00, 3406.92, 3509.00, 31797.92, 'Check', 'INV-2024-0028');

-- Insert additional SALES_DETAIL records
INSERT INTO SALES_DETAIL (sales_detail_id, transaction_id, product_id, quantity, unit_price, discount, warranty_period) VALUES
(31, 31, 1, 2, 4500.00, 0.00, NULL),
(32, 31, 11, 1, 2500.00, 0.00, '1 year'),
(33, 32, 23, 10, 5400.00, 15.00, NULL),
(34, 32, 24, 1, 16000.00, 15.00, '2 years'),
(35, 33, 5, 3, 5500.00, 0.00, NULL),
(36, 34, 12, 2, 15000.00, 14.00, '2 years'),
(37, 34, 19, 5, 1800.00, 14.00, '1 year'),
(38, 35, 26, 5, 5200.00, 10.00, NULL),
(39, 35, 30, 1, 7500.00, 10.00, '1 year'),
(40, 36, 7, 5, 3800.00, 12.50, NULL),
(41, 36, 18, 1, 11000.00, 12.50, '2 years'),
(42, 37, 21, 6, 4700.00, 13.00, NULL),
(43, 37, 17, 1, 16500.00, 13.00, '2 years'),
(44, 38, 10, 2, 7200.00, 11.00, NULL),
(45, 38, 20, 1, 17500.00, 11.00, '2 years');

-- Insert additional PAYMENT records
INSERT INTO PAYMENT (payment_id, transaction_id, payment_date, amount, payment_method, payment_status, reference_number) VALUES
(31, 31, '2024-05-10 10:05:00', 12880.00, 'Cash', 'Completed', NULL),
(32, 32, '2024-05-15 14:35:00', 66640.00, 'Check', 'Completed', 'CHK005678'),
(33, 33, '2024-06-01 09:20:00', 18480.00, 'Visa', 'Completed', 'VISA523456'),
(34, 34, '2024-06-20 11:05:00', 37564.80, 'MasterCard', 'Completed', 'MC523456'),
(35, 35, '2024-07-05 16:05:00', 33768.00, 'Visa', 'Completed', 'DC523456'), -- Corrected from 'Debit Card' for PAYMENT table constraint
(36, 36, '2024-07-15 10:35:00', 29400.00, 'Visa', 'Completed', 'VISA623456'),
(37, 37, '2024-08-01 11:50:00', 43555.68, 'MasterCard', 'Completed', 'MC623456'),
(38, 38, '2024-08-20 15:05:00', 31797.92, 'Check', 'Completed', 'CHK006789');

-- Insert additional ORDER_ITEM records
INSERT INTO ORDER_ITEM (order_item_id, order_id, product_id, quantity, unit_price, discount_percentage, line_total) VALUES
(41, 21, 1, 3, 4500.00, 0.00, 13500.00),
(42, 21, 11, 2, 2500.00, 5.00, 4750.00),
(43, 22, 23, 5, 5400.00, 10.00, 24300.00),
(44, 22, 24, 1, 16000.00, 15.00, 13600.00),
(45, 23, 5, 4, 5500.00, 0.00, 22000.00),
(46, 23, 12, 1, 15000.00, 5.00, 14250.00),
(47, 24, 2, 2, 5200.00, 0.00, 10400.00),
(48, 24, 16, 3, 3500.00, 10.00, 9450.00);

-- CONTINUATION OF MOCK DATA

-- Insert more PERSON records
INSERT INTO PERSON (person_id, first_name, last_name, phone, email, address) VALUES
(36, 'Suresh', 'Kumar', '+94761122334', 'suresh.kumar@email.com', '10 Park Lane, Colombo 3'),
(37, 'Anusha', 'Rajapakse', '+94772233445', 'anusha.r@email.com', '25 Flower Road, Kotte'),
(38, 'Bhanuka', 'Silva', '+94713344556', 'bhanuka.s@email.com', '30 Hill Crest, Bandarawela'),
(39, 'Ishani', 'Perumal', '+94724455667', 'ishani.p@email.com', '45 Beach Walk, Unawatuna'),
(40, 'Ramesh', 'Govindan', '+94755566778', 'ramesh.g@email.com', '50 Temple Street, Vavuniya');

-- Insert more STORE records (if any new ones were needed, but we have 15 already)
-- Let's assume Store 15 (Anuradhapura) needs a manager.

-- Insert more EMPLOYEE records
-- Manager for Store 15 (Anuradhapura)
INSERT INTO EMPLOYEE (employee_id, person_id, hire_date, position, salary, store_id, manager_id) VALUES
(36, 36, '2024-04-25', 'Store Manager', 125000.00, 15, 1),
-- Staff for newer stores
(37, 37, '2024-02-01', 'Sales Associate', 70000.00, 14, 34), -- Jaffna store
(38, 38, '2024-05-01', 'Inventory Specialist', 73000.00, 15, 36), -- Anuradhapura store
(39, 39, '2024-05-10', 'Sales Associate', 69000.00, 15, 36), -- Anuradhapura store
(40, 40, '2023-10-01', 'Assistant Manager', 92000.00, 11, 21); -- Gampaha store (under existing manager)

-- Update STORE 15 with its new manager
UPDATE STORE SET manager_id = 36 WHERE store_id = 15;

-- Insert new MANAGER records
INSERT INTO MANAGER (employee_id, promotion_date, bonus_rate, management_level) VALUES
(36, '2024-04-25', 15.00, 'Senior'), -- New Store Manager for Anuradhapura
(40, '2024-07-01', 10.00, 'Junior'); -- Assistant Manager promoted to Junior Manager (hypothetical future promotion)

-- Insert new SALES_STAFF records
INSERT INTO SALES_STAFF (employee_id, commission_rate, sales_target) VALUES
(37, 6.50, 550000.00),
(39, 6.00, 530000.00);

-- Insert more CUSTOMER records
INSERT INTO CUSTOMER (customer_id, person_id, registration_date, loyalty_points, customer_type, credit_limit) VALUES
(36, 36, '2024-05-01', 100, 'Retail', NULL), -- Suresh Kumar
(37, 37, '2024-05-15', 0, 'Wholesale', 400000.00), -- Anusha Rajapakse
(38, 38, '2024-06-01', 50, 'Retail', NULL), -- Bhanuka Silva
(39, 39, '2024-06-10', 1200, 'Retail', NULL), -- Ishani Perumal (existing loyalty)
(40, 40, '2024-07-01', 0, 'Wholesale', 700000.00); -- Ramesh Govindan

-- Insert RETAIL_CUSTOMER details
INSERT INTO RETAIL_CUSTOMER (customer_id, frequency_visit) VALUES
(36, 1),
(38, 1),
(39, 5);

-- Insert WHOLESALE_CUSTOMER details
INSERT INTO WHOLESALE_CUSTOMER (customer_id, discount_rate, credit_limit, business_name, tax_id) VALUES
(37, 7.50, 400000.00, 'AR Constructions', 'TAXAR789012'),
(40, 11.50, 700000.00, 'Govindan Enterprises', 'TAXGE345678');

-- Insert new PRODUCT records (including seasonal and one to be discontinued)
INSERT INTO PRODUCT (product_id, product_name, description, unit_price, unit_measure, category_id, supplier_id, reorder_level, reorder_quantity, manufacturer, barcode, status) VALUES
(31, 'Monsoon Guard Paint', 'Special paint for heavy monsoon season', 6200.00, 'Liter', 4, 5, 10, 30, 'Jotun', 'JTMSN0012345', 'Seasonal'),
(32, 'Classic Oil Enamel', 'Old model oil-based enamel paint', 3500.00, 'Liter', 5, 1, 5, 0, 'Asian Paints', 'APOIL009876', 'Discontinued'),
(33, 'Advanced Putty Knife Set', 'Set of 3 flexible putty knives', 1200.00, 'Set', 6, 11, 15, 40, 'Local Hardware Supplies', 'LHSPS001122', 'Active'),
(34, 'Solar Reflective Coating', 'Cool roof paint, reflects sunlight', 7500.00, 'Liter', 4, 3, 10, 25, 'Nippon Paint', 'NPSLR003344', 'Active'),
(35, 'Heavy Duty Tarpaulin', 'Large waterproof tarpaulin 12x18ft', 4500.00, 'Each', 2, 13, 20, 50, 'Sri Lanka Hardware', 'SLHTRP005566', 'Active');

-- Insert PAINT_PRODUCT details for new paint products
INSERT INTO PAINT_PRODUCT (product_id, color_code, base_type, finish_type, coverage_area, volume, brand, application_method) VALUES
(31, 'JT-GR-MON', 'Special Polymer', 'Matte', 90.00, 4.00, 'Jotun', 'Brush, Roller'),
(32, 'AP-BL-OIL', 'Oil', 'Gloss', 100.00, 4.00, 'Asian Paints', 'Brush'),
(34, 'NP-WH-SOL', 'Water', 'Satin', 110.00, 4.00, 'Nippon Paint', 'Roller, Spray');

-- Insert HARDWARE_PRODUCT details for new hardware products
INSERT INTO HARDWARE_PRODUCT (product_id, material, dimensions, weight, brand, warranty_period) VALUES
(33, 'Stainless Steel/Plastic', 'Set of 3', 0.40, 'Local Hardware', '6 months'),
(35, 'Reinforced Polyethylene', '12ft x 18ft', 2.50, 'SLH', NULL);

-- Insert INVENTORY for new products and update some existing
INSERT INTO INVENTORY (inventory_id, store_id, product_id, quantity, last_updated, shelf_location, expiry_date) VALUES
-- Stocking new products in newer stores
(51, 15, 31, 15, '2024-06-01', 'S1-01', '2026-06-01'), -- Monsoon Paint in Anuradhapura
(52, 14, 33, 20, '2024-06-01', 'H1-05', NULL), -- Putty Knives in Jaffna
(53, 11, 34, 10, '2024-06-05', 'S1-02', '2026-06-05'), -- Solar Paint in Gampaha
(54, 12, 35, 25, '2024-06-05', 'H1-06', NULL), -- Tarpaulin in Kandy
(55, 1, 32, 8, '2024-06-10', 'D1-01', '2025-12-31'), -- Discontinued paint in Homagama (old stock)
-- Update stock for an existing product
(56, 7, 1, 50, '2024-06-15', 'A1-01', '2026-06-15'); -- Restock Asian Paints Emulsion in Battaramulla (existing inv_id 23 for product 1, store 6)
-- Use ON DUPLICATE KEY UPDATE for MySQL if inventory_id is not specified or if (store_id, product_id) exists
-- For simplicity here, assuming new inventory_id and these are new entries or we handle updates separately.
-- Example of an update (if inv_id 23 was store 6, product 1, we'd update it. New inv_id implies it's a different store/product combo)
-- Let's assume store_id 7, product_id 1 is a new combination not previously in inventory.

-- More PURCHASE_ORDER records
INSERT INTO PURCHASE_ORDER (po_id, supplier_id, store_id, employee_id, order_date, expected_delivery_date, status, total_amount, payment_status) VALUES
(28, 5, 15, 36, '2024-05-10', '2024-06-08', 'Received', 46500.00, 'Paid'), -- Order for Monsoon Paint for Anuradhapura
(29, 11, 14, 34, '2024-05-12', '2024-05-20', 'Received', 24000.00, 'Paid'), -- Order for Putty Knives for Jaffna
(30, 1, 1, 2, '2024-06-01', '2024-06-15', 'Cancelled', 90000.00, 'Unpaid'), -- A cancelled order
(31, 3, 11, 21, '2024-05-15', '2024-06-10', 'Received', 75000.00, 'Partial'), -- Order for Solar Paint for Gampaha, partial payment
(32, 13, 12, 28, '2024-05-18', '2024-06-12', 'Shipped', 112500.00, 'Paid'); -- Order for Tarpaulin for Kandy, status Shipped

-- PO_DETAIL for new purchase orders
INSERT INTO PO_DETAIL (po_detail_id, po_id, product_id, quantity, unit_price, expected_delivery) VALUES
(28, 28, 31, 15, 3100.00, '2024-06-08'), -- Jotun giving a discount for bulk
(29, 29, 33, 20, 1200.00, '2024-05-20'),
(30, 30, 1, 20, 4500.00, '2024-06-15'), -- For cancelled PO
(31, 31, 34, 10, 7500.00, '2024-06-10'),
(32, 32, 35, 25, 4500.00, '2024-06-12');

-- More SALES_TRANSACTION records
INSERT INTO SALES_TRANSACTION (transaction_id, store_id, customer_id, employee_id, transaction_date, subtotal, tax_amount, discount_amount, total_amount, payment_method, invoice_number) VALUES
(39, 15, 36, 39, '2024-06-10 11:00:00', 12400.00, 1488.00, 0.00, 13888.00, 'Cash', 'INV-2024-0029'), -- Sale of Monsoon paint in Anuradhapura
(40, 14, 37, 37, '2024-06-12 14:30:00', 4800.00, 576.00, 360.00, 5016.00, 'Credit Card', 'INV-2024-0030'), -- Sale of Putty knives in Jaffna to wholesale
(41, 1, 1, 12, '2024-06-15 10:00:00', 3500.00, 420.00, 0.00, 3920.00, 'Store Credit', 'INV-2024-0031'), -- Sale of Discontinued paint, paid with Store Credit
(42, 11, 39, 22, '2024-06-20 16:00:00', 7500.00, 900.00, 750.00, 7650.00, 'Debit Card', 'INV-2024-0032'); -- Sale of Solar paint, reflecting a 10% promotion (assume Loyalty Member Special is active for customer 39)

-- More SALES_DETAIL records
INSERT INTO SALES_DETAIL (sales_detail_id, transaction_id, product_id, quantity, unit_price, discount, warranty_period) VALUES
(46, 39, 31, 2, 6200.00, 0.00, NULL), -- Monsoon Paint
(47, 40, 33, 4, 1200.00, 7.50, '6 months'), -- Putty Knives, 7.5% wholesale discount for customer 37
(48, 41, 32, 1, 3500.00, 0.00, NULL), -- Discontinued Paint
(49, 42, 34, 1, 7500.00, 10.00, NULL); -- Solar Paint, 10% promo discount for customer 39 (loyalty)

-- More PAYMENT records
INSERT INTO PAYMENT (payment_id, transaction_id, payment_date, amount, payment_method, payment_status, reference_number) VALUES
(39, 39, '2024-06-10 11:05:00', 13888.00, 'Cash', 'Completed', NULL),
(40, 40, '2024-06-12 14:35:00', 5016.00, 'Visa', 'Completed', 'VISA723456'), -- Assuming CC was Visa
(41, 41, '2024-06-15 10:05:00', 3920.00, 'Store Credit', 'Completed', 'SC0000123'),
(42, 42, '2024-06-20 16:05:00', 7650.00, 'MasterCard', 'Completed', 'MC723456'); -- Assuming Debit Card was MC

-- More INVENTORY_TRANSFER records
INSERT INTO INVENTORY_TRANSFER (transfer_id, from_store_id, to_store_id, transfer_date, status, initiated_by, approved_by) VALUES
(19, 1, 11, '2024-07-01', 'In Transit', 2, 1); -- Transferring some popular items from Homagama to Gampaha

-- TRANSFER_ITEM for the new transfer
INSERT INTO TRANSFER_ITEM (transfer_item_id, transfer_id, product_id, quantity) VALUES
(37, 19, 1, 10), -- Asian Paints Premium Emulsion
(38, 19, 11, 5);  -- Stanley Hammer

-- New PROMOTION
INSERT INTO PROMOTION (promotion_id, promotion_name, description, start_date, end_date, discount_rate, category_id, min_purchase_qty, min_purchase_amount) VALUES
(23, 'Cool Summer Deals', 'Discounts on solar reflective paints and exterior coatings', '2024-06-15', '2024-07-31', 12.00, 4, NULL, 5000.00);

-- More PRODUCT_REVIEW records
INSERT INTO PRODUCT_REVIEW (review_id, product_id, customer_id, review_date, rating, comments) VALUES
(30, 31, 36, '2024-06-25', 5, 'Monsoon Guard is amazing! Kept my walls dry during the first heavy rain.'),
(31, 33, 37, '2024-06-28', 4, 'Good set of putty knives for the price. Flexible and sturdy.'),
(32, 34, 39, '2024-07-02', 5, 'Noticeable difference in room temperature after using the Solar Reflective paint. Excellent!'),
(33, 21, 1, '2024-07-05', 4, 'Still my go-to paint for interiors. Consistent quality.'); -- Repeat review by customer 1 for product 21 (update existing if UQ fails)
-- Note: UQ_REVIEW_PRODUCT_CUSTOMER (product_id, customer_id) means a customer can review a product only once.
-- To handle this, the above would be an UPDATE. For simplicity of INSERT, I'll assume this is a new review for a *different* product by cust 1, or a new customer.
-- Let's make it customer 38 reviewing product 21:
-- (33, 21, 38, '2024-07-05', 4, 'First time using Lanka Paints, quite good for the price.'),
-- If the intent was to update review_id=16 (21, 16), it's an UPDATE. For new entry:
INSERT INTO PRODUCT_REVIEW (review_id, product_id, customer_id, review_date, rating, comments) VALUES
(34, 21, 38, '2024-07-05', 4, 'First time using Lanka Paints, quite good for the price.');


-- More ORDER_ITEM records (order_id starting from 25)
INSERT INTO ORDER_ITEM (order_item_id, order_id, product_id, quantity, unit_price, discount_percentage, line_total) VALUES
(49, 25, 31, 2, 6200.00, 0.00, 12400.00), -- INV-2024-0029
(50, 26, 33, 4, 1200.00, 7.50, 4440.00), -- INV-2024-0030 (4800 * 0.925 = 4440)
(51, 27, 32, 1, 3500.00, 0.00, 3500.00), -- INV-2024-0031
(52, 28, 34, 1, 7500.00, 10.00, 6750.00); -- INV-2024-0032 (7500 * 0.9 = 6750)


-- Ensure Sales Detail line totals for discount match calculation (Subtotal - (Subtotal * Discount/100))
-- Example: sales_detail_id 47: product_id 33, quantity 4, unit_price 1200.00, discount 7.50
-- Line subtotal = 4 * 1200 = 4800. Discount amount = 4800 * 0.075 = 360. Line total = 4800 - 360 = 4440.
-- This matches the ORDER_ITEM (50, 26, 33, 4, 1200.00, 7.50, 4440.00) for transaction_id 40.

-- Correcting Sales Transaction 40 based on its details.
-- Original: (40, 14, 37, 37, '2024-06-12 14:30:00', 4800.00, 576.00, 360.00, 5016.00, 'Credit Card', 'INV-2024-0030')
-- Detail 47: product_id 33, qty 4, price 1200, disc 7.5%. Subtotal = 4*1200 = 4800. Discount = 4800*0.075 = 360.
-- Taxable amount = 4800 - 360 = 4440. Tax (assuming 12%) = 4440 * 0.12 = 532.80.
-- Total amount = 4440 + 532.80 = 4972.80.
-- So SALES_TRANSACTION 40 should be: subtotal 4800, tax_amount 532.80, discount_amount 360, total_amount 4972.80.
UPDATE SALES_TRANSACTION
SET subtotal = 4800.00, tax_amount = 532.80, discount_amount = 360.00, total_amount = 4972.80
WHERE transaction_id = 40;
-- And PAYMENT for transaction_id 40 should match 4972.80
UPDATE PAYMENT SET amount = 4972.80 WHERE transaction_id = 40 AND payment_id = 40;


-- Correcting Sales Transaction 42
-- Original: (42, 11, 39, 22, '2024-06-20 16:00:00', 7500.00, 900.00, 750.00, 7650.00, 'Debit Card', 'INV-2024-0032');
-- Detail 49: product_id 34, qty 1, price 7500, disc 10.00. Subtotal = 1*7500 = 7500. Discount = 7500*0.10 = 750.
-- Taxable amount = 7500 - 750 = 6750. Tax (12%) = 6750 * 0.12 = 810.
-- Total amount = 6750 + 810 = 7560.
-- So SALES_TRANSACTION 42 should be: subtotal 7500, tax_amount 810.00, discount_amount 750, total_amount 7560.00.
UPDATE SALES_TRANSACTION
SET subtotal = 7500.00, tax_amount = 810.00, discount_amount = 750.00, total_amount = 7560.00
WHERE transaction_id = 42;
-- And PAYMENT for transaction_id 42 should match 7560.00
UPDATE PAYMENT SET amount = 7560.00 WHERE transaction_id = 42 AND payment_id = 42;