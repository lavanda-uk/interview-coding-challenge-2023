# WELCOME:

This is an exercise to test your ability to create a ruby program which emulates the behaviour of the unix `wc` command.

# SETUP:

1. Clone this repository and ensure you have ruby installed on your machine (you can change the version of ruby in the `.ruby-version` file to match a different version if you prefer).
2. To familiarize yourself with the `wc` command, execute `wc data/file.txt` in your terminal.
3. You can also execute `man wc` to get more information about the `wc` command.
4. You should see something like this:

```
3 10 60 data/file.txt
```

# EXERCISE:

* Write a ruby program that implements the same behaviour as `wc data/file.txt`
* You do not need to support any command line arguments that `wc` supports
* Ensure that you follow best practices and write clean, readable code
* Write specs for your code to ensure that it works as expected
* TDD (Test Driven Development) is encouraged but not essential
* Please remember to explain your thought process and as you complete the exercise.
* Also consider a future requirement that this feature might need to exposing as web based service
* Whilst we encourage the use of AI tooling, please ensure that you are comfortable and able to understand and explain the code

# HINTS

You can pipe `echo` in to `wc` to run it against arbitrary text:

```
echo -n "foo\nbar" | wc
```

The `-n` argument supresses a newline at the end of the given string, so `echo -n "foo\n"` and `echo "foo"` are the same`
