class Room < ApplicationRecord
  belongs_to :house

  validates :name, :theme, presence: true

  # accepts_nested_attributes_for :house

  def house_attributes=(house_params)
    binding.pry
    
    house_params[:location].empty? && house_params[:size].empty? 
  
    #     self.house = House.new(house_params)
    #   end
    # end 
  end
end
