require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mwguitar
  class Application < Rails::Application
    
    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Load application's view overrides
      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = "zh-CN"
    config.i18n.available_locales = [:zh, :af, :ar, :az, :bg, :bn, :bs, :ca, :cs, :cy, :da, :de, :"de-AT", :"de-CH", :el, :en, :"en-AU", :"en-CA", :"en-GB", :"en-IE", :"en-IN", :"en-NZ", :"en-US", :"en-ZA", :eo, :es, :"es-419", :"es-AR", :"es-CL", :"es-CO", :"es-CR", :"es-MX", :"es-PA", :"es-PE", :"es-US", :"es-VE", :et, :eu, :fa, :fi, :fr, :"fr-CA", :"fr-:CH", :gl, :he, :hi, :"hi-IN", :hr, :hu, :id, :is, :it, :"it-CH", :ja, :kn, :ko, :lo, :vlt, :lv, :mk, :mn, :ms, :nb, :ne, :nl, :nn, :or, :pl, :pt, :"pt-BR", :rm, :ro, :ru, :sk, :sl, :sr, :sv, :sw, :ta, :th, :tl, :tr, :uk, :ur, :uz, :vi, :wo, :"zh-CN", :"zh-HK", :"zh-TW", :"zh-YUE", :"es-EC", :lt, :"sl-SI"]
    config.i18n.default_locale = :"zh-CN"
  end
end
