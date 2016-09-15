class UserObserver < ActiveRecord::Observer

  def after_create(user)
    NewUserJob.set(wait: 5.seconds).perform_later(user)
  end

end
