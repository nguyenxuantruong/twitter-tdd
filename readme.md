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

**Configure Capybara**
*# spec/rails_helper.rb*

```
require 'capybara/rails'

mkdir spec/features
```

**Configure database_cleaner and Include the factory_girl methods**
*#	 spec/rails_helper.rb*

```
RSpec.configure do |config|

	config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
```
