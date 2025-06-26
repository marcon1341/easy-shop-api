<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  
</head>
<body>

<h1>EasyShop API</h1>
<p>A robust RESTful e-commerce API built with Spring Boot and MySQL.</p>

<h2>Features</h2>
<ul>
    <li>User registration and login (JWT-based authentication)</li>
    <li>Category CRUD for admin</li>
    <li>Product search and listing</li>
    <li>Profile management</li>
    <li>Shopping cart (add, update, clear)</li>
    <li>Order placement and checkout</li>
    <li>All endpoints testable in Postman</li>
</ul>

<h2>Tech Stack</h2>
<ul>
    <li>Backend: Spring Boot, Spring Security, JWT, MySQL</li>
    <li>Build/Tools: Maven, Postman</li>
</ul>

<h2>How to Run Locally</h2>
<ol>
    <li>
        Clone the repository:
        <pre><code>git clone https://github.com/your-username/your-repo.git
cd your-repo</code></pre>
    </li>
    <li>
        Configure Database: Edit <code>src/main/resources/application.properties</code> with your MySQL credentials.
    </li>
    <li>
        Start Backend:
        <pre><code>./mvnw spring-boot:run
# or
mvn spring-boot:run</code></pre>
    </li>
</ol>

<h2>How to Test Endpoints With Postman</h2>
<ol>
    <li>
        <strong>Register a User</strong><br>
        <code>POST /register</code>
        <pre>{
    "username": "newuser",
    "password": "password",
    "role": "USER"
}</pre>
    </li>
    <li>
        <strong>Login</strong><br>
        <code>POST /login</code>
        <pre>{
    "username": "newuser",
    "password": "password"
}</pre>
        Copy the returned <strong>JWT token</strong> and add this header to all requests:<br>
        <code>Authorization: Bearer &lt;your-jwt-token&gt;</code>
    </li>
</ol>

<h3>Category Endpoints</h3>
<ul>
    <li>GET /categories – List all categories</li>
    <li>POST /categories – Add category (as admin)</li>
    <li>GET /categories/{id} – Get category by id</li>
    <li>PUT /categories/{id} – Update category (as admin)</li>
    <li>DELETE /categories/{id} – Delete category (as admin)</li>
</ul>

<h3>Product Endpoints</h3>
<ul>
    <li>GET /products – List/search products (by query)</li>
    <li>GET /products/{id} – Get product by id</li>
    <li>POST /products – Create product (admin)</li>
    <li>PUT /products/{id} – Update product (admin)</li>
    <li>DELETE /products/{id} – Delete product (admin)</li>
</ul>

<h3>Profile Endpoints</h3>
<ul>
    <li>GET /profile – View profile (logged in)</li>
    <li>PUT /profile – Edit profile (logged in)</li>
</ul>

<h3>Shopping Cart Endpoints</h3>
<ul>
    <li>GET /cart – Get cart (logged in)</li>
    <li>POST /cart/products/{id} – Add product to cart</li>
    <li>PUT /cart/products/{id} – Update quantity</li>
    <li>DELETE /cart – Clear cart</li>
</ul>

<h3>Order Endpoints</h3>
<ul>
    <li>POST /orders – Checkout / create order</li>
</ul>

<h2>Example Test Scenarios</h2>
<ul>
    <li>Add Product to Cart (not logged in): Should fail with 401 Unauthorized</li>
    <li>Add Product to Cart (logged in): Should succeed</li>
    <li>Clear Cart: Removes all cart items</li>
    <li>Checkout: Places order, clears cart</li>
</ul>


</body>
</html>
