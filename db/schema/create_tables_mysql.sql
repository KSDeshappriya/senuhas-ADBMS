-- SQL CREATE TABLE statements for Senuhas Colour Mart Database
-- MySQL syntax (converted from Microsoft SQL Server)

-- Create PERSON table
CREATE TABLE PERSON (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255) NOT NULL
);

-- Create STORE table
CREATE TABLE STORE (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    opening_date DATE NOT NULL,
    square_footage DECIMAL(8,2) NOT NULL,
    manager_id INT NULL
    -- Foreign key to EMPLOYEE added later due to circular reference
);

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    hire_date DATE NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    store_id INT NOT NULL,
    manager_id INT NULL,
    CONSTRAINT FK_EMPLOYEE_PERSON FOREIGN KEY (person_id) REFERENCES PERSON(person_id),
    CONSTRAINT FK_EMPLOYEE_STORE FOREIGN KEY (store_id) REFERENCES STORE(store_id),
    CONSTRAINT FK_EMPLOYEE_MANAGER FOREIGN KEY (manager_id) REFERENCES EMPLOYEE(employee_id)
);

-- Add foreign key to STORE table for manager_id
ALTER TABLE STORE
ADD CONSTRAINT FK_STORE_MANAGER FOREIGN KEY (manager_id) REFERENCES EMPLOYEE(employee_id);

-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    registration_date DATE NOT NULL,
    loyalty_points INT NOT NULL DEFAULT 0,
    customer_type VARCHAR(20) NOT NULL,
    credit_limit DECIMAL(10,2) NULL,
    CONSTRAINT FK_CUSTOMER_PERSON FOREIGN KEY (person_id) REFERENCES PERSON(person_id),
    CONSTRAINT CK_CUSTOMER_TYPE CHECK (customer_type IN ('Retail', 'Wholesale'))
);

-- Create RETAIL_CUSTOMER table
CREATE TABLE RETAIL_CUSTOMER (
    customer_id INT PRIMARY KEY,
    frequency_visit INT NULL,
    CONSTRAINT FK_RETAIL_CUSTOMER FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

-- Create WHOLESALE_CUSTOMER table
CREATE TABLE WHOLESALE_CUSTOMER (
    customer_id INT PRIMARY KEY,
    discount_rate DECIMAL(5,2) NOT NULL DEFAULT 0,
    credit_limit DECIMAL(12,2) NOT NULL,
    business_name VARCHAR(100) NOT NULL,
    tax_id VARCHAR(50) NOT NULL,
    CONSTRAINT FK_WHOLESALE_CUSTOMER FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    CONSTRAINT CK_WHOLESALE_DISCOUNT_RATE CHECK (discount_rate >= 0 AND discount_rate <= 100)
);

-- Create MANAGER table
CREATE TABLE MANAGER (
    employee_id INT PRIMARY KEY,
    promotion_date DATE NOT NULL,
    bonus_rate DECIMAL(5,2) NOT NULL,
    management_level VARCHAR(20) NOT NULL,
    CONSTRAINT FK_MANAGER_EMPLOYEE FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id),
    CONSTRAINT CK_MANAGER_BONUS_RATE CHECK (bonus_rate >= 0 AND bonus_rate <= 100),
    CONSTRAINT CK_MANAGEMENT_LEVEL CHECK (management_level IN ('Junior', 'Middle', 'Senior', 'Executive'))
);

-- Create SALES_STAFF table
CREATE TABLE SALES_STAFF (
    employee_id INT PRIMARY KEY,
    commission_rate DECIMAL(5,2) NOT NULL,
    sales_target DECIMAL(12,2) NOT NULL,
    CONSTRAINT FK_SALES_STAFF_EMPLOYEE FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id),
    CONSTRAINT CK_COMMISSION_RATE CHECK (commission_rate >= 0 AND commission_rate <= 100)
);

-- Create SUPPLIER table
CREATE TABLE SUPPLIER (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    payment_terms VARCHAR(50) NOT NULL,
    lead_time_days INT NOT NULL,
    registration_date DATE NOT NULL,
    credit_limit DECIMAL(12,2) NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Active',
    CONSTRAINT CK_SUPPLIER_STATUS CHECK (status IN ('Active', 'Inactive', 'On Hold'))
);

-- Create PRODUCT_CATEGORY table
CREATE TABLE PRODUCT_CATEGORY (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NULL,
    parent_category_id INT NULL,
    CONSTRAINT FK_CATEGORY_PARENT FOREIGN KEY (parent_category_id) REFERENCES PRODUCT_CATEGORY(category_id)
);

