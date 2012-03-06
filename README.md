# GAnalytics-rails - a Ruby Gem for Google Analytics

This project is created to simplify usage of Google Analytics tracking functionalities in your Rails apps. 

## How to install?

Add proper line to `Gemfile`:
  
    gem "ganalytics-rails", require: "ganalytics"
    
From now your code would have proper Google Analytics snippet right before `</head>` tag. 
  
That's all! 
  
## Basic usage

You can use any method to track user in Analytics from official API (see: Google Analytics Documentation) like: `_trackPageview`, `_trackEvent`, `_setAccount`, `_addItem` and more with simple Ruby syntax.      

Setting tracker_id and forcing to track pageview looks this way:

    Ganalytics.add_account "UA-XXXXXX-Y"
    Ganalytics.track_pageview

Put this code to your `ApplicationController` body or in `config/initializers/ganalytics.rb` :)

Method `track_pageview` has also optional parameter for alternative URL on which particular pageview should be stored. 

## How to do more?

Instead writing this in javascript:

    _gaq.push(['_trackEvent', 'Map view', 'Zoom in', '+', 5]);
  
You can type:

    Ganalytics.track_event 'Map view', 'Zoom', '+', 5  

Anywhere in your controller code.                                              


In future I will add support for automatic generation of JavaScript code in helpers. 
                                                                                     

## How to disable code insertion?

You can do it in controller with `skip_after_filter` method. Like this:

    skip_after_filter :add_ga_tracking_code
  
Simple! :)

## Google Analytics Documentation

Full Google documentation you can find here:  [http://code.google.com/apis/analytics/docs/index.html](http://code.google.com/apis/analytics/docs/index.html)


## Questions?

Feel free to comment code on GitHub or contact with me on twitter.

Github: [https://github.com/RaVbaker/GAnalytics-rails](https://github.com/RaVbaker/GAnalytics-rails)

Twitter: [@ravbaker](http://twitter.com/ravbaker)                   



Copyright (c) 2012 Rafal "RaVbaker" Piekarski, released under the MIT license.