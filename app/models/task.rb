class Task < ApplicationRecord
  validates :title, 
            presence: {message: "タイトルを入力してください"},
            length: {minimum: 3, maximum: 255, message: "タイトルは3文字以上256文字以内で入力してください"} # 制限文字数は仮で設定、要件次第で変更可能
end
