CREATE TABLE US_customers (
	CUSTOMERID CHAR(5) NOT NULL, 
	COMPANYNAME VARCHAR2(40) NOT NULL,
 	CONTACTFIRST VARCHAR2(15), 
	CONTACTLAST VARCHAR2(15), 
	CONTACTTITLE VARCHAR2(30), 
    	ADDRESS VARCHAR2(60),
	CITY VARCHAR2(15), 	
	REGION VARCHAR2(15),
 	POSTALCODE VARCHAR2(10), 
    	COUNTRY VARCHAR2(15), 
	PHONE VARCHAR2(24), 
	FAX VARCHAR2(24), 
    PRIMARY KEY(CUSTOMERID) USING INDEX  
    );

CREATE TABLE Non_us_Customers (
	CUSTOMERID CHAR(5) NOT NULL, 
	COMPANYNAME VARCHAR2(40) NOT NULL,
              CONTACTFIRST VARCHAR2(15), 
	CONTACTLAST VARCHAR2(15), 
	CONTACTTITLE VARCHAR2(30), 
    	ADDRESS VARCHAR2(60),
	CITY VARCHAR2(15), 	
	REGION VARCHAR2(15),
 	POSTALCODE VARCHAR2(10), 
    	COUNTRY VARCHAR2(15), 
	PHONE VARCHAR2(24), 
	FAX VARCHAR2(24), 
    PRIMARY KEY(CUSTOMERID) USING INDEX  
    );


CREATE TABLE Order_Details (
	ORDERID NUMBER(10) NOT NULL,
    	PRODUCTID NUMBER(10) NOT NULL, 
	UNITPRICE NUMBER(19, 4) NOT NULL, 
	QUANTITY NUMBER(5) NOT NULL, 
	DISCOUNT FLOAT(126) NOT NULL, 
        TOTAL NUMBER(19, 4),
 	PRIMARY KEY(ORDERID, PRODUCTID) USING INDEX  	
	);

CREATE TABLE Orders (
	ORDERID NUMBER(10) NOT NULL, 
    	CUSTOMERID CHAR(5 ), 
	EMPLOYEEID NUMBER(10), 
    	ORDERDATE DATE, 
	REQUIREDDATE DATE, 
	SHIPPEDDATE DATE, 
    	SHIPVIA NUMBER(10), 
	FREIGHT NUMBER(19, 4), 
	SHIPNAME VARCHAR2(40), 
	SHIPADDRESS VARCHAR2(60), 
	SHIPCITY VARCHAR2(15),
	SHIPREGION VARCHAR2(15),
    	SHIPPOSTALCODE VARCHAR2(10),
	SHIPCOUNTRY VARCHAR2(15), 
	SHIPPERNAME VARCHAR2(40), 
	PRIMARY KEY(ORDERID) USING INDEX  
	);

CREATE TABLE Products (
	PRODUCTID NUMBER(10) NOT NULL, 
	PRODUCTNAME VARCHAR2(40) NOT NULL, 
	SUPPLIERID NUMBER(10), 	
	CATEGORYID NUMBER(10), 
	QUANTITYPERUNIT VARCHAR2(20), 
	UNITPRICE NUMBER(19, 4), 
	UNITSINSTOCK NUMBER(5), 
	UNITSONORDER NUMBER(5), 
	REORDERLEVEL NUMBER(5),
   	DISCONTINUED VARCHAR2(8) NOT NULL,  
    PRIMARY KEY(PRODUCTID) USING INDEX  
    );
     
CREATE TABLE Products_HISTORY (
	PRODUCTID NUMBER(10) NOT NULL, 
	PRODUCTNAME VARCHAR2(40), 
	SUPPLIERID NUMBER(10), 	
	CATEGORYID NUMBER(10), 
	QUANTITYPERUNIT VARCHAR2(20), 
	UNITPRICE NUMBER(19, 4), 
	UNITSINSTOCK NUMBER(5), 
	UNITSONORDER NUMBER(5), 
	REORDERLEVEL NUMBER(5),
   	DISCONTINUED VARCHAR2(8),
	TRAN_TIME DATE,
              POST_TIME DATE,
	SOURCE_NODE VARCHAR2(20),
              OP_TYPE CHAR,
              BEFORE_AFTER_IND CHAR,
              USER_NAME VARCHAR2(20)
    );

CREATE TABLE Shippers (
	SHIPPERID NUMBER(10) NOT NULL, 
	SHIPPERNAME VARCHAR2(40) NOT NULL, 
    PRIMARY KEY(SHIPPERID) USING INDEX  
    );
     

insert into shippers (  ShipperID  , ShipperName)  values(1,'UPS');
insert into shippers (  ShipperID  , ShipperName)  values(2,'FedEx');
insert into shippers (  ShipperID  , ShipperName)  values(3,'U.S. Postal Service');
insert into shippers (  ShipperID  , ShipperName)  values(4,'DHL');


create or replace procedure sp_total(

  price in number,
  quantity in number, 
  discount in number,
  total out number) 
  
 as
 
 begin
 
    total := price * quantity * (1.0 - discount);
  
 end;
/

exit;
