# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview
    def new_post_email
        # Set up a temporary order for the preview
        post = Post.new(title: "Your Post",content: "Hey how is going mailer implementation?", user_id: "7")
        PostMailer.with(post: post).new_post_email
      end
end
