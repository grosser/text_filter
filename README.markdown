Problem
=======
 - Evil hackers try to insert html/script into model fields
 - Too long texts, and any other sort of stuff we need to take care of...

Solution
========
Before asignment apply text filters to the value.
To use something like strip_tags here you should define it on String see (ActionView helpers on String)[http://pragmatig.wordpress.com/2009/05/30/all-actionview-helpers-on-strings]

Usage
=====
 - As Rails plugin  `script/plugin install git://github.com/grosser/textfilter.git`
 - As gem `sudo gem install grosser-textfilter --source http://gems.github.com/`

    class Product < ActiveRecord::Base
      textfilter :title, :strip_tags #=> product.title = product.title.strip_tags
      textfilter :description, :strip_tags, :truncate=>5 #=> product.title = product.title.strip_tags.truncate(5)
    end

Author
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...