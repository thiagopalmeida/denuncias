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
    @complaint.status = "recebida"
    @admins = User.where(admin: true)
    @admins_ids = @admins.ids
    @complaint.admin_user = @admins_ids.sample
    @complaint.rating = (set_rating * 6.67).round # Ajuste para ser até 100.
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
      :category_ids,
      attachments: []
    )
  end

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  def set_rating
    @rating = 0
    # Tamanho da Descrição da Denúncia
    # Maior que 100 palavras: 2 | Maior que 400 palavras: 3
    if @complaint.description.split.size > 400
      @rating += 3
    elsif @complaint.description.split.size > 100
      @rating += 2
    else
      @rating += 0
    end

    # Informou NI => 2
    @rating += 2 if @complaint.ni_comp?

    # Ano => Menor que 2016: 1 | 2017 e 2018: 3 | 2019 e 2020: 2
    if @complaint.year_comp == 2019 || @complaint.year_comp == 2020
      @rating += 2
    elsif @complaint.year_comp == 2017 || @complaint.year_comp == 2018
      @rating += 3
    else
      @rating += 1
    end

    # Ilícito continua ocorrendo? => Sim 3 | Não 0
    @rating += 3 if @complaint.keep == "Sim"

    # Possui anexo? => Sim 2 | Não 0
    @rating += 2 if @complaint.with_attach?

    # Marcou categoria? => Sim 2 | Não 0
    if @complaint_categories_ids.nil?
      @rating += 0
    else
      @rating += 2
    end
  end
end
