class JobAnswerForm
  include ActiveModel::Model

  # Formで使用するプロパティを定義する
  attr_accessor :job, :occupation

  # Validationを定義
  validates :job, presence: true
  validates :occupation, presence: true
end