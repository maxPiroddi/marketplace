# README - Documentation

## A link (URL) to your deployed app (i.e. website)

## A link to your GitHub repository (repo)

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

In Australia, musical instrument & accessory sales vary between $400 and $600 million per annum, a huge market with a problematic supply. As there are few Australian owned and run manufacturers, the vast majority of musical equipment is imported from overseas. Due to the resulting higher prices & lower availability of these items, the Australian instrument market is full of used & second hand gear. There is not, however, a dedicated marketplace for these items to be bought and sold for Australian customers.

MusoMarket will be a marketplace aimed at providing the best buying & selling experience for its users, tailored specifically to the needs of musicians which are often overlooked when using other public marketplaces.

***

MusoMarket is, primarily, an application which allows users to buy and sell second hand musical gear, handling the process from listing to sale. The site features fully CRUD products & user accounts, product categorization, product condition markers, Australian shipping cost generation via Australia Post, seller reviews to ensure integrity and secure payment processing via Stripe along with transactional emails via Mailgun.

The application is built with Ruby on Rails, primarily using HTML, CSS and Ruby, with some Javascript for functionality. Development of the app has used Git/GitHub for version control, Trello for task tracking, Adobe XD/Photoshop for wireframing/planning, and Heroku for deployment.

##### Sitemap

![market-sitemap](https://user-images.githubusercontent.com/37489963/67644554-8f786500-f976-11e9-92cf-20752dc5488c.png)

## User stories for your app

## Wireframing

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

## An ERD for your app

##### ERD Diagram

![db-schema](https://user-images.githubusercontent.com/37489963/67643541-d5c8c680-f96c-11e9-80ed-92d4f5639c09.png)

## Explain the different high-level components (abstractions) in your app

## Detail any third party services that your app will use

## Describe your projects models in terms of the relationships (active record associations) they have with each other

## Discuss the database relations to be implemented in your application

## Provide your database schema design

## Describe the way tasks are allocated and tracked in your project

## Search & Sort function Notes

<!--    SEARCH FUNCTION
          <%= form_with url: products_path, method: "get", local: true do |form| %>
            <%= form.label :q %>
            <%= form.text_field :q %>
            
            <%= form.label :sort %>
            <%= form.select([["A-Z", "asc"], ["Z-A", "desc"]])
            <%= form.submit "Search" %>

          <% end %>
-->
<!--   Sort by doesn't care if it's text or integer, only the search     -->
<!--    SORT FUNCTION
          <%= link_to 'Sort by A-Z', products_path + "?sort=asc" %>
          <%= link_to 'Sort by Z-A', products_path + "?sort=desc" %>
-->

## Pagination & Limits
(In the view)
<% for i in 1..@pages %>
    <%= link_to "Page #{i}, products_path + "?page=#{i}" %>
<% end %>

(In the controller)
limit = 5
page = params[:page] ? params[:page].to_i : 1
offset  = (page - 1) * limit

@dogs = Dog.all
@pages - @dogs.count / limit
@dogs - @dogs[offset...(offset + limit)]