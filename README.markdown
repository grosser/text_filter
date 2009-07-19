Problem
=======
 - Evil hackers try to insert html/script into model fields
 - Too long texts, and any other sort of stuff we need to take care of...

Solution
========
Before asignment apply text filters to the value.
To use something like strip_tags here you should define it on String see [ActionView helpers on String](http://pragmatig.wordpress.com/2009/05/30/all-actionview-helpers-on-strings)

Usage
=====
 - As Rails plugin  `script/plugin install git://github.com/grosser/text_filter.git`
 - As gem `sudo gem install grosser-text_filter --source http://gems.github.com/`

Example:
    class Product < ActiveRecord::Base
      text_filter :title, :description, :with => :strip_tags #=> on each assign: product.title = product.title.strip_tags
      text_filter :summary, :with => [:strip_tags, {:truncate=>5}] #=> on each assign: product.summary = product.summary.strip_tags.truncate(5)
    end

Note: with a multi-key-hash in `:with` order of execution is random (before ruby 1.9), e.g. :truncate=>10, :something_else=>[1,2]

Author
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...