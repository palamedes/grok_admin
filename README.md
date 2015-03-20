# GrokAdmin

This is a proof of concept mountable engine in Rails 4 that should provide an administration for editing all of the models in the application. 

The first iteration of this editor is a raw table editor which will give you access to the table as if you were in an sql editor.
The second version will extend that raw table editor to add a more robust admin system for each of the various models that a user can override.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grok_admin', :git => 'git://github.com/palamedes/grok_admin.git'
```

_Note: this gem isn't published yet, so the :git path is required_

## Routing

In your routes file add the following line, where `:administration` is the route you would like to use as your admin route.

```ruby
grokadmin_to :administration
```

## Making model fields editable

In order to allow fields to be edited you must add the `grok_admin_editable` method call to the top of your models with a list of all the fields that are allowed to be edited.

Not adding this to the model means no fields are editable, but the model will still show up.

Calling just `grok_admin_editable` with no arguments means ALL fields are editable.

To allow editing of specific fields you simply pass them to the method as an array;

```grok_admin_editable :foo, :bar, :baz```

Or use the `:only` convention;

```grok_admin_editable only: :foo```
or
```grok_admin_editable only: [:foo, :bar, :baz]```

You may also the `:except` convention to get ALL except the list;

```except: :foo```
or 
```except: [:foo, :bar]```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/grok_admin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## TODO
#### Notes to myself on things that need to be done, in no particular order.

  * Pagination of lists using JSON
  * Get Saving working for edits
  * Get Error reporting to work when saving fails due to error
  * Get Deleting working for edits
  * Get Relationship resources to display as a drop down
  * Get Add record working
  * Move this initial code into a "table editor" controller as this is the raw table editor stuff
  * Get a config file to work so the user installing it can say which model is the "user" model
  * Give them a way to detect if a user ".is_admin?" or ".has_role :admin" or something.
  * Create model method for setting which attributes are editable and which are not
  * Create model method for setting which attributes are visible and which are not
  * Create model method for setting if a model is to be hidden entirely
  * Figure out how to get STI models instead of the base model.. that will be interesting
  * If a user closes accordion while editing, undo all edits.
  
  