module Grafana

  module Alerting

    def get_alerts(params={})
      endpoint = "/api/alerts"

      params = params.keep_if { |k, _| %w{dashboardId panelId limit state}.include?(k) }

      query = params.map { |k, v| "#{k}=#{v}" }.join('&')
      endpoint += "?#{query}" if query.length > 0

      @logger.info("Attempting to get all alerts (GET #{endpoint})") if @debug
      return get_request(endpoint)
    end

    def get_alert(id)
      endpoint = "/api/alerts/#{id}"
      @logger.info("Attempting to get alert #{id} (GET #{endpoint})") if @debug
      return get_request(endpoint)
    end

    def pause_alert(id)
      endpoint = "/api/alerts/#{id}/pause"
      @logger.info("Attempting to pause alert #{id} (POST #{endpoint})") if @debug
      return post_request(endpoint, {"paused" => true}.to_json)
    end

    def unpause_alert(id)
      endpoint = "/api/alerts/#{id}/pause"
      @logger.info("Attempting to unpause alert #{id} (POST #{endpoint})") if @debug
      return post_request(endpoint, {"paused" => false}.to_json)
    end

    def get_alert_notifications()
      endpoint = "/api/alert-notifications"
      @logger.info("Attempting to get all alert notifications (GET #{endpoint})") if @debug
      return get_request(endpoint)
    end

    def create_alert_notification(alert_notification={})
      endpoint = "/api/alert-notifications"
      @logger.info("Attempting to create alert notification (POST #{endpoint})") if @debug
      return post_request(endpoint, alert_notification.to_json)
    end

    def update_alert_notification(id, alert_notification={})
      endpoint = "/api/alert-notifications/#{id}"
      @logger.info("Attempting to update alert notification (PUT #{endpoint})") if @debug
      return put_request(endpoint, alert_notification.to_json)
    end

    def delete_alert_notification(id)
      endpoint = "/api/alert-notifications/#{id}"
      @logger.info("Attempting to delete alert notification (GET #{endpoint})") if @debug
      return delete_request(endpoint)
    end

  end 

end
