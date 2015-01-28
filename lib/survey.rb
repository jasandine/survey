class Survey < ActiveRecord::Base
  before_save(:capitalize_title)



  private

  define_method(:capitalize_title) do
    self.title = title.capitalize
  end

end
