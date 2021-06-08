class Config
  attr_reader :batch_size_min, :batch_size_max, :split_margin_min, :split_margin_max, :random_seed, :rng

  def initialize(config_data)
    @batch_size_min = config_data[:batch_size_min]
    @batch_size_max = config_data[:batch_size_max]
    @split_margin_min = config_data[:split_margin_min]
    @split_margin_max = config_data[:split_margin_max]
    @random_seed = config_data[:random_seed]
    @rng = generate_rng
  end

  def generate_rng
    if @random_seed
      Random.new(@random_seed)
    else
      rng = Random.new
      @random_seed = rng.seed
      rng
    end
  end
end