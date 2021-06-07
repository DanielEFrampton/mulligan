class ShuffleData
  attr_reader :final_order, :batches, :shuffle_type, :config, :deck_before,
    :random_seed, :piles, :split_point

  def initialize(shuffle_data, deck_before)
    # Create instance methods with arguments.
    @shuffle_type = shuffle_data[:shuffle_type]
    @repetitions = shuffle_data[:repetitions] # not needed here, move up
    @config = shuffle_data[:config].symbolize_keys
    @deck_before = deck_before

    # Save random seed if provided, otherwise generate one and save it
    @random_seed = @config[:random_seed] || generate_random_seed
    # If random seed was provided, generate Random instance with it.
    @rng ||= Random.new(@random_seed)

    # Initialize empty arrays to be populated by generation script.
    @piles = []
    @batches = []

    # Generate shuffled deck.
    @final_order = generate_final_order
  end
  
  def generate_final_order
    if @shuffle_type == 'riffle'
      # Setup

      # Save deck length for repeat use.
      deck_length = @deck_before.length
      # Randomly select split margin from range of min to max numbers.
      split_margin = @rng.rand(@config[:split_margin_min]..@config[:split_margin_max])
      # Randomly select actual split point from range.
      pos_or_neg = @rng.rand(-split_margin..split_margin)
      # Calculate actual split point.
      @split_point = (deck_length / 2) + pos_or_neg
      # Put all cards up to pile split into first pile.
      @piles[0] = @deck_before[0..@split_point-1]
      # Calculate length of remainder of deck.
      pile_2_length = deck_length - @split_point
      # Use pile 2 length to populate second pile.
      @piles[1] = @deck_before[-pile_2_length, pile_2_length]
      # Randomly select first pile.
      current_pile = @rng.rand(0..1)
      # Make copy so we can work destructively with it in main loop.
      working_piles = @piles.deep_dup
      # Initialize batch counter to be incremented in main loop.
      batch_count = 1
      # Create empty array to unshift cards into in main loop.
      final_order = []

      # Main loop
      until working_piles[current_pile].empty?
        # Randomly select batch amount from min-max range.
        batch_amount = @rng.rand(@config[:batch_size_min]..@config[:batch_size_max])
        # Pop that amount from current working pile.
        card_batch = working_piles[current_pile].pop(batch_amount)
        # Prepend that batch to final order.
        final_order.prepend(card_batch)
        # Prepend batch information object to batches array.
        @batches.prepend({
          number: batch_count,
          source_pile: current_pile + 1,
          cards: card_batch
        })
        # Toggle current pile
        current_pile == 0 ? current_pile = 1 : current_pile = 0
        # Increment batch counter
        batch_count += 1
      end

      # Toggle current pile
      current_pile == 0 ? current_pile = 1 : current_pile = 0
      # Put all remaining cards in last batch if other pile has cards remaining
      unless working_piles[current_pile].empty?
        final_order.prepend(working_piles[current_pile])
        @batches.prepend({
          number: batch_count,
          source_pile: current_pile + 1,
          cards: working_piles[current_pile]
        })
      end

      # Return compiled final order, flattened
      final_order.flatten
    else
      raise 'Unsupported shuffle type requested.'
    end
  end
  
  def generate_random_seed
    @rng = Random.new
    @rng.seed
  end
end