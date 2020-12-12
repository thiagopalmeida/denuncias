class ComplaintsController < ApplicationController
  def index
    @complaints = Complaint.all
  end

  def show
    @complaints = Complaint.find(params[:id])
  end

  def new
    @complaint = Complaint.new
  end

  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.user = current_user
    @complaint_categories_ids = params[:complaint][:complaint_categories_id]
    @complaint.save
    @complaint_categories_ids.each do |id|
      new = ComplaintCategory.new(category_id: id.to_i, complaint_id: @complaint.id)
      new.save
      # Só conseguimos visualizar as categorias quando criamos o complaint_categories_id no model da Complaints.
      # Mas as categorias vinculadas a cada complain devem ser acessadas por @complaint.categories e não por @complaint.complaint_categories_id

      # @complaint.complaint_categories_id = new.id
      # @complaint.save
    end
    redirect_to root_path, notice: "Denúncia criada com sucesso!"
  end

  private

  def complaint_params
    params.require(:complaint).permit(:custom, :ni_comp, :year_comp, :keep, :description, :user_id, :know_ni, :name,
                                      :address, :complaint_categories_id, attachments: [])
  end
end
