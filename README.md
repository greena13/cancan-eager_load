Eager load associations to check hash conditions.

## Why is this needed?

When checking a user has the ability to perform an action on an instance using a deeply nested hash, it's possible to encounter expensive N+1 queries, which slow your application down.

```ruby
# ability.rb
def initialize(user)
  return unless user.present?
  
  # User can see Posts before they're published, of the authors they're mentoring
  can :show, Post, status: :preview, authors: { mentors: { id: user.id } }
end    
        
# Controllers
def show
  @post = Post.find(params[:id])
                         
  # Causes an N+1 problem - a separate SQL query is made to find the mentors of each author
  authorize! :show, @post
end
```  

It's possible to audit your code and manually eager load the associtions needed for each permission check, but that's slow, error prone and likely to get out of sync if you redefine your abilities.

Or you could use `cancan-eager_load` to automatically do it for you.  
 
## Installation

Add this line to your application's Gemfile:

    gem 'cancan-eager_load'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cancan-eager_load

## Usage

Just use CanCanCan's helper methods as normal: `authorize!`, `can?` and `cannot?`