-- Create PRODUCT table
CREATE TABLE PRODUCT (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description VARCHAR(255) NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    unit_measure VARCHAR(20) NOT NULL,
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    reorder_level INT NOT NULL,
    reorder_quantity INT NOT NULL,
    manufacturer VARCHAR(100) NULL,
    barcode VARCHAR(50) UNIQUE,
    status VARCHAR(20) NOT NULL DEFAULT 'Active',
    CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY (category_id) REFERENCES PRODUCT_CATEGORY(category_id),
    CONSTRAINT FK_PRODUCT_SUPPLIER FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id),
    CONSTRAINT CK_PRODUCT_STATUS CHECK (status IN ('Active', 'Discontinued', 'Seasonal'))
);

-- Create PAINT_PRODUCT table
CREATE TABLE PAINT_PRODUCT (
    product_id INT PRIMARY KEY,
    color_code VARCHAR(20) NOT NULL,
    base_type VARCHAR(20) NOT NULL,
    finish_type VARCHAR(20) NOT NULL,
    coverage_area DECIMAL(8,2) NOT NULL,
    volume DECIMAL(8,2) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    application_method VARCHAR(50) NULL,
    CONSTRAINT FK_PAINT_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

-- Create HARDWARE_PRODUCT table
CREATE TABLE HARDWARE_PRODUCT (
    product_id INT PRIMARY KEY,
    material VARCHAR(50) NOT NULL,
    dimensions VARCHAR(50) NULL,
    weight DECIMAL(8,2) NULL,
    brand VARCHAR(50) NOT NULL,
    warranty_period VARCHAR(50) NULL,
    CONSTRAINT FK_HARDWARE_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

-- Create INVENTORY table
CREATE TABLE INVENTORY (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    last_updated DATE NOT NULL,
    shelf_location VARCHAR(50) NULL,
    expiry_date DATE NULL,
    CONSTRAINT FK_INVENTORY_STORE FOREIGN KEY (store_id) REFERENCES STORE(store_id),
    CONSTRAINT FK_INVENTORY_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    CONSTRAINT UQ_INVENTORY_STORE_PRODUCT UNIQUE (store_id, product_id)
);

-- Create PURCHASE_ORDER table
CREATE TABLE PURCHASE_ORDER (
    po_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    store_id INT NOT NULL,
    employee_id INT NOT NULL,
    order_date DATE NOT NULL,
    expected_delivery_date DATE NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    total_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    payment_status VARCHAR(20) NOT NULL DEFAULT 'Unpaid',
    CONSTRAINT FK_PO_SUPPLIER FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id),
    CONSTRAINT FK_PO_STORE FOREIGN KEY (store_id) REFERENCES STORE(store_id),
    CONSTRAINT FK_PO_EMPLOYEE FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id),
    CONSTRAINT CK_PO_STATUS CHECK (status IN ('Pending', 'Approved', 'Shipped', 'Received', 'Cancelled')),
    CONSTRAINT CK_PO_PAYMENT_STATUS CHECK (payment_status IN ('Unpaid', 'Partial', 'Paid'))
);

-- Create PO_DETAIL table
CREATE TABLE PO_DETAIL (
    po_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    po_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    expected_delivery DATE NULL,
    CONSTRAINT FK_PO_DETAIL_PO FOREIGN KEY (po_id) REFERENCES PURCHASE_ORDER(po_id),
    CONSTRAINT FK_PO_DETAIL_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    CONSTRAINT UQ_PO_DETAIL_PO_PRODUCT UNIQUE (po_id, product_id),
    CONSTRAINT CK_PO_DETAIL_QUANTITY CHECK (quantity > 0)
);

-- Create SALES_TRANSACTION table
CREATE TABLE SALES_TRANSACTION (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT NOT NULL,
    customer_id INT NULL,
    employee_id INT NOT NULL,
    transaction_date DATETIME NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
    tax_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    discount_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    total_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    payment_method VARCHAR(20) NOT NULL,
    invoice_number VARCHAR(50) UNIQUE,
    CONSTRAINT FK_SALES_STORE FOREIGN KEY (store_id) REFERENCES STORE(store_id),
    CONSTRAINT FK_SALES_CUSTOMER FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    CONSTRAINT FK_SALES_EMPLOYEE FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id),
    CONSTRAINT CK_SALES_PAYMENT_METHOD CHECK (payment_method IN ('Cash', 'Credit Card', 'Debit Card', 'Store Credit', 'Check'))
);

-- Create SALES_DETAIL table
CREATE TABLE SALES_DETAIL (
    sales_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(10,2) NOT NULL DEFAULT 0,
    warranty_period VARCHAR(50) NULL,
    CONSTRAINT FK_SALES_DETAIL_TRANSACTION FOREIGN KEY (transaction_id) REFERENCES SALES_TRANSACTION(transaction_id),
    CONSTRAINT FK_SALES_DETAIL_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    CONSTRAINT UQ_SALES_DETAIL_TRANSACTION_PRODUCT UNIQUE (transaction_id, product_id),
    CONSTRAINT CK_SALES_DETAIL_QUANTITY CHECK (quantity > 0)
);

