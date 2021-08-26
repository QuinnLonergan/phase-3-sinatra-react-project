class UserController < Sinatra::Base
    
    get '/users' do
        users = User.all
        users.to_json(methods: [:format_date])
    end

    get '/users/:id' do
        user = User.find(params[:id])
        user.to_json(include: {reviews: {methods: [:imdb_id, :title, :year, :poster, :genre, :plot, :rating]}})
    end

end
