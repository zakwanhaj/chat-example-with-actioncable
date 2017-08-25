## README

This is a testing project of Mini Chat System. It demonstrates how, the new feature in Rails 5, Action Cable works.
The app contains 3 models: Sessions, Channels and Messages (Without using DB).

#### Ruby version
2.4.0

### System dependencies
* Redis (in case you're running the app in production ENV.)
```
sudo apt-get install redis-server
```

### Configuration
1. Installing Ruby version management either [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv) or whatever you're familiar with.

2. Installing `Bundler` gem:
```
gem install bundler
```

3. Installing the required application gems:
```
bundle install
```


### Running the App
Type in Terminal `rails s` then go to your browser and open http://localhost:3000/

To pass Login form, pick one of followings:

| Username | Password |
| -------- |:--------:|
| emran    | emran    |
| zakwan   | zakwan   |