-- Create PAYMENT table
CREATE TABLE PAYMENT (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    payment_date DATETIME NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    payment_status VARCHAR(20) NOT NULL DEFAULT 'Completed',
    reference_number VARCHAR(50) NULL,
    CONSTRAINT FK_PAYMENT_TRANSACTION FOREIGN KEY (transaction_id) REFERENCES SALES_TRANSACTION(transaction_id),
    CONSTRAINT CK_PAYMENT_AMOUNT CHECK (amount > 0),
    CONSTRAINT CK_PAYMENT_METHOD CHECK (payment_method IN ('Cash', 'Visa', 'MasterCard', 'American Express', 'Check', 'Store Credit')),
    CONSTRAINT CK_PAYMENT_STATUS CHECK (payment_status IN ('Completed', 'Pending', 'Failed', 'Refunded'))
);

-- Create INVENTORY_TRANSFER table
CREATE TABLE INVENTORY_TRANSFER (
    transfer_id INT AUTO_INCREMENT PRIMARY KEY,
    from_store_id INT NOT NULL,
    to_store_id INT NOT NULL,
    transfer_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    initiated_by INT NOT NULL,
    approved_by INT NULL,
    CONSTRAINT FK_TRANSFER_FROM_STORE FOREIGN KEY (from_store_id) REFERENCES STORE(store_id),
    CONSTRAINT FK_TRANSFER_TO_STORE FOREIGN KEY (to_store_id) REFERENCES STORE(store_id),
    CONSTRAINT FK_TRANSFER_INITIATED_BY FOREIGN KEY (initiated_by) REFERENCES EMPLOYEE(employee_id),
    CONSTRAINT FK_TRANSFER_APPROVED_BY FOREIGN KEY (approved_by) REFERENCES EMPLOYEE(employee_id),
    CONSTRAINT CK_TRANSFER_DIFFERENT_STORES CHECK (from_store_id <> to_store_id),
    CONSTRAINT CK_TRANSFER_STATUS CHECK (status IN ('Pending', 'In Transit', 'Completed', 'Cancelled'))
);

-- Create TRANSFER_ITEM table
CREATE TABLE TRANSFER_ITEM (
    transfer_item_id INT AUTO_INCREMENT PRIMARY KEY,
    transfer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT FK_TRANSFER_ITEM_TRANSFER FOREIGN KEY (transfer_id) REFERENCES INVENTORY_TRANSFER(transfer_id),
    CONSTRAINT FK_TRANSFER_ITEM_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    CONSTRAINT UQ_TRANSFER_ITEM_TRANSFER_PRODUCT UNIQUE (transfer_id, product_id),
    CONSTRAINT CK_TRANSFER_ITEM_QUANTITY CHECK (quantity > 0)
);

-- Create PROMOTION table
CREATE TABLE PROMOTION (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    promotion_name VARCHAR(100) NOT NULL,
    description VARCHAR(255) NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    discount_rate DECIMAL(5,2) NOT NULL,
    category_id INT NULL,
    min_purchase_qty INT NULL,
    min_purchase_amount DECIMAL(12,2) NULL,
    CONSTRAINT FK_PROMOTION_CATEGORY FOREIGN KEY (category_id) REFERENCES PRODUCT_CATEGORY(category_id),
    CONSTRAINT CK_PROMOTION_DATES CHECK (end_date >= start_date),
    CONSTRAINT CK_PROMOTION_DISCOUNT_RATE CHECK (discount_rate > 0 AND discount_rate <= 100)
);

-- Create PRODUCT_REVIEW table
CREATE TABLE PRODUCT_REVIEW (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    review_date DATE NOT NULL,
    rating INT NOT NULL,
    comments VARCHAR(500) NULL,
    CONSTRAINT FK_REVIEW_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    CONSTRAINT FK_REVIEW_CUSTOMER FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    CONSTRAINT UQ_REVIEW_PRODUCT_CUSTOMER UNIQUE (product_id, customer_id),
    CONSTRAINT CK_REVIEW_RATING CHECK (rating BETWEEN 1 AND 5)
);

-- Create ORDER_ITEM table
CREATE TABLE ORDER_ITEM (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount_percentage DECIMAL(5,2) NOT NULL DEFAULT 0,
    line_total DECIMAL(12,2) NOT NULL,
    CONSTRAINT FK_ORDER_ITEM_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    CONSTRAINT CK_ORDER_ITEM_QUANTITY CHECK (quantity > 0),
    CONSTRAINT CK_ORDER_ITEM_DISCOUNT CHECK (discount_percentage >= 0 AND discount_percentage <= 100)
);
