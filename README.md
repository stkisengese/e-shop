# E-Commerce Shop

This is an e-commerce shop application built with **Ruby on Rails**. It allows users to sign up, log in, create product ads, and manage a shopping cart. Guest users can add items to the cart, and their cart persists when they sign up or log in.

---

## Features

- **User Authentication**:
  - Sign up, log in, and log out.
  - Edit user profile (name, email, password).
- **Product Management**:
  - Create, edit, and delete product ads.
  - Add images to products.
- **Shopping Cart**:
  - Add/remove items to/from the cart.
  - View cart total.
  - Empty the cart.
  - Guest users can add items to the cart, and their cart persists after signing up or logging in.

---

## Technologies Used

- **Ruby**: 3.4.1
- **Rails**: 8.0.1
- **Database**: SQLite3 
- **Authentication**: Devise
- **File Uploads**: Active Storage
- **Frontend**: HTML, CSS, ERB

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/stkisengese/e-shop.git
cd e-shop
```

2. Install Dependencies

```bash
bundle install
```

3. Set Up the Database

```bash
rails db:create
rails db:migrate
rails db:seed
```

4. Start the Server

```bash
rails s
```

Visit http://localhost:3000 in your browser.

## Docker run Set-up

```bash
# Build the development image
docker build -t myapp-dev -f .docker/Dockerfile.dev .

# Run the container
docker run -it --rm \
  -v $(pwd):/rails \
  -v bundle:/usr/local/bundle \
  -p 3000:3000 \
  myapp-dev
```

## Usage
Sign Up

    Visit /users/sign_up to create a new account.

Log In

    Visit /users/sign_in to log in.

Create a Product Ad

    Log in and click "Sell" to create a new product ad.

Manage Cart

    Add items to the cart as a guest or logged-in user.

    View your cart at /cart.

    Remove items or empty the cart.


## Routes

    User Authentication:

        Sign up: /users/sign_up

        Log in: /users/sign_in

        Log out: /users/sign_out

    Products:

        List products: /products

        Create product: /products/new

        Show product: /products/:id

        Edit product: /products/:id/edit

    Cart:

        View cart: /cart

        Add item: /cart/add_item/:product_id

        Remove item: /cart/remove_item/:product_id

        Empty cart: /cart

## Contributing

    Fork the repository.

    Create a new branch (git checkout -b feature/your-feature).

    Commit your changes (git commit -m 'Add some feature').

    Push to the branch (git push origin feature/your-feature).

    Open a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

    Devise for authentication.

    Active Storage for file uploads.

    Rails Guides for documentation.

## Contact

For questions or feedback, please contact [Stephen Kisengese](https://github.com/stkisengese).