# WELCOME:

This is an exercise to test your ability to create a ruby program which emulates the behaviour of the unix `wc` command.

# SETUP:

1. Clone this repository and ensure you have ruby installed on your machine (you can change the version of ruby in the `.ruby-version` file to match a different version if you prefer).
2. To familiarize yourself with the `wc` command, execute `wc data/file.txt` in your terminal.
3. You can also execute `man wc` to get more information about the `wc` command.
4. You should see something like this:

```
  3  10  60 data/file.txt
```

# EXERCISE:

1. Write a ruby program that implements the same behaviour as `wc data/file.txt`, don't worry too much about the spacing between the numbers or the filename.
2. Ensure that you follow best practices and write clean, readable code.
3. You should also write specs for your program to ensure that it works as expected, you can use the `rspec` gem to do this - TDD is encouraged but not essential.
4. Please remember to explain your thought process and as you complete the exercise.

# NOTES:

* Whilst we encourage the use of AI tooling such as Copilot and ChatGPT, please ensure that you are able to understand and explain the code that you write.

# BONUS:

* If you have time, you can also look at implementing a simple API using Sinatra to expose your program to the web.