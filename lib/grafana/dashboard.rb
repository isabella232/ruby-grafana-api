module Grafana

  module Dashboard

    def create_slug(text)
      text.gsub!(/[()]/, "")
      if text =~ /\s/
        if text =~ /-/
          text = text.gsub(/\s+/, "").downcase
        else
          text = text.gsub(/\s+/, "-").downcase
        end
      end
      return text
    end

    def get_dashboard_list()
      endpoint = "/api/search"
      @logger.info("Attempting to get dashboard list (GET /api/search)") if @debug
      return get_request(endpoint)
    end

    def get_dashboard(name='')
      name = self.create_slug(name)
      endpoint = "/api/dashboards/db/#{name}"
      @logger.info("Attempting to get dashboard (GET /api/dashboards/db/#{name})") if @debug
      return get_request(endpoint)
    end

    def create_dashboard(properties={}, template=true)
      endpoint = "/api/dashboards/db"
      if template
        dashboard = self.build_template(properties)
        @logger.info("Creating dashboard from template: #{properties['title']} (POST /api/dashboards/db)") if @debug
        return post_request(endpoint, dashboard)
      else
        @logger.info("Creating dashboard: #{properties['dashboard']['title']} (POST /api/dashboards/db)") if @debug
        return post_request(endpoint, properties)
      end
    end

    def delete_dashboard(name)
      name = self.create_slug(name)
      data = self.get_dashboard( name )
      id   = data['dashboard']['id'] ? data['dashboard']['id'] : nil

      endpoint = "/api/dashboards/db/#{name}"
      @logger.info("Deleting dahsboard ID #{id} (DELETE #{endpoint})") if @debug
      return delete_request(endpoint)
    end

    def get_home_dashboard()
      endpoint = "/api/dashboards/home"
      @logger.info("Attempting to get home dashboard (GET #{endpoint})") if @debug
      return get_request(endpoint)
    end
    
    def get_dashboard_tags()
      endpoint = "/api/dashboards/tags"
      @logger.info("Attempting to get dashboard tags(GET #{endpoint})") if @debug
      return get_request(endpoint)
    end

    def search_dashboards(params={})
      raise 'No query specified' unless params.has_key?('query')

      query = CGI::escape(params['query'])
      tag = params['tag']
      starred = params['starred'] && params['starred'].is_a?(TrueClass)

      endpoint = "/api/search/?query=#{query}"
      endpoint += "&tag=#{tag}" if tag
      endpoint += "&starred=#{starred}" if starred

      @logger.info("Attempting to search for dashboards (GET #{endpoint})") if @debug
      return get_request(endpoint)
    end

  end

end
