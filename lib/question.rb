class Question
  attr_reader :text, :answers, :right_answer, :points, :time

  def self.from_xml_node(xml_node)
    text = xml_node.elements['text'].text
    answer_nodes = xml_node.get_elements('variants/variant')
    answers = answer_nodes.map(&:text)
    right_answer = answer_nodes.find { |node| node.attributes['right'] }.text
    points = xml_node.attributes['points'].to_i
    time = xml_node.attributes['seconds'].to_i

    new(
      text: text,
      answers: answers,
      right_answer: right_answer,
      points: points,
      time: time
    )
  end

  def initialize(text:, answers:, right_answer:, points:, time:)
    @text = text
    @answers = answers.shuffle
    @right_answer = right_answer
    @points = points.to_i
    @time = time.to_i
  end

  def right_answer?(answer_index)
    answers[answer_index - 1] == right_answer
  end

  def to_s
    <<~TO_S
      #{text} (баллов: #{points}, время #{time} сек.)
      #{printable_answer_variants}
    TO_S
  end

  private

  def printable_answer_variants
    answers.map.with_index(1) { |answer, index| "#{index}. #{answer}" }.join("\n")
  end
end
