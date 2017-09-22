## Alerting Related API Methods
---

The following methods are all relating to alerts

##### Get all alerts:
```ruby
g.get_alerts("dashboardId" => 1, "panelId" => 1, "limit" => 3, "state" => "alerting") # all params are optional
```

##### Get alert:
```ruby
g.get_alert(1)
```

##### Pause alert:
```ruby
g.pause_alert(1)
```

##### Unpause alert:
```ruby
g.unpause_alert(1)
```

##### Get all alert notifications:
```ruby
g.get_alert_notifications()
```

##### Create alert notification:
```ruby
g.create_alert_notification("name" => "notification", "type" => "email", "settings" => { "addresses" => "alert@example.com" })
```

##### Update alert notification:
```ruby
g.update_alert_notification(1, "id" => 1, "name" => "new notification", "type" => "email")
```

##### Delete alert notification:
```ruby
g.delete_alert_notification(1)
```
