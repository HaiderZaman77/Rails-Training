class PostMailer < ApplicationMailer
    def new_post_email
        @post = params[:post]
        mail(to: "haider.zaman@coeus-solutions.de", subject: "You got a new post!")
    end
end
