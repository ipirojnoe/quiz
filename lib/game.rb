require_relative 'inclinator'

class Game
  include Inclinator

  attr_reader :questions, :points, :right_answers

  def initialize(questions)
    @questions = questions
    @points = 0
    @right_answers = 0
  end

  def update_points_and_right_answers(points, right_answers)
    @points += points
    @right_answers += right_answers
  end

  def size
    @questions.size
  end

  def result
    <<~RESULT
      Вы набрали #{inclined_points}
      Вы ответили правильно на #{inclined_right_answers} из #{size}
    RESULT
  end

  private

  def inclined_points
    "#{points} #{incline(points, "балл", "балла", "баллов")}"
  end

  def inclined_right_answers
    "#{right_answers} #{incline(right_answers, "вопрос", "вопроса", "вопросов")}"
  end
end
