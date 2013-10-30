# WeakParameters
Validates `params` in your controller.

## Installation
```ruby
gem "weak_parameters"
```

## Usage
```ruby
# Rails Case
# WeakParameters provides `validates` class method to define validations.
class RecipesController < ApplicationController
  validates :create do
    string :name, required: true, except: ["charlie", "dave"]
    integer :type, only: 1..3
    string :quantity do |value|
      value =~ /\A\d+(?:\.\d+)g\z/
    end
  end

  def create
    respond_with Recipe.create(params.slice(:name, :type))
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

```ruby
# Sinatra Case
class App < Sinatra::Base
  include WeakParameters::Sinatra
  use WeakParameters::Middleware

  post 'recipes' do
    validates do
      string :name, required: true
      integer :type
    end

    Recipe.create(params).to_xml
  end

  def validation_error exception, env
    [400, { "Content-Type" => "text/html; charset=utf-8" }, [ "exception.message"]]
  end
end
```

### Available validators
* any
* array
* float
* hash
* integer
* string
* boolean (= 0, 1, false, true)

### Avilable options
* required
* only
* except
* handler

## Tips
WeakParameters.stats returns its validation metadata, and this is useful for auto-generating API documents.
With [autodoc](https://github.com/r7kamura/autodoc), you can auto-generate API documents with params information.

https://github.com/r7kamura/autodoc
