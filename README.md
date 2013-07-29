Sometimes in the course of development you may need to mock HTTP responses. This is a simple service to return various HTTP responses.

To call each error, simply append the response that you would like returned to the end of this sites URL, like so:

http://mock.isssues.com/{RESPONSE}

These responses are supported and can be called using these HTTP verbs: **GET**, **POST**, **PUT**, **DELETE**, **OPTIONS**, and **PATCH**.

If something is missing-like tests-drop me a line at hello@uncluttah.com or fork the repo and submit a pull request.

## Installation

To get this up and running, first clone the repo. Once you have it, in your sell do this:

```sh
bundle install
bundle exec unicorn
```

That's it.