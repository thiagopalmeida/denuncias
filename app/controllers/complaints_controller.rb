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
    @complaint_categories_ids = params[:complaint][:category_ids]
    if @complaint.save
      unless @complaint_categories_ids.nil?
        @complaint_categories_ids.each do |id|
          new = ComplaintCategory.new(category_id: id.to_i, complaint_id: @complaint.id)
          new.save
        end
      end
    else
      render :new
    end
    if user_signed_in?
      redirect_to my_complaints_complaints_path, notice: "Denúncia criada com sucesso!"
    else
      redirect_to root_path, notice: "Denúncia criada com sucesso!"
    end
  end

  def edit
  end

  def update
    if params[:myInfo] == "ua_rf"
      @complaint.ua = params[:ua]
      @complaint.comment = params[:comment]
      @complaint.save
      redirect_to complaint_path(@complaint)
    else
      @complaint.status = params[:status]
      @complaint.save
    end
  end

  def my_complaints
    @my_complaints = Complaint.where(user_id: current_user.id)
  end

  private

  def complaint_params
    params.require(:complaint).permit(
      :custom, :ni_comp,
      :year_comp, :keep,
      :description, :user_id,
      :know_ni, :name,
      :address, :status, :ua,
      :with_attach,
      attachments: []
    )
  end

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end
end
