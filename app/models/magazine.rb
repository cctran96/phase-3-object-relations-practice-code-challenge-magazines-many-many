class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    readers.map{|reader| reader.email}.join(";")
  end

  def self.most_popular
    Subscription.all.group(:magazine_id).order('COUNT(magazine_id) DESC').first.magazine
  end
end