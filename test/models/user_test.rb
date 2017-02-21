require "minitest/autorun"

class TestUser < Minitest::Test

  def test_user_model_validations
    user = User.new
    refute user.valid?
    %i(first_name last_name email password phone_number address).each do |field|
      assert user.errors.keys.include?(field)
    end
    valid_user = User.new(first_name: 'Bill', last_name: 'Smith', email: 'b.smith@domain.com', password: 'starPower', phone_number: '555-562-1010', address: { line_one: '27 Little Ln', line_two: nil, city: 'Durham', state: 'NC', zipcode: '27705' })
    assert valid_user.valid?
  end
end
                    
