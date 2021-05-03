require_relative "lib/game"
require_relative "lib/question"
require "rexml/document"
require "timeout"

QUESTIONS_COUNT = 5

# Прочитать все файлы
file_path = File.join(__dir__, "data", "questions.xml")

doc = REXML::Document.new(File.read(file_path))

questions =
  doc.get_elements("questions/question").map do |xml_node|
    Question.from_xml_node(xml_node)
  end


# Выбрать из них 5 случайных вопросов
game = Game.new(questions.sample(QUESTIONS_COUNT))

# Задать вопрос (для каждого вопроса)
game.questions.each do |question|
  puts question

  user_input =
    Timeout.timeout(question.time) do
      STDIN.gets.to_i
    end

  if question.right_answer?(user_input)
    puts "Верно!"
    game.update_points_and_right_answers(question.points, 1)
  else
    puts "Неверно!"
    puts "Правильный ответ: #{question.right_answer}"
  end

rescue Timeout::Error
  puts "Время вышло"
  break
end

# Вывести результат
puts game.result
