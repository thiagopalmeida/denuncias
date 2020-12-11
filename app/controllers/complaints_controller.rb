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
    # Falta testar esta parte:
    @complaint.user = current_user

    if @complaint.save
      # Alterar rota quando tiver outras páginas.
      redirect_to root_path, notice: "Denúncia criada com sucesso!"
    else
      render :new
    end


  private

  def complaint_params
    params.require(:complaint).permit(:custom, :ni_comp, :year_comp, :keep, :description, :user_id, :know_ni, :name, :address, attachments: [])
  end

end
