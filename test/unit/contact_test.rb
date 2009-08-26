require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_a_full_contact_valid
    @contact = Contact.find(people(:one).id)
    assert @contact.save
  end

  def test_a_not_full_contact_not_valid
    @contact = Contact.find(people(:two).id)
    assert_equal( @contact.save, false)
  end

  def test_a_vrong_person_contact_not_valid
    @contact = Contact.find(people(:tree).id)
    assert_equal( @contact.save, false)
  end
end
