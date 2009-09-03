module ProtocolsHelper
  def passed_tests
    number_of_passed = 0
    @protocol.challenges.each do |ch|
      number_of_passed +=1  if ch.is_valid? == ch.result
    end
    number_of_passed
  end

  def count_challenges
    number_of_ch = 0
    @protocol.challenges.each do |ch|
      number_of_ch +=1
    end
    number_of_ch   
  end
end
