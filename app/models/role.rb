class Role < ActiveRecord::Base
  def admin?
    name == "admin"
  end
end
