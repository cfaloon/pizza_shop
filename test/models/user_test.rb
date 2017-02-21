require "minitest/autorun"

class TestUser < Minitest::Test

  def test_user_model_validations
    user = User.new(first_name: nil, last_name: nil)
    refute user.valid?
    user = User.new(first_name: 'Bilbo', last_name: 'Baggins', email: 'bbaggins@middleearth.net', password: 'theRing')
    assert user.valid?
  end
end
