# Ruby on Rails Chatbot Application

This is a small, fully functional chatbot application developed using Ruby on Rails and the OpenAI API. The objective of this project is to build a user-friendly chatbot platform with the following key features:

## Features

- **User Authentication**: Users can securely register, log in, and log out to access the chatbot interface.

- **Chat Interface**: Upon logging in, users are presented with a chat interface where they can input text and receive responses from the chatbot.

- **Persistent Chat History**: The chat application saves user chat history even if the user refreshes the page, leaves the page, or logs out. This ensures continuity in conversations across sessions.

- **OpenAI Integration**: The application integrates with the OpenAI GPT-3 API to generate responses to user inputs in real-time. The chatbot utilizes advanced language processing capabilities to engage users effectively.

## Setup

To set up this project locally, ensure you have the following prerequisites:

- Ruby 3.0.0
- Ruby on Rails 7.0.6
- PostgreSQL

1. Clone the repository from GitHub:
git clone git@github.com:hammadkhan96/chatgpt_bot.git


2. Install the required gems:
bundle install


3. Set up the database:
rails db:create
rails db:migrate


4. Configure OpenAI API:

   - Sign up for an account on the OpenAI platform.
   - Obtain your API key and ensure it is set up in the application (rails credentials).

5. Start the Rails server:
   ./bin/dev


6. Access the application in your web browser at http://localhost:3000/.

## Technologies Used

- Ruby 3.0.0
- Ruby on Rails 7.0.6
- PostgreSQL
- OpenAI GPT-3.5 API

## Development Process

Throughout the project, the primary focus was on developing robust backend functionality using the latest trends and practices in Ruby on Rails development. Emphasizing security, performance, and efficient data management, the application was designed to provide a solid foundation for the chatbot.

## Contributing

Contributions to this project are welcome. If you encounter any issues or have suggestions for improvement, feel free to open a new issue or submit a pull request.

## Credits

This project is developed by Hammad. Special thanks to Michael for providing the opportunity to work on this exciting test project.

## Authors

This project is licensed under the MIT License.

---
