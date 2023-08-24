class BookPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user
  end

  def create?
    user
  end

  def show?
    record.user_id == user&.id
  end

  def edit?
    record.user_id == user&.id
  end

  def update?
    record.user_id == user&.id
  end

  def destroy?
    record.user_id == user&.id
  end

  # def update?
  #   user.admin? or not record.published?
  # end
end
