class Achievement < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  # validates :title, uniqueness: true
  validate :unique_title_for_one_user


  enum privacy: [ :public_access, :private_access, :friends_access ]

  def description_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(description)
  end

  private
  def unique_title_for_one_user
    existing_achievement = Achievement.find_by(title: title)

    if existing_achievement && existing_achievement.user == user
      errors.add(:title, "you can't have two achievements with the same title")
    end
  end
end
