# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many(:posts, class_name: "Post", foreign_key: "board_id")

  def posts
    post_id = self.id

    matching_posts = Post.where({ :board_id => post_id})

    return matching_posts
  end
end
