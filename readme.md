# Twitter Project follow TDD

## Delopment
### Step 1: Generate new project
```
rails new twitter-tdd
```

### Step 2: Configure your Gemfile
```
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
end
```
**Run generators**
```
rails g rspec:install
```