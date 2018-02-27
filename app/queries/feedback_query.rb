class FeedbackQuery
  attr_reader :collection, :page

  def initialize(page:)
    @page = page.to_i > 0 ? page : 1
  end

  def perform
    apply_collection
    apply_direction
    apply_paginate
    collection
  end

  private

  def apply_collection
    @collection = Feedback.all
  end

  def apply_direction
    @collection = collection.order(created_at: :desc)
  end

  def apply_paginate
    @collection = collection.page(page).per(20)
  end
end
