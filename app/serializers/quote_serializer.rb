class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :quote, :editable

  def editable
    scope == object.user
  end
end
