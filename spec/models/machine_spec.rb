require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many(:snacks).through(:machine_snacks)}
  end

  describe 'class methods' do
    it 'calculates average snack price in one machine' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = dons.snacks.create(name: "Skittles", price: 1)
      snack_2 = dons.snacks.create(name: "zebra cakes", price: 3)

      expect(dons.snack_avg).to eq(2)
    end
  end
end
