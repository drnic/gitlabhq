redis_config = File.join(Rails.root, "config", "redis.yml")
if File.exist?(redis_config)
  config = YAML.load_file(redis_config)
  Resque.redis = config['uri'] # redis://HOST:PORT
end
Resque.watch_queue(PostReceive.instance_variable_get("@queue"))
