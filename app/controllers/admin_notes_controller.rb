class AdminNotesController < ApplicationController
  # enum role: { user: 1, admin: 99 }
  # adminのコントローラーの場合
  def create
    user = User.new(user_params)
    user.role = 99
    user.save()
  end


  # userのコントローラーの場合
  def create
    user = User.new(user_params)
    user.role = 1
    user.save()
  end


  # User:1
  # id:
  # name:

  # Book:N
  # id:
  # title:
  # body:
  # user_id:

  # def create
  #   book = Book.new(book_params)
  #   book.user_id = current_user.id
  #   book.save()
  # end


end
