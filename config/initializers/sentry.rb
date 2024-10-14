Sentry.init do |config|
  config.dsn = "https://5a64df421e68c61e90731aa9a4ca6aac@o1265120.ingest.sentry.io/4506058671063040"
  config.enabled_environments = %w[production, staging]
  config.breadcrumbs_logger = [ :active_support_logger, :http_logger ]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 0.2
  # or
  # config.traces_sampler = lambda do |context|
  #   true
  # end
end
