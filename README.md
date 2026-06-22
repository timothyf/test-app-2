# Test App 2

A production-ready Ruby on Rails web application demonstrating a full-stack setup with PostgreSQL, ActiveAdmin, and Vue.js.

---

## Technology Stack

| Layer       | Technology              |
|-------------|-------------------------|
| Language    | Ruby 3.2+               |
| Framework   | Ruby on Rails 7.2       |
| Database    | PostgreSQL (18+)        |
| Admin UI    | ActiveAdmin 3.x         |
| Auth        | Devise 4.x              |
| Frontend    | Vue.js 3 (via importmap)|
| Web server  | Puma                    |

---

## Features

- **Posts resource** – Create, read, update, and delete blog posts with title, body, published flag, and publish date.
- **Admin interface** – Full ActiveAdmin UI at `/admin` for managing posts and admin users.
- **Authentication** – All `/admin` routes are protected via Devise. Unauthenticated access redirects to the sign-in page.
- **Vue.js frontend** – Vue 3 loaded via importmap; a live search/filter widget is embedded on the posts index page.

---

## Prerequisites

Ensure the following are installed on your local machine:

- **Ruby** `>= 3.2` ([rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/) recommended)
- **Bundler** `>= 2.4`
- **Node.js** `>= 18` and **npm** (required for asset compilation tools)
- **PostgreSQL** `>= 18` running locally

---

## Local Setup

### 1. Clone the repository

```bash
git clone https://github.com/timothyf/test-app-2.git
cd test-app-2
```

### 2. Install Ruby dependencies

```bash
bundle install
```

### 3. Configure the database connection (optional)

By default the app connects to PostgreSQL on `localhost:5432` using your current OS user with no password. Override any setting with environment variables:

| Variable        | Default                      | Description                |
|-----------------|------------------------------|----------------------------|
| `DB_HOST`       | `localhost`                  | PostgreSQL host            |
| `DB_PORT`       | `5432`                       | PostgreSQL port            |
| `DB_USER`       | *(OS user)*                  | PostgreSQL username        |
| `DB_PASSWORD`   | *(none)*                     | PostgreSQL password        |
| `DB_NAME`       | `test_app_2_development`     | Development database name  |
| `DB_NAME_TEST`  | `test_app_2_test`            | Test database name         |
| `DATABASE_URL`  | *(none)*                     | Full connection URL (production) |

You can export these in your shell or use a `.env` file with a tool like [dotenv](https://github.com/bkeepers/dotenv).

### 4. Create and migrate the database

```bash
bin/rails db:create
bin/rails db:migrate
```

### 5. Seed the database

Loads the default admin user and sample posts:

```bash
bin/rails db:seed
```

### 6. Start the Rails server

```bash
bin/rails server
```

The application is available at **http://localhost:3000**.

---

## Admin Interface

Navigate to **http://localhost:3000/admin** and sign in with the seeded credentials:

| Field    | Value                 |
|----------|-----------------------|
| Email    | `admin@example.com`   |
| Password | `password`            |

> **Important:** Change the admin password before deploying to production.

From the admin interface you can:

- Manage **Posts** (create, edit, delete, filter, export CSV)
- Manage **Admin Users**
- Leave comments on any resource

---

## Running Tests

```bash
bin/rails test
```

---

## Project Structure

```
app/
  admin/          # ActiveAdmin resource definitions
    dashboard.rb
    admin_users.rb
    posts.rb
  controllers/    # Rails controllers
  javascript/
    application.js
    controllers/  # Stimulus controllers
    vue/          # Vue.js components and app bootstrap
      index.js
  models/         # ActiveRecord models
  views/          # ERB templates
config/
  database.yml    # PostgreSQL connection config
  importmap.rb    # JavaScript pin configuration (includes Vue 3)
  routes.rb       # Application routes
db/
  migrate/        # Database migrations
  seeds.rb        # Default seed data
```

---

## Environment Notes

### Development

- Database errors surface as full page exceptions (`migration_error: :page_load`).
- Verbose query logging is enabled.
- Mailer defaults to `localhost:3000`.

### Test

- Uses a separate `test_app_2_test` database (cleared between runs).

### Production

- Set `DATABASE_URL`, `RAILS_MASTER_KEY`, and `SECRET_KEY_BASE` environment variables.
- Run `bin/rails assets:precompile` before deploying.

---

## License

MIT
