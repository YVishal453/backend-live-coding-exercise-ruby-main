require "pstore" # https://github.com/ruby/pstore

STORE_NAME = "tendable.pstore"
store = PStore.new(STORE_NAME)

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze


# TODO: FULLY IMPLEMENT
def do_prompt
  # Ask each question and get an answer from the user's input.
  yes_answers = []
  QUESTIONS.each_key do |question_key|
    print QUESTIONS[question_key]
    ans = gets.chomp
    # collect only yes answers alsso remove space from ans
    if ['yes', 'y'].include?(ans.delete(' ').downcase)
      yes_answers << ans
    end
  end
  # to calculate avg. rating as with given formula => `100 * number of yes answers / number of questions`
  do_report(yes_answers)
end

def do_report(answers)
  avg_rating = (100 * answers.count) / QUESTIONS.keys.count
  # print avrage rating for all answers
  print "Avrage rating is = #{avg_rating} "
end

do_prompt
