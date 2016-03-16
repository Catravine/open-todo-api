require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list, user: my_user) }
  let(:my_item) { create(:item, list: my_list) }

  it { should belong_to(:list) }

  describe "attributes" do
    it "should respond to name" do
      expect(my_item).to respond_to(:name)
    end
  end
end
