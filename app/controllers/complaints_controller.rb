class ComplaintsController < ApplicationController
  before_action :set_complaint, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: %i[new create ask_login]

  def index
    @complaints = Complaint.all.includes(:user).order(:rating).reverse
  end

  def show
    @complaint = Complaint.find(params[:id])
    @admins = User.where(admin: true)
  end

  def new
    @complaint = Complaint.new
    @cat_aduana = Category.where(sector: 'Aduana')
    @cat_trib_int = Category.where(sector: 'Tributo Interno')
  end

  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.user = current_user
    @complaint_categories_ids = params[:complaint][:categories]
    @complaint.save
    @complaint_categories_ids.each do |id|
      new = ComplaintCategory.new(category_id: id.to_i, complaint_id: @complaint.id)
      new.save
    end
    redirect_to root_path, notice: "Denúncia criada com sucesso!"
  end

  def edit
  end

  def update
    @complaint.status = params[:status]
    @complaint.save
  end

  private

  def complaint_params
    params.require(:complaint).permit(
      :custom, :ni_comp,
      :year_comp, :keep,
      :description, :user_id,
      :know_ni, :name,
      :address, :status,
      :with_attach,
      attachments: []
    )
  end

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end
end
