class ShuffleService
  attr_reader :deck_after

  def initialize(deck, shuffle_requests)
    @deck = deck
    @shuffles = []
    # Iterate over shuffle requests
    shuffle_requests.each.with_index do |shuffle, index|
      shuffles_aggregator = []
      # Repeat shuffle data instantiation per repetitions value in request
      shuffle[:repetitions].times do |time|
        # Use original deck only on the first shuffle for first type
        deck_to_use = index == 0 && time == 0 ? @deck : @previous_shuffle_deck
        # Instantiate Config object
        config = Config.new(shuffle[:config])
        # Instantiate shuffle object
        new_shuffle = ShuffleData.new(shuffle[:shuffle_type], config, deck_to_use)
        # Save newly shuffled state to pass to next shuffle
        @previous_shuffle_deck = new_shuffle.final_order
        # Add new shuffle to overall collection
        @shuffles << new_shuffle
      end
    end
  end
  
  def deck_after
    @shuffles.last.final_order
  end

  def serialize
    {
      deck_before: @deck,
      deck_after: deck_after,
      shuffles: @shuffles.map do |shuffle|
        {
          shuffle_type: shuffle.shuffle_type,
          config: shuffle.config,
          split_point: shuffle.split_point,
          final_order: shuffle.final_order,
          piles: shuffle.piles,
          batches: shuffle.batches
        }
      end
    }
  end
end