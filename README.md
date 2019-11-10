# README - Documentation

![documentation-header](https://user-images.githubusercontent.com/37489963/68439531-fd951580-021b-11ea-9a56-258b172ebb55.jpg)

[Live Website](http://musos-market.herokuapp.com/)

[GitHub Repository](https://github.com/maxPiroddi/marketplace)

***

***

## Instructions for local use

Clone repository:

    git clone https://github.com/maxPiroddi/marketplace

Install gems:

    bundle install

Create and Initialize Database

    rails db:create
    rails db:setup

Run server & navigate to http://localhost:3000/

***

***

## Identifying our issue and proposing our solution

In Australia, musical instrument & accessory sales vary between $400 and $600 million per annum, a huge market with a problematic supply. As there are few Australian owned and run manufacturers, the vast majority of musical equipment is imported from overseas. Due to the resulting higher prices & lower availability of these items, the Australian instrument market is full of used & second hand gear. There is not, however, a dedicated marketplace for these items to be bought and sold for Australian customers.

MusoMarket will be a marketplace aimed at providing the best buying & selling experience for its users, tailored specifically to the needs of musicians which are often overlooked when using other public marketplaces.

***

MusoMarket is, primarily, an application which allows users to buy and sell second hand musical gear, handling the process from listing to sale. The site is targeted towards musicians, collectors and hobbyists looking for an alternative to the larger, less specific online marketplaces.

The site features fully CRUD products & user accounts, product categorization, product condition markers, Australian shipping costs generated via Australia Post, and secure payment processing via Stripe.

The application is built with Ruby on Rails (5.2.3), primarily using HTML, CSS (utilising Bootstrap-Scss) and Ruby, with some Javascript for Bootstrap functionality & Stripe integration. Development of the app has used Git/GitHub for version control, Trello for task tracking, Adobe XD/Photoshop for wireframing/planning, and Heroku for deployment.

***

## Functionality & Features

* Guests may access the site, searching the current listings and finding new and interesting products.
* Guests may sign up and returning users may log in to their password-protected accounts, allowing them to access the user-account and purchasing functionality of the site.
* From their account page, users may edit their details, and delete their account if required. Users can view their current listings, sold items and purchases all in a clean & easily legible format.
* Users can list new items from any page, and edit/delete via the account page or the product page.
* Users can find items easily through the search bar, and can filter through various categories and conditions of items to find their perfect purchase.
* Users can discover new items with the randomized suggestions found on the home page.
* Users can purchase any available items, with the shipping costs and delivery timeframe being automatically calculated based on their location and added to the purchase price.

***

***

## Site planning & Design

### User stories

**As an *account holder*, I need to have a secure account with the marketplace so that I may protect my personal information.**

- As a account holder, I need to have a secure log-in system so that I know my personal and financial information is secure while using the site.
- As a account holder, I need to have the ability to easily navigate my account details and update them when necessary.

**As a *vendor*, I need to easily list items and track active listings so that I can manage my inventory efficiently.**

- As a vendor, I need to have quick access to a listing platform so that I may post multiple items I have for sale with ease.
- As a vendor, I need to be able to track my current listings so that I may know which items have sold.
- As a vendor, I need to be able to easily edit and delete my items, so that I may list them on multiple platforms without worry.

**As a *customer*, I need to easily find and purchase items so that I can have a smooth shopping experience.**

- As a customer, I need to be able to search the marketplace so that I can find what I am looking for.
- As a customer, I need to be able to view item details so that I can make informed purchases.
- As a customer, I need to receive tracking & receipt information after a purchase so that I can keep financial records.
- As a customer, I need to view my past purchases so that I can have a history of which items I have bought.

**As a *browser*, I need to be able to find new and exciting items so that I can gain knowledge about products and consider future purchases.**

- As a browser, I need to be able to search & filter through the marketplace to discover new products.
- As a browser, I need to be suggested new products so that I can find things I normally would not look for.

***

### Sitemap

![market-sitemap](https://user-images.githubusercontent.com/37489963/68441678-ff160c00-0222-11ea-8840-8fed462668cf.jpg)

***

### Wireframing

##### Home Page

![Home Page Wireframe](https://user-images.githubusercontent.com/37489963/67643426-8a61e880-f96b-11e9-841f-32b607165677.jpg)

##### Account Page

![account](https://user-images.githubusercontent.com/37489963/67643449-db71dc80-f96b-11e9-9b02-77b664b16b70.jpg)

##### Search Results

![search-result](https://user-images.githubusercontent.com/37489963/67643453-dc0a7300-f96b-11e9-9366-7186318ab068.jpg)

##### New Listing

![new-listing](https://user-images.githubusercontent.com/37489963/67643452-db71dc80-f96b-11e9-896f-42df7ce3d861.jpg)

##### Edit Listing

![edit-listing](https://user-images.githubusercontent.com/37489963/67643451-db71dc80-f96b-11e9-8efa-b6cfadb2ba5c.jpg)

##### Show Listing

![show](https://user-images.githubusercontent.com/37489963/67643454-dc0a7300-f96b-11e9-8d3f-fe70a8cd5566.jpg)

##### Checkout Page

![checkout](https://user-images.githubusercontent.com/37489963/67643450-db71dc80-f96b-11e9-88ca-353b951d4b48.jpg)

***

### Entity-Relationship Diagram

![db-schema](https://user-images.githubusercontent.com/37489963/68442342-d0009a00-0224-11ea-8104-8646bbe35bf1.jpg)

***

***

## Discussion of the Application

### Explain the different high-level components (abstractions) in your app

In order to meet the project goal of connecting buyers & sellers, a system was created offering CRUD functionality (Create, Read, Update & Delete) for sellable products/listings. The architecture of the application is based around the Model-View-Controller configuration, separating code into distinct and focused components. At the highest level, the Puma web server routes http requests to specific Controllers, which draw data from Models, carry out their required processes and pass the relevant information to the browser via the Views.

The primary actions of the site revolve around available products for sale; products can be created, edited, displayed and deleted via the respective controller. By connecting with multiple database tables, our products controller is able to offer users multiple sources of information for the listing. There are various other actions related to product data, such as randomized database queries to display suggestions to users.

The secondary action of the site concerns user accounts, which are again treated as a CRUD resource. Through the database associations with the user table, users can view their currently listed, sold and previously bought products. User data is passed to the payment gateway when making a purchase, ensuring billing information is stored correctly on the applications end.

### Detail any third party services that your app will use

Production Services:

* [Stripe 5.7](https://stripe.com/au): Stripe is used as the payment gateway of the app, allowing for secure payments to be made and returning the required data for transaction history within the *payment* table.
* [AusPost PAC API](https://developers.auspost.com.au/apis/pac/getting-started): The *Postage Assessment Calculation API* is used to calculate the cost & timeframe of sending available products. Delivery costs are automatically added to the checkout price.
* [http.rb 4.2](https://github.com/httprb/http): Used to interact with the AusPost API, sending and retrieving the required information.
* [Devise 4.7](https://github.com/plataformatec/devise): Devise is used for User authentication & account maintenance.
* [Bootstrap-Sass 3.4.1](https://rubygems.org/gems/bootstrap-sass/versions/3.4.1): Bootstrap is used for quick & responsive styling across the site.
* [Simple_form 5.0](https://github.com/plataformatec/simple_form): Simple form is used to quickly generate forms through Rails, and is well implemented with Devise & Bootstrap, allowing for consistent and responsive form styling.
* [Amazon Web Services S3](https://aws.amazon.com/s3): AWS S3 is used to host user-uploaded images in the cloud, reducing application bloat.
* [Kaminari 1.1](https://github.com/kaminari/kaminari): Pagination gem used to keep the index page legible and organized.
* [Heroku](https://www.heroku.com/): The app was deployed to Heroku, a cloud hosting platform.

Development Services:

* [Down 5.0](https://github.com/janko/down): Gem used to download remote images in order to seed database.
* [Faker 2.6](https://github.com/faker-ruby/faker): Fake data library used to create User accounts and Products while seeding the database.
* [Ultrahook 0.1.5](http://www.ultrahook.com/): Allows the receipt of webhooks on localhost, to ensure payment metadata is received from Stripe after a transaction is completed.

### Discuss the database relations to be implemented in your application

The central table of the application is the Products table, as this serves both the primary function of the app and as the joining table for the rest of the database. The **Products** table holds information related to the product to be sold, primarily its *name, price, description & purchased status*. The table is associated to other tables through foreign keys, allowing each product to hold a **condition** and **category**(stored in respective tables as static records (non-changeable)), a user to whom the product belongs *(user_ID)*, and a location (which is inherited from the owning user).

User information is stored in a **Users** table, featuring key information such as *name, email, postcode and password*. The final table within the database is **Payments**, which holds a user_ID and product_ID, each passed from the aforementioned tables, as well as a Stripe transaction_ID, which is received upon completion of a purchase.

### Describe your projects models in terms of the relationships (active record associations) they have with each other

The functional Active Record Associations that make the above relations possible are as follows:

1. Product attributes: Condition, Category & Images
   * Condition (one-to-many): Each product requires a condition tag, however, each condition record will have multiple products associated with it. As conditions are pre-defined, a user will have the ability to select one while creating their listing, which will be applied.
   * Category (one-to-many): Much the same as above, each product is required to be a part of a category. Only one category may be assigned per product.
   * Images (one-to-one): In order to user AWS S3, image data must be stored within the Active-Storage section of our database, comprising of both the "A.S. Attachments" & "A.S. Blobs" tables. Blobs are linked one-to-one with attachments, which is then linked one-to-one with Products, allowing a single image to be given to each product.

2. Product ownership: Users (one-to-many)
   * Each product requires a user to be the owner of the listing, however, a product may not have multiple owners. This information is applied automatically as the user creates a new product.

3. Product history: Payments/Transactions
   * Once a product is purchased, its information is passed to a record in the payments table. The purchasing user's user_ID is also passed and stored, as is the transaction receipt from our gateway. The User table & Payment table and linked via a one-to-many relationship, allowing one user to make multiple purchases, however, the products table is a one-to-one association, ensuring that each product can only be purchased once and each record can only relate to a single product.

### Provide your database schema design

![db-schema](https://user-images.githubusercontent.com/37489963/68442342-d0009a00-0224-11ea-8104-8646bbe35bf1.jpg)

### Describe the way tasks are allocated and tracked in your project

I used Trello for project management throughout the assignment, listing items *'Backlog', 'Planning', 'Working', 'Testing', and 'Completed'*. As this was an individual project there was little done in the sense of allocation of workloads, however, my general methodology used throughout the project was to plan the next days workload for an hour each evening; researching what needed to be done and writing pseudocode of all tasks to be completed, and then completing these set lists during the day in class.

I found this to be both an efficient and rewarding methodology, as it allowed me to always know what was coming next, stay on top of my workload and ensure that the work was to the best of my ability and thoroughness by avoiding a late-week cram to finish features.

***

***

### General thoughts on development & future improvements

Overall, I was very happy with the project and with my progress throughout. I feel like I have progressed quite well from the last assignment, however, there are still a few features I would like to improve upon in future.

* Try using Tailwind instead of Bootstrap due to greater ability to customize inbuilt styling.
* Implement transactional emails, rather than a static post-transaction page displaying details - this will lead to a better overall user experience.
* The ability to view other users accounts, seeing their other items for sale and providing user reviews. This will allow users to both verify a sellers integrity and find similar items that they will be looking for.
