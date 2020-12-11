class ComplementsController < ApplicationController
  def new
    @complaint = Complaint.find(params[:complaint_id])
    @complement = Complement.new
  end

   def create
    @complaint = Complaint.find(params[:complaint_id])
    @complement = Complement.new(complement_params)
    @complement.complaint = @complaint
    @complement.user = current_user
    if @complement.save
      redirect_to @complaint, notice: 'O complemento de sua denúncia foi recebido e será encaminhado para análise. Obrigado.'
    else
      flash[:alert] = "Algo deu errado."
      render :new
    end
  end

  private

  def complement_params
    params.require(:complement).permit(:additional_information,  documents: [])
  end

end
