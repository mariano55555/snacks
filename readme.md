# Snack APP API

Snacks App API, is a demo of a simple application for buy snacks, using laravel 5.5
  
# Features!

  - Fractal transformers
  - Gates and policies
  - Laravel Passport for authentication
  - Laravel client views for generating tokens with Vue.js
  - Laravel cors implementation
  - Laravel pagination 
  - Use of mailtrap.io for verify email accounts
  - HATEOAS
  - etc.

### Installation

Snacks App requires:
- [Node.js](https://nodejs.org/)
- [Composer](https://getcomposer.org/)
- [PHP7](https://php.net/)
- [MySQL](https://www.mysql.com/)
- [Laravel5.5](https://laravel.com/)

1. Clone the repository
2. Install the dependencies.

```sh
$ cd snack
$ composer install
$ npm install
```

3. Compile vue.js resources

```sh
$ npm run dev
```
4. Run the db.sql script to create the database with demo records.
5. Generate Passport keys
```sh
$ php artisan passport:keys
```


### ENDPOINTS

Dillinger is currently extended with the following plugins. Instructions on how to use them in your own application are linked below.

#### Users


| Method | Action | Endpoint |Role
| ------ | ------ |------ |------ |
| GET | List all users (Allows pagination, filter, search, etc.) | [http://snacks.dev/users](http://snacks.dev/users) | Admin |
| POST | Create an user (Requires set up an email service credentials in env file) | [http://snacks.dev/users](http://snacks.dev/users) | Admin/User |
| GET | Display an specific user | [http://snacks.dev/users/1](http://snacks.dev/users/1) | Admin / User (Only his own account)
| PUT/PATCH | Update an user account | [http://snacks.dev/users/](http://snacks.dev/users/1) | Admin  / User (Only his own account)|
| DELETE | Delete a user account | [http://snacks.dev/users/1](http://snacks.dev/users/1) | Admin |

#### Products


| Method | Action | Endpoint |Role
| ------ | ------ |------ |------ |
| GET | List all products (Allows pagination, filter, search, etc.) | [http://snacks.dev/products](http://snacks.dev/products) | Admin/User |
| POST | Create a product (It requires to set initial price and stock) | [http://snacks.dev/producs](http://snacks.dev/products) | Admin |
| GET | Display an specific product | [http://snacks.dev/products/1](http://snacks.dev/products/1) | Admin / User |
| POST | Liking a product | [http://snacks.dev/products/1/like](http://snacks.dev/products/1/like) | Admin / User |
| PUT/PATCH | Update an product (Optional parameters: price and stock) | [http://snacks.dev/products/](http://snacks.dev/products/1) | Admin |
| POST | Update price | [http://snacks.dev/products/1/price](http://snacks.dev/products/1/price) | Admin |
| DELETE | Delete a product | [http://snacks.dev/products/1](http://snacks.dev/products/1) | Admin |
| POST | Update stock | [http://snacks.dev/products/1/stock](http://snacks.dev/products/1/stock) | Admin |


#### Invoices (Transactions)


| Method | Action | Endpoint |Role
| ------ | ------ |------ |------ |
| GET | List all transactions (Allows pagination, filter, seacrh, etc.) | [http://snacks.dev/transactions](http://snacks.dev/invoices) | Admin |
| POST | Create a transaction (Buy a product) | [http://snacks.dev/transactions](http://snacks.dev/invoices) | Admin |
| GET | Display an specific transaction | [http://snacks.dev/transactions/1](http://snacks.dev/invoices/1) | Admin / User (Only if the user is the buyer)



### Examples

##### * Generate a token
1. Open the database and query the users table:

    1.1 All passwords are "secret"
    
    1.2 Only the first user has admin role

    For the demo, We will use the following credentials
    
    **Admin user:**
    email:luis.breitenberg@example.net
    password: secret
    
    **Regular user:**
    email:janiya37@example.net
    password: secret

2. Login and generate a token for each user in the "My token" menu
[View Demo](http://screencast-o-matic.com/watch/cbXreO2Ti5)

##### * Users Endpoints
1.  **List all users (Allows pagination, filter, search, etc.)**
    [View basic demo](http://screencast-o-matic.com/watch/cbXrfY2T6Z)
    
    1.1 **Custom pagination number**
    To use a custom pagination number just include per_page attribute in the url (Default: 5 , Min: 2)

    [View custom pagination number demo](http://screencast-o-matic.com/watch/cbXrfO2T6C)

    1.2 **Sort_by and Sort_desc**
    In order to sort the results, use the attribute sort_by equal to the name of the field; by default the sort would be by asc. Use sort_desc attribute to do a sort descendent type
    [View sorting the results demo](http://screencast-o-matic.com/watch/cbXrfy2TXn)

    1.3 **Search/Filter**
    In order to search an attribute, just add the name of the field equal to the search (By default the search would be the equal type). In order to do a search using the "Like" query; add the "filter_like" attribute to the url
    [View search/filter demo](http://screencast-o-matic.com/watch/cbXrfE2TX4)
    
    1.4 **Putting all together**
    Mixing all the options
    [View Putting all together demo](http://screencast-o-matic.com/watch/cbXrfJ2TXE)

2.  **Create a user (Requires set up an email service credentials in env file)**
   [View create user demo](http://screencast-o-matic.com/watch/cbXrhI2Tl7)
    
3. **Display an specific user**
   Only admins and the user owner of the account
   [View display user demo](http://screencast-o-matic.com/watch/cbXrhF2TI1)

4. **Update an user account**
    Only admins and the user owner of the account
    [View update user demo](http://screencast-o-matic.com/watch/cbXrht2TIu)

5. **Delete an user**
    Only admins and the user owner of the account
[View delete user demo](http://screencast-o-matic.com/watch/cbXrhU2TIy)


##### * Products Endpoints
1. **List all products**
   Get the list of products (The resource is using cache...)
   [View get products](http://screencast-o-matic.com/watch/cbXrhG2T2j)
2. **Create a product: It requires to set an initial price and stok**
  [View create products demo](http://screencast-o-matic.com/watch/cbXrhK2T2Z)    
3. **Display a product**
  [View show product demo](http://screencast-o-matic.com/watch/cbXrhN2T2B)

4. **Liking a product**
 if the same user hit likes and he already did hit the like then that would unlike the product
  [View liking product demo](http://screencast-o-matic.com/watch/cbXr1c2T2d)

5. **Update a product**
    Updating a product also allows update price and stock(both would have a log table for the past values)
  [View updating product demo](http://screencast-o-matic.com/watch/cbXr1i2T2P)

6. **Update a price**
    [View updating product´s price](http://screencast-o-matic.com/watch/cbXr162Tof)
7. **Update stock**
   [View updating a product´s stock](http://screencast-o-matic.com/watch/cbXr1l2ToQ)
8. **Delete a product**
    [View deleting a product](http://screencast-o-matic.com/watch/cbXr1D2ToD)

##### * Transactions Endpoints

1. **List all transactions**
   [View list all transactions demo](http://screencast-o-matic.com/watch/cbXr142ToM)
2. **Create a transaction (Buy a snack)**
  [View Buy a product demo](http://screencast-o-matic.com/watch/cbXr1z2To9)
3. **Display an specific transaction**
  [View an specific transaction demo](http://screencast-o-matic.com/watch/cbXr1g2TDV)

### Todos

 - Write a more realistic inventory database model with other entities like suppliers, products transfer, etc
 - Allow users to buy more than one product at the same time
 - Generate an invoice to send automatically by email
 

