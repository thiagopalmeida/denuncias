class ComplaintsController < ApplicationController
  def index
    @complaints = Complaint.all
  end

  def show
    @complaints = Complaint.find(params[:id])
  end

  def new
    @complaint = Complaint.new
    @cat_aduana = Category.where(sector: 'Aduana')
    @cat_trib_int = Category.where(sector: 'Tributo Interno')
  end

  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.user = current_user
    # @complaint_categories_ids = params[:complaint][:complaint_categories_id]
    @complaint_categories_ids = params[:complaint][:category_ids]
    @complaint.save
    @complaint_categories_ids.each do |id|
      new = ComplaintCategory.new(category_id: id.to_i, complaint_id: @complaint.id)
      new.save
    end
    redirect_to root_path, notice: "Denúncia criada com sucesso!"
  end

  private

  def complaint_params
    params.require(:complaint).permit(:custom, :ni_comp, :year_comp, :keep, :description, :user_id, :know_ni, :name,
                                      :address, :complaint_categories_id, attachments: [])
  end
end
