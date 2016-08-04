
create database BenNotStallman
	on (name = BenNotStallman,
		filename = 'C:\Betadases\BenNotStallman.dbf')

log on
	(name = BenNotStallmen_log,
	fileName = 'C:\Betadases\BenNotStallman_log.ldf')

;

create table Customer
(
	customerID int Identity(1,1) primary key,
	custFName nvarchar(50),
	custLname nvarchar(50),
	custEmailAdd nvarchar(100),
	custStreet nvarchar(100),
	custCity nvarchar(70),
	custState char(2),
	custZip varchar(10),
	isCurrent bit,
	cutomerSince datetime not null
);

create table CustomerPassword
(
	customerId int primary key not null,
	passwordHash varchar(128) not null,
	passwordSalt varchar(10) not null,
	modifiedDate datetime not null,
);

alter table CustomerPassword
add constraint FK_customerID
	foreign key (customerID)
	references Customer(customerID);

create table Product
(
	productID int Identity(100000, 1) primary key not null,
	productNum nvarchar(20) not null,
	price money not null,
	prodWeight decimal(8,3) not null,
	color varchar(15) not null,
	shelf nvarchar(10) not null,
	bin tinyint not null,
	quantity smallint not null,
	productDesc nvarchar(400) null,
	productName nvarchar(100)
);

create table Sales
(
	orderNumber int Identity(100000, 1) primary key,
	customerID int not null,
	dateOrdered datetime not null,
	orderShipped bit,
);

alter table Sales
add constraint FK_Sales_customerID
	foreign key (customerID)
	references Customer(customerID);

create table SalesOrderLine
(
	salesOrderLineNumber tinyint not null,
	orderNumber int foreign key references Sales (orderNumber) not null,
	productID int foreign key references Product (productID) not null,
	quantityOrdered smallint not null,
	price money not null,
);

alter table SalesOrderLine
add primary key nonclustered (salesOrderLineNumber, orderNumber);

create table GamePlay
(
	customerID int primary key not null,
	winFlag bit null,
	timesWon smallint null,
	lastPlayed datetime null
);

alter table GamePlay
add constraint FK_GamePlay_customerID
	foreign key (customerID)
	references Customer(customerID);


--select customerID, lastPlayed
--from GamePlay
--where lastPlayed = GETDATE()
--;

create nonclustered index idk_customerIDlastPlyed
	on dbo.GamePlay
(
	customerID
	, lastPlayed ASC
);

--Select Customer.customerID, Customer.custFName, Customer.custLName, CustomerPassword.passwordHash, CustomerPassword.passwordSalt
--from Customer
--	join CustomerPassword
--	on Customer.customerID = CustomerPassword.customerId;

create nonclustered index idk_Customer_customerIDcustFNamecustLName
	on dbo.Customer
(
	customerID ASC,
	custFName ASC,
	CustLName ASC
);

create nonclustered index idk_CustomerPassword_passwordHashpasswordSalt
	on dbo.CustomerPassword
(
	passwordHash,
	passwordSalt
);

/*
select productNum, price, color, quantity, productPhotoThumb
from Product
*/

create nonclustered index idk_Product_productNumPriceColorProductPhotoThumb
	on dbo.Product
(
	productNum ASC
	, price ASC
	, color
);

create view vSalesOrderLine_Totals
as

select SalesOrderLine.salesOrderLineNumber, Sum(SalesOrderLine.quantityOrdered * SalesOrderLine.price) as lineTotal
from SalesOrderLine
	join Sales
	on SalesOrderLine.orderNumber = Sales.orderNumber
where Sales.orderShipped = 'true'
group by SalesOrderLine.salesOrderLineNumber;

insert into Product values('CUP001234', 15.00, 3.00, 'WHITE', 'A001', 5, 50, 'A nice 12oz mug to hold only your choicest beverages.', 'Coffee Cup')
;
insert into Product values('MAT001234', 8.00, 1.12, 'BLACK', 'A002', 3, 50, 'All your cubical farm friends will rave when they see this beauty, your very own Ben Not Stallmen Mouse pad. Made of organic neoprene this will surely be a delight to your office toils.', 'Mouse Pad')
;
insert into Product values('CUP005678', 13.55, 2.00, 'BLACK', 'A001', 3, 50, 'Be organized is Bens motto, well maybe. What ever it is that is his guruish montra you will certainly know where to stick your pens and pencils. If you do not just ask he will tell you. This baby talks to you. So when your board forget Stallman ask Ben.', 'Pencil Cup')
;
insert into Product values('TSHPEN1515', 25.00, 2.00, 'WHITE', 'A003', 1, 50, 'Get this wonderfully comfortable, 100% inorganic cotton t-shirt with Ben, not Stallmans, fantastic mug on it. We only sell large shirts because that is what Ben wears and why would you want to wear anything else?', 'Shirt')
;
insert into Product values('BEN151234', 10.00, 1.25, 'CLEAR', 'A001', 8, 50, 'Do you like Beer? Do you like cider? Well Ben does. So buy these pint glasses and enjoy that brew that you do. Heck if you play your cards right maybe you someday can drink one with Stallman, he could always use a friend.', 'Pint Glass')

