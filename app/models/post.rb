class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :select
  belongs_to_active_hash :vs_soldier
  belongs_to_active_hash :vs_wizard
  belongs_to_active_hash :vs_monk
  belongs_to_active_hash :vs_fighter
  belongs_to_active_hash :vs_gunner

  validates :select_id, numericality: { other_than: 1, message: 'を選択してください'}
  validates :vs_soldier_id,:vs_wizard_id,:vs_monk_id,:vs_fighter_id,:vs_gunner_id, presence: true, inclusion: { in: -2..2, message: 'の相性を選択してください' }
end
