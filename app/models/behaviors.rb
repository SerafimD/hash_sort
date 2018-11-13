class Behavior < ActiveRecord::Base
  validate :check_properties_size

  private

  def check_properties_size
    return true if properties.size <= 10
    self.errors.add('Ошибка', 'Не более 10')
  end
end