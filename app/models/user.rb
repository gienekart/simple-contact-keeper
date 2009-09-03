class User < ActiveRecord::Base
  def my_find(id)
    begin
      @user = User.find(id)
    rescue
      @user = nil
    end
    @user
  end

  def self.authenticate(id, password)
    begin
      @user = User.my_find(id)
      if user
        if user.password = password
          return @user
        end
      end
    rescue # żeby wszelkie błędy kodu i tak dawały fałsz
    end
    return nil
  end
end
