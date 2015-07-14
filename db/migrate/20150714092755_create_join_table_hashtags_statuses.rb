class CreateJoinTableHashtagsStatuses < ActiveRecord::Migration
  def change
    create_join_table :hashtags, :statuses do |t|
      # t.index [:hashtag_id, :status_id]
      # t.index [:status_id, :hashtag_id]
    end
  end
end
