# README

## Local setup

1. Install postgres
2. Install/make local ruby version specified in Gemfile
3. Install `bundler` then run

```
bundle install
```

4. Copy config files:

```
cp .env.development.example.yml .env.development
```

5. Update ARTICLES_URL in .env.development to s3 articles json endpoint

```
  ARTICLES_URL=https://s3-eu-west-1.amazonaws.com/CUSTOM_PATH.json
```

6. Create databases 

```
bundle exec rake db:create
bundle exec rake db:migrate
```

7. Run application 

```
./bin/dev
```