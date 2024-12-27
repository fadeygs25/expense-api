Dưới đây là file `README.md` hướng dẫn setup và khởi chạy dự án Rails với JWT Authentication (bao gồm JwtDenylist để quản lý token), PostgreSQL, và các yêu cầu cơ bản khác.

```markdown
# Expense API

This is an Expense Management API built with Ruby on Rails. It includes JWT-based authentication with a revocation strategy using a `JwtDenylist`.

## Prerequisites

- Ruby (v3.3.6 or compatible)
- Rails (v8.0.1 or compatible)
- PostgreSQL
- Node.js and Yarn (for managing JavaScript dependencies)
- Bundler (`gem install bundler`)

## Installation Steps

### 1. Clone the repository

```bash
git clone <repository_url>
cd expense-api
```

### 2. Install dependencies

#### Install Ruby dependencies:

```bash
bundle install
```

#### Install JavaScript dependencies:

```bash
yarn install
```

### 3. Set up the database

#### Configure the database:

Update the `config/database.yml` file with your PostgreSQL credentials.

#### Create and migrate the database:

```bash
rails db:create
rails db:migrate
```

### 4. Generate the `JwtDenylist` table

Run the following command to generate the migration for `JwtDenylist`:

```bash
rails generate migration CreateJwtDenylist
```

Update the migration file as follows:

```ruby
class CreateJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    create_table :jwt_denylists do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false

      t.timestamps
    end
    add_index :jwt_denylists, :jti
  end
end
```

Run the migration:

```bash
rails db:migrate
```

### 5. Set up the `User` model

Ensure your `User` model is configured to use `devise` and `devise-jwt`:

```ruby
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
```

### 6. Seed the database (Optional)

You can create default users or other seed data:

```bash
rails db:seed
```

### 7. Run the server

Start the Rails server:

```bash
rails server
```

### 8. API Endpoints

#### Authentication

- **Login**: `POST /users/sign_in`
  - Request Body:
    ```json
    {
      "user": {
        "email": "your_email@example.com",
        "password": "your_password"
      }
    }
    ```
  - Response: Returns a JWT token.

- **Logout**: `DELETE /users/sign_out`

#### CRUD Operations

Define your API endpoints for managing expenses or other resources as needed in the corresponding controllers.

### 9. Run Tests

To ensure everything is set up correctly, run:

```bash
rails test
```

### Troubleshooting

If you encounter issues, ensure the following:

1. All required gems are installed.
2. The database configuration in `config/database.yml` is correct.
3. All migrations have been applied using `rails db:migrate`.

### Contribution

Feel free to fork and submit pull requests for improvements or new features.

---

Happy coding!
```

### Notes:

1. Replace `<repository_url>` with the actual Git repository URL.
2. Modify the API endpoints section based on the specific resources and functionality implemented in your project.
3. Customize the file as needed for your specific project requirements.