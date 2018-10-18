# SoftwareBiz - B2B Software Solutions E-commerce

- This was an individual assignment from APU, based on ASP.NET C# with SQL Server database and XML intergration

- XML was mainly used for:
1. Storing and displaying static data for easy maintenance
2. User registration and login based on the user position
3. Storing payment/transaction details to be used for communicating with 3rd-party payment processing systems. 

- Further explanations and diagrams can be seen in the documentation: documentation-softwarebiz.docx
- Screenshots of the final output can be seen in 'screenshots' folder

--------------

- The project revolves around building a B2B e-commerce web application for "SoftwareBiz" which is a firm who sells business softwares for Small-Medium Enterprises (SMEs) in a downloadable form.
- It covers the basic purchase process, such as selecting an item, assigning quantity, checkout, and viewing purchase history.
- It provides functionalities for Web Admin to manage website content by adding, editing, and deleting products as well as approving orders.
- It also supports decision-making for Manager users by providing them with customer and sales data as well as feedback received from customers/prospects.

--------------

##Users and Scope:
###1. Visitor
Description: users who express interest on the company by visiting the website. Most likely to be potential customers.
- Register a customer account
- View products
- View company info
- Send enquiry or feedback
###2. Customer
Description: users who already registered an account and attempt to purchase SoftwareBiz's products online.
- Login
- View products (filtered by category)
- Purchase different products separately in multiple quantity
- Check order status and transaction history
- Download the software products that have been paid for and approved
###3. Administrator
Description: employees of SoftwareBiz who are in charge of managing website content. Their job is to add and manage products and process orders.
- Login
- View an overview of listed products
- Add, edit, delete products
- View a list of orders
- Approve orders
###4. Manager
Description: managers of SoftwareBiz who hold a position in the middle or top management level and are responsible for making decisions within the company.
- Login
- View an overview of all customers
- View a list of orders made by a selected customer
- View an overview of all orders 
- View a list of orders/sales for a specified product
- View messages received from the contact form

-------------

##Major Functions
- Both visitors and customers can view the product catalogue based on category 
- They can then click on a particular item to view more details of the item. However, visitors can only view the products and to checkout they will be prompted to login or sign up. 
- Once their account has been created, they can login using the correct credentials which grants them member privileges such as checkout an order and view order history.
- At checkout, customer will fill in the necessary details for payment and delivery, and once the item is purchased a receipt will be displayed to them.
- They can check their order history and view the order status. If the order has been 'approved' there will be an option to download the software products bought, and after download has been made once, the order status will automatically change to 'completed' and products cannot be re-downloaded again.
- Admin of the website can view, add, update, and delete products; view all orders and update order status. 
- Managers can use the website to gain insights about customers, orders/sales, and feedback received.
