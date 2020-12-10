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
    @complaint.save
  
    redirect_to root_path, notice: 'Sua denúncia foi recebida e será encaminhada para análise. Obrigado.'
  end

  private

  def complaint_params
    params.require(:complaint).permit(:custom, :ni_comp, :year_comp, :keep, :description, :status, documents: [])
  end

end
