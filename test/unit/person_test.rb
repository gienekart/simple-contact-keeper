require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_a_full_person_valid
    @person = Person.find(people(:one).id)
    assert @person.save
  end

  def test_a_not_full_person_valid
    @person = Person.find(people(:two).id)
    assert @person.save
  end

  def test_a_not_full_person_not_valid
    @person = Person.find(people(:tree).id)
    assert_equal( @person.save, false)
  end
  
end
