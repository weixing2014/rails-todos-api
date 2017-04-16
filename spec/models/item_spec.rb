require 'rails_helper'

describe Item, type: :model do
  describe "validations" do
    it { should belong_to(:todo) }
    it { should validate_presence_of(:name) }
  end
end
