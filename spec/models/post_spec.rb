require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '相性表の投稿' do
    context '投稿ができる場合' do
      it 'ログインした状態でselect_id,vs_soldier_id,vs_wizard_id,vs_monk_id,vs_fighter_id,vs_gunner_idできる' do
        expect(@post).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'select_idが空では投稿できない' do
        @post.select_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("使用キャラを選択してください")
      end
      it 'vs_soldier_idが空では投稿できない' do
        @post.vs_soldier_id = 3
        @post.valid?
        expect(@post.errors.full_messages).to include("剣士の相性を選択してください")
      end
      it 'vs_wizard_idが空では投稿できない' do
        @post.vs_wizard_id = 3
        @post.valid?
        expect(@post.errors.full_messages).to include("魔法使いの相性を選択してください")
      end
      it 'vs_monk_idが空では投稿できない' do
        @post.vs_monk_id = 3
        @post.valid?
        expect(@post.errors.full_messages).to include("僧侶の相性を選択してください")
      end
      it 'vs_fighter_idが空では投稿できない' do
        @post.vs_fighter_id = 3
        @post.valid?
        expect(@post.errors.full_messages).to include("格闘家の相性を選択してください")
      end
      it 'vs_gunner_idが空では投稿できない' do
        @post.vs_gunner_id = 3
        @post.valid?
        expect(@post.errors.full_messages).to include("銃使いの相性を選択してください")
      end
    end
  end
end
