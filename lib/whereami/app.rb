# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/respond_with'

module Whereami
  class App < Sinatra::Base
    register Sinatra::RespondWith

    helpers do
      def infra
        infra_ips.fetch(request.ip, 'unknown')
      end
    end

    get '/' do
      respond_with :index do |f|
        f.json do
          JSON.pretty_generate(
            infra: infra,
            ip: request.ip
          ) + "\n"
        end

        f.txt do
          %W[
            infra=#{infra}
            ip=#{request.ip}
          ].join("\n") + "\n"
        end
      end
    end

    private def infra_ips
      send(:"infra_ips_from_#{config_strategy}")
    end

    private def infra_ips_from_env
      ips_infras = {}

      ENV.each do |key, value|
        next unless key =~ /^WHEREAMI_INFRA_([^_]+)_IPS$/
        infra_name = key.downcase.split('_').fetch(2)
        value.split(/[ ,]/).map(&:strip).each do |ipaddr|
          ips_infras[ipaddr] = infra_name
        end
      end

      ips_infras
    end

    private def config_strategy
      # TODO: use redis/s3/other?
      'env'
    end
  end
end
