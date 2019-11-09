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
* Users can discover new items with the randomised suggestions found on the home page.
* Users can purchase any available items, with the shipping costs and delivery timeframe being automatically calculated based on their location and added to the purchase price.

***

***

## Site planning & Design

### User stories

- Buyer
- Seller
- Browser

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

### Detail any third party services that your app will use

#### Stripe

* The application uses Stripe as a payment gateway, passing product & user information, as well as a price including delivery cost. Stripe returns data that is then passed to both the *Payments* table of the database for purchase history, and the payment success page, providing the user with their order number and relevant transactional information.

#### Australia Post Delivery API

* The application uses the AusPost 

### Describe your projects models in terms of the relationships (active record associations) they have with each other

### Discuss the database relations to be implemented in your application

### Provide your database schema design

### Describe the way tasks are allocated and tracked in your project

### General thoughts on development & future improvements

* Try using Tailwind instead of Bootstrap due to greater customisability of classes etc
* Transactional emails
* Further security
* View other users accounts, leave reviews & messaging functions