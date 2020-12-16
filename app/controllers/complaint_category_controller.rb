class ComplaintCategoryController < ApplicationController
  def new
    @complaint_category = ComplaintCategory.new
  end
end
