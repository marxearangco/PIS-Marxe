class InformationController < ApplicationController
  before_action :find_patient, only: [:edit, :update, :destroy]
  # before_action :authenticate_user!

  def index
  end

  def show
    render 'patients/show'
  end

  def create
  end

  def update
    @id = @info.patient_id
    if @info.update(patient_info)
      flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> Patient information updated..."
      redirect_to patient_path(@id)
    else
      render 'edit'
    end
  end

  def destroy
    @info.destroy
    flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> Patient information updated..."
    redirect_to root_path
  end

  def new
  end

  def edit
  end

  private

  def find_patient
    @info = Information.find(params[:id])
  end

  def patient_info
    params.require(:information).permit(:status, :sex, :age, :bday,   
                                        :occupation, :homephone, :businessphone, :mobilephone, :referredby, :spouse,
                                        :email)
  end
end
