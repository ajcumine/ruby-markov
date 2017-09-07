require 'markov'

describe 'markov' do
  context 'create_chain' do
    it 'creates a markov chain from the text provided of order 1' do
      text = ['a', 'cat', 'in', 'a', 'hat']
      order = 1
      expected_chain = {
        "a" => ['cat', 'hat'],
        "cat" => ['in'],
        "in" => ['a'],
        "hat" => [],
      }
      expect(create_chain(text, order)).to eq(expected_chain)
    end

    it 'creates a markov chain from the text provided of order 2' do
      text = ['a', 'cat', 'in', 'a', 'hat']
      order = 2
      expected_chain = {
        "a cat" => ['in'],
        "cat in" => ['a'],
        "in a" => ['hat'],
        "a hat" => [],
        "hat" => [],
      }
      expect(create_chain(text, order)).to eq(expected_chain)
    end
  end

  context 'build_text_array' do
    it 'takes text and order 2 and builds an array of 2 word strings' do
      text = ['a', 'cat', 'in', 'a', 'hat']
      order = 2
      expect(build_text_array(text, order)).to eq(['a cat', 'cat in', 'in a', 'a hat', 'hat'])
    end

    it 'takes text and order 3 and builds an array of 3 word strings' do
      text = ['a', 'cat', 'in', 'a', 'hat']
      order = 3
      expect(build_text_array(text, order)).to eq(['a cat in', 'cat in a', 'in a hat', 'a hat', 'hat'])
    end
  end

  context 'generate_text' do
    it 'generates text from the markov chain' do
      body = 'a cat in a hat'
      result = generate_text({ body: body })
      expect(result.length < 140).to eq(true)
      expect(result).to include('a ')
    end

    it 'generates text from the markov chain for a max length of 3 characters' do
      body = 'a cat in a hat'
      max_length = 3
      result = generate_text({ body: body, max_length: max_length })
      expect(result.length < 3).to eq(true)
      expect(result).to eq('a')
    end

    it 'generates text from the markov chain for a order 2' do
      body = 'a cat in a hat'
      order = 2
      result = generate_text({ body: body, order: order })
      expect(result.length < 140).to eq(true)
      expect(result).to eq('a cat in a hat')
    end

    it 'generates text from the markov chain for an initial string' do
      body = 'a cat in a hat'
      initial = 'cat'
      result = generate_text({ body: body, initial: initial })
      expect(result.length < 140).to eq(true)
      expect(result).to start_with('cat')
    end
  end
end
