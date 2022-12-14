require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Stephen', bio: 'My info') }

  it 'Name attribute should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
