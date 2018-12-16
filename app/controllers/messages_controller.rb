class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  def show
    @message = Message.find(params[:id])
  end
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = 'Messageは正常に投稿されました。'
      redirect_to @message
    else
      flash.now[:danger] = 'Messageは投稿されませんでした。'
      render :new
    end
  end
  def edit
    @message = Message.find(params[:id])
    
  end
  def update
    @message = Message.find(params[:id])

    if @message.update
      flash[:success] = 'Messageは正常に更新されました。'
      redirect_to @message
    else
      flash.now[:danger] = 'Messageは更新できませんでした。'
      render :edit
    end
  end
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    
    flash[:success] = 'Messageは正常に削除されました。'
    redirect_to root_url
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  
end
