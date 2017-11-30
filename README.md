# WeakParameters [![Build Status](https://travis-ci.org/r7kamura/weak_parameters.svg?branch=master)](https://travis-ci.org/r7kamura/weak_parameters)
Validates `params` in your controller.

## Installation
```ruby
gem "weak_parameters"
```

## Usage
```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :json

  rescue_from WeakParameters::ValidationError do
    head 400
  end
end

# WeakParameters provides `validates` class method to define validations.
class RecipesController < ApplicationController
  validates :create do
    string :name, required: true, except: ["charlie", "dave"], strong: true
    integer :type, only: 1..3, strong: true
    string :quantity do |value|
      value =~ /\A\d+(?:\.\d+)g\z/
    end
    date :date, format: ["%Y/%m/%d", "%Y.%m.%d"]
    time :time, format: "%Y/%m/%d %H:%M:%S"
  end

  def create
    # pass the only parameters with strong option. like strong parameters.
    respond_with Recipe.create(permitted_params)
  end
end
```

```ruby
irb(main):001:0> app.accept = "application/json"
=> "application/json"
irb(main):002:0> app.post "/recipes", name: "alice", type: 1
=> 201
irb(main):003:0> app.post "/recipes", name: "alice"
=> 201
irb(main):004:0> app.post "/recipes", type: 1
=> 400
irb(main):005:0> app.post "/recipes", name: "alice", type: "bob"
=> 400
```

### Available validators
* any
* array
* float
* hash
* integer
* string
* boolean (= 0, 1, false, true)
* file
* object
* list
* date (= default %Y-%m-%d)
* time (= default %Y-%m-%d %H:%M:%S)

### Available options
* required
* only
* except
* handler
* strong
* format (only for date and time)

## Tips
WeakParameters.stats returns its validation metadata, and this is useful for auto-generating API documents.
With [autodoc](https://github.com/r7kamura/autodoc), you can auto-generate API documents with params information.

https://github.com/r7kamura/autodoc
