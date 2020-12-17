class ComplementsController < ApplicationController
  def new
    @complaint = Complaint.find(params[:complaint_id])
    @complement = Complement.new
  end

   def create
    @complaint = Complaint.find(params[:complaint_id])
    @complement = Complement.new(complement_params)
    @complement.complaint = @complaint
    if @complement.save
      redirect_to root_path, notice: 'O complemento de sua denúncia foi recebido e será encaminhado para análise. Obrigado.'
    else
      flash[:alert] = "Algo deu errado."
      render :new
    end
  end

  def show
    @complement = Complement.find(params[:id])
  end

  private

  def complement_params
    params.require(:complement).permit(:additional_information,  attachments: [])
  end

end
