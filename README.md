# WeakParameters
Validates `params` in your controller.

## Installation
```ruby
gem "weak_parameters"
```

## Usage
```ruby
# WeakParameters provides `validates` class method to define validations.
class RecipesController < ApplicationController
  validates :create do
    string :name, required: true
    integer :type
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

## Tips
WeakParameters.stats returns its definition of validations.
This is useful for auto-generating API documents.

```ruby
WeakParameters::stats[:recipes][:create].validators[0].key       #=> :name
WeakParameters::stats[:recipes][:create].validators[0].required? #=> true
WeakParameters::stats[:recipes][:create].validators[1].key       #=> :type
WeakParameters::stats[:recipes][:create].validators[1].required? #=> false
```
