class ComplaintCategoriesController < ApplicationController
  def new
    @complaint_category = ComplaintCategory.new
  end

  def create
    # @form_categories =
    #   @complaint_categories_ids.each do |id|
    #     ComplaintCategory.new(category_id: id.to_i, complaint_id: @complaint)
    #   end
    # redirect_to root_path, notice: "Denúncia criada com sucesso!" if @form_categories.save
  end
end
