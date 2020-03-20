# There were errors

See the [errors](errors/) folder, particularly the two `.md` files in it.

# Why do I see no "all" in the name of `smsn-server-*.jar`?

In the `develop` branch of `smsn`, I'm running this to build the .jar:
```
  gradle clean
  gradle :smsn-server:shadowJar
```

After that, there's only one file matching the pattern "smsn-server*.jar", and it doesn't have "all" in the name:

```
[jeff@jbb-dell:~/smsn+/smsn-develop]$ find . -name "smsn-server-*.jar"
./smsn-server/build/libs/smsn-server-1.5.jar

[jeff@jbb-dell:~/smsn+/smsn-develop]$ 
```

# Should I be running the `gradlew` script?

The `develop` branch of `smsn` containns an executable file called `gradlew`, written by Josh, which in his commits he calls a "Gradle wrapper". Should I be using that? Once upon a time my build instructions in docker-smsn included the word "gradlew" but it never got committed and now I don't know what it's for.
