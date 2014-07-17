Yelpish
=======

Yelpish is a RubyMotion iOS app that uses the Yelp API to list 20 nearby business sorted by distance to the users current location. The app also caches the business information into CoreData to allow useage when the phone is not connected to the internet.

This is primarily a coding challenge to practice applying programming patterns, such as MVC, to a mobile app. Requires RubyMotion to run.

To run the app:

1. Clone this repo.
2. Navigate to the directory in your terminal.
3. Run ```bundle install```.
4. Create ```api.rb``` file in the ```config/``` directory.
5. Add your Yelp API key into the ```api.rb``` file: ```YWSID = 'XXXXXXXXXXXXXX-XXXXXXX'```.
6. Make sure your device is provisioned to run iOS apps.
7. Run ```rake``` from the command line.
