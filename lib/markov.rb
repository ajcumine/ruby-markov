BODY = "this rainbow has a unicorn flying over it. all the rainbows have pots of gold at the end. a nyan cat is a flying cat with the body of a pop tart that farts rainbows."

def generate_text(params = {})
  body = params[:body] || BODY
  initial = params[:initial]
  order = params[:order] || 1
  max_length = params[:max_length] || 140
  text = body.split
  current_gram_array = initial ? initial.split[0..(order - 1)] : text[0..(order - 1)]
  chain = create_chain(text, order)
  result = [].concat(current_gram_array)
  while(result.join(' ').length < max_length)
    current_gram = current_gram_array.join(' ')
    possibilites = chain[current_gram]
    break if possibilites.to_a.empty?
    follower = possibilites.sample
    break if result.join(' ').length + follower.length + 1 > max_length
    result << follower
    current_gram_array = result[(-order)..-1]
  end

  result.compact.join(' ')
end

def build_text_array(text, order)
  array = []
  while(text.length > 0)
    array << text.take(order).join(' ')
    text.shift
  end
  array.compact
end

def create_chain(text, order)
  chain = {}
  text_array = build_text_array(text, order)
  text_array.each_with_index do |segment, i|
    chain[segment] = [] if !chain[segment]
    chain[segment].push(text_array[i + order].split.first) if text_array[i + order]
  end
  chain
end

puts generate_text()
