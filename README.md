# README

## Local setup

1. Install postgres
2. Ensure postgres is running 

```
eg  brew services restart postgresql@15 if you install via homebrew
```

3. Install/make local ruby version specified in Gemfile

```
eg  rbenv install $(cat .ruby-version)
```

4. Install `bundler` then run

```
bundle install
```

5. Copy config files:

```
cp .env.development.example .env.development
```

6. Update ARTICLES_URL in .env.development to s3 articles json endpoint

```
  ARTICLES_URL=https://s3-eu-west-1.amazonaws.com/CUSTOM_PATH.json
```

7. Create databases 

```
bundle exec rake db:create
bundle exec rake db:migrate
```

8. Run application 

```
./bin/dev
```