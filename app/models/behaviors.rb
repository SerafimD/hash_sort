class Behavior < ActiveRecord::Base
  validate :check_properties_size

  private

  def check_properties_size
    return true if properties.size <= 10
    self.errors.add('Error', 'no more than 10')
  end
end
