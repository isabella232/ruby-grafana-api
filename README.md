# ruby-grafana-api

[![Gem Version](https://badge.fury.io/rb/grafana-api.svg)](https://badge.fury.io/rb/grafana-api)

## Description

A simple Ruby wrapper for the [Grafana](http://docs.grafana.org/reference/http_api/)  HTTP API.  To include in your project, simply require the grafana library:

```ruby
require 'grafana'
```

## Comments/Notes

If you come across a bug or if you have a request for a new feature, please open an issue.


## Methods & Usage Examples

#### Creating an instance of the grafana api client: 
```ruby
options = {
  "debug" => false,
  "timeout" => 3,
  "ssl" => false
}
g = Grafana::Client.new('[GRAFANA_HOST]', [GRAFANA_PORT], '[GRAFANA_USER]', '[GRAFANA_PASS]', options)
```

#### Connecting to Grafana using an API key:
```ruby
options = {
  "debug" => false,
  "timeout" => 3,
  "ssl" => false,
  "headers" => {
    "Authorization" => "Bearer eiJrIjoidTBsQWpicGR0SzFXD29aclExTjk1cVliMWREUVp0alAiLCJuIjoiR8JhZGFzaG3yFiwiawQIOjE2"
  }
}
g = Grafana::Client.new('[GRAFANA_HOST]', [GRAFANA_PORT], nil, nil, options)
```
*user and pass attributes are ignored when specifying Authorization header*

#### Individual Module Documentation

* [Admin](docs/ADMIN.md) 
* [Alerting](docs/ALERTING.md)
* [Dashboard](docs/DASHBOARD.md) 
* [Datasource](docs/DATASOURCE.md) 
* [Frontend](docs/FRONTEND.md) 
* [Login](docs/LOGIN.md) 
* [Organization](docs/ORGANIZATION.md) 
* [Organizations](docs/ORGANIZATIONS.md) 
* [Snapshot](docs/SNAPSHOT.md) 
* [User](docs/USER.md) 
* [Users](docs/USERS.md) 


## License

Covered by the MIT [license](LICENSE).
