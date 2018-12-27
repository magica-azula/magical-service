# Magical Service

Magical Service helps build service objects through a single act.

## Features

* Single action processing data through `provide` and clear output of delivery stage
* Possibility of simple predefined stages for data processing
* Special declaration syntax for service actions. Ex.: `stage` and `mainstay`
* A convenient structure to standardize and facilitate the use of service objects

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'magical-service'
```

And then execute:
```bash
$ bundle
```

## Usage

### Basic Service Definition

`provide` act as a single action to the service, so is necessary predefine the stages and the delivery action.

```ruby
class ModelService < ActionService::Base
  before_confection do
    define_stages [:foo, :baz]
    define_delivery :bar
  end

  stage :foo do
    # body omitted
  end

  stage :baz do
    # body omitted
  end

  stage :bar do
    # body omitted
  end
end
```

### Sample Use

Once defined the service object you can take benefit of the `provide` method which
will process all defined stages and will return the delivery stage output.
`provide` also can receive two optional arguments `params:` and `options:`

```ruby
  ModelService.provide(params: { num: 1 }, options: [2, 3])
```

### Confection Structure

```ruby
  before_confection do
    define_params :params # define default params for the service - optional
    define_options :options # define default options for the service - optional
    define_stages [:stages] # define the stages for the service - optional
    define_delivery :delivery # define the delivery output for the service
  end
```

### Stages & Mainstay

Use stage to define the service's members of its processing chain. Mainstay is pretty
the same of stage but for `helper` methods which is not called directed on the stages' chain.

```ruby
  stage :bar do
    # body omitted
  end

  mainstay :bar do
    # body omitted
  end
```

## Contributing

It's our desire to work together with everyone interested in this kind of project.
Every comment, suggestion or opinion we get makes this gem just a little bit better.
Feel free to open tickets or send pull requests with improvements. Thanks in advance for your help!

Any grammatical issue or misspelling word reported is also a lot of help.

Please see [contribution check](https://github.com/magica-azula/magical-service/blob/master/CONTRIBUTING.md) for details on contributing

## Running Tests

We use [RSpec](http://rspec.info/) for testing. To run tests use the following command:

```bash
$ rspec
```

## License

Magical Service is released under the [MIT License](https://opensource.org/licenses/MIT).
