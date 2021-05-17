# Life style Article Web Application

> This a rails app that allow users to signup and login. The signed up user can create an article which is associated to the user's account and it is associated to a category. User is able to vote an article and user is able to bookmark the article as well. Built with Ruby on Rails 6.
## Built With

- Ruby on Rails MVC Framework.

## Getting Started

To set up a local version of this project, a collection of steps have been put together to help guide you from installations to usage. Simply follow the guide below and you'll be up and running in no time.

## Homepage
![Screenshot from 2021-05-10 17-42-05](https://user-images.githubusercontent.com/58520480/117701978-6a91be80-b1b7-11eb-8971-3cb898c09ace.png)

## Category Show page

![Screenshot from 2021-05-10 17-42-35](https://user-images.githubusercontent.com/58520480/117702186-b5133b00-b1b7-11eb-9777-02412249b2b1.png)

## Article show page
![Screenshot from 2021-05-10 17-44-10](https://user-images.githubusercontent.com/58520480/117702583-38cd2780-b1b8-11eb-871e-66bfc29c7639.png)


### Set up

- Install [git](https://git-scm.com/downloads)
- Install [the Ruby programming language](https://ruby-doc.org/downloads/), if you haven't already.
- Install [the Ruby on Rails Framework](https://guides.rubyonrails.org/getting_started.html), if you haven't already.
- Open Terminal
- Navigate to the preferred location/folder you want the app on your local machine. Use `cd <file-path>` for this.
- Run `git clone https://github.com/Rashad-Muntar/ror-capstone.git` to download the source file.
- Now that you have a local copy of the project, navigate to the root of the project folder from your terminal.
- Run `yarn` to install missing dependencies
- Run `bundle install` to install all dependencies in the Gemfile file.
- Install postgres to use database and set up authentication
- Run `rails db:migrate` to generate database tables.
- Run `rails server` to get a server running on your local machine.


### Other Dependencies

- Rubocop: This is a tool for checking code quality and ensuring they meet the requirements. Don’t worry about this if you’re not a developer. Microverse provides a wonderful setup guide for [rubocop here](https://github.com/microverseinc/linters-config/tree/master/ruby).

### Gems Used
- Cloudinary
- Hirb
- active_model_serializers
- active_storage_validations
- cloudinary'


### Usage

At this point, you now have everything you need to properly run the program (source code, ruby, rails, rubocop). If not, refer back to the setup section of this documentation.

To use the program, follow the instructions below:

Sign Up:
   Sign up
- To create a new user, click on the `Sign Up` link and choose a name.
  Sign In:
- To sign in, click on the `Sign In` link and fill in your name.
  Sign out:
- To sign out, click on the `Sign Out` link.

Create a Post:
- First you need to be logged in or sign up.
- To create a new article, type your article name, type in new article, choose categpry, upload image and click 'Post Article' button.

Vote an Article
- vote an article by clicking on the `vote` button in the article's show page.
- unvote an article by clicking on the `unvote` button in the article's show page.

Bookmark an Article
- bookmark an article by clicking on the `bookmark` button in the article show page.
- unbookmark an article by clicking on the `unbookmark` button in the article show page.


##Live version
- Application was deployed to heroku 
- https://fierce-fortress-27372.herokuapp.com/

## Authors

👤 **Rashad Muntar**

- GitHub: [@Rashad-Muntar](https://github.com/Rashad-Muntar)
- Twitter - [@RashadToure](https://twitter.com/RashadToure)
- LinkedIn: [Rashad Muntar](https://www.linkedin.com/in/rashad-muntar/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Rashad-Muntar/ror-social-scaffold/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Micoverse](https://microverse.org)
- [Beehance](https://www.behance.net) by :Nelson Sakwa


## 📝 License

This project is [MIT](https://github.com/Rashad-Muntar/ror-social-scaffold/blob/friendshipv2/LICENSE) licensed.
